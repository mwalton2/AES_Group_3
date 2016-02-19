----------------------------------------------------------------------------------
-- Company: EEE6225 - System Design
-- Engineer: Matthew Walton
-- 
-- Create Date:	02/13/2016 
-- Design Name: 	Top Level Generic S-BOX
-- Module Name:   SBox - RTL 
-- Project Name:	Advanced Encryption Standard
-- Target Devices:
-- Tool versions:	
-- Description:
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SBox8 is
	Port (  Inverse : STD_LOGIC;											-- Set 0 for forward, 1 for inverse
			  Clk : STD_LOGIC;												-- Sync clock
			  Data_In : in  STD_LOGIC_VECTOR (7 downto 0);			-- Data input MSB 7:0 LSB
           Data_Out : out  STD_LOGIC_VECTOR (7 downto 0)			-- Data output MSB 7:0 LSB
			);
			  
end SBox8;

architecture RTL of SBox8 is
	--Pipeline 1
	signal Mux01 : STD_LOGIC_VECTOR (7 downto 0);					-- Forward Mux input
	signal Mux02 : STD_LOGIC_VECTOR (7 downto 0);					-- Reverse Mux input
	signal MuxOut : STD_LOGIC_VECTOR (7 downto 0);				-- Mux output
	signal XORData : STD_LOGIC_VECTOR (3 downto 0);				--	XOR 7:4/3:0
	
	signal TopLatch : STD_LOGIC_VECTOR (3 downto 0);			-- Stored 7:4	-- To pipeline 2
	signal BottomLatch : STD_LOGIC_VECTOR (3 downto 0);		-- Stored 3:0	-- To pipeline 2
	signal XORLatch : STD_LOGIC_VECTOR (3 downto 0);			-- Stored XOR	-- To pipeline 2
	
	--Pipeline 2
	signal Squared : STD_LOGIC_VECTOR (3 downto 0);				-- Sbox X^2 Function Output
	signal Lamda : STD_LOGIC_VECTOR (3 downto 0);				-- Sbox Lamda Fucntion Output
	signal Multi : STD_LOGIC_VECTOR (3 downto 0);				-- 4-bit Multiplier Output
	
	signal XORData2 : STD_LOGIC_VECTOR (3 downto 0);			-- XOR of Top & Bottom Legs
	signal XORLatch2 : STD_LOGIC_VECTOR (3 downto 0);			-- Stored 3:0	-- To pipeline 3
	
	signal TopLatch2 : STD_LOGIC_VECTOR (3 downto 0);			-- To pipeline 3
	signal BottomLatch2 : STD_LOGIC_VECTOR (3 downto 0);		-- To pipeline 3
	
	--Pipeline 3
	signal Inverted : STD_LOGIC_VECTOR (3 downto 0);			-- Signal after inersion X^-1
	signal InvertedLatch : STD_LOGIC_VECTOR (3 downto 0);		-- To pipeline 4
	
	signal TopLatch3 : STD_LOGIC_VECTOR (3 downto 0);			-- To pipeline 4
	signal BottomLatch3 : STD_LOGIC_VECTOR (3 downto 0);		-- To pipeline 4
	
	--Pipeline 4
	signal Bit4Multi : STD_LOGIC_VECTOR (7 downto 0);			-- 4-bit Multi 7:4 & 3:0
	signal Bit4MultiTop : STD_LOGIC_VECTOR (3 downto 0);		-- 4-bit Top Leg
	signal Bit4MultiBottom : STD_LOGIC_VECTOR (3 downto 0);	-- 4-bit Bottom Leg
	signal Bit4MultiLatch : STD_LOGIC_VECTOR (7 downto 0);	-- To pipeline 5
	
	--Pipeline 5
	signal Mux03 : STD_LOGIC_VECTOR (7 downto 0);					-- Multiplexor Signal Forward
	signal Mux04 : STD_LOGIC_VECTOR (7 downto 0);					-- Multiplexor Signal Reverse
	
begin
		--Pipeline 1
		HA1 : entity work.MDelta port map(Data_In, Mux01);									-- Forward Operation
		HA2 : entity work.MDeltaAffine port map(Data_In, Mux02);							-- Inverse Operation
		HA3 : entity work.Mux2_8 port map(Mux01, Mux02, Inverse, MuxOut);				-- Selects A Signal
		XORData <= (MuxOut(7 downto 4) xor MuxOut(3 downto 0));							-- XOR Top and Bottom Signal
		HA4 : entity work.Latch4 port map((MuxOut(7 downto 4)), Clk, TopLatch);		-- 4-Bit Latch to next pipe
		HA5 : entity work.Latch4 port map((MuxOut(3 downto 0)), Clk, BottomLatch);	-- 4-Bit Latch to next pipe
		HA6 : entity work.Latch4 port map(XORData, Clk, XORLatch);						-- 4-Bit Latch to next pipe
		--Data_Out <= ( Data_In );
		
		--Pipeline 2
		HA7 : entity work.SquareX port map(TopLatch, Squared);							-- Top Leg X^2
		HA8 : entity work.Mlamda port map(Squared, Lamda);									-- Top Leg X * Lamda
		
		HA9 : entity work.Bit4Mul port map(BottomLatch, XORLatch, Multi);				-- Bottom Leg 4-bit Multi
		XORData2 <= (Multi xor Lamda);															-- Top XOR Bottom
		HA10 : entity work.Latch4 port map(XORData2, Clk, XORLatch2);					-- 4-Bit Latch to next pipe
		HA11 : entity work.Latch4 port map(TopLatch, Clk, TopLatch2);					-- 4-Bit Latch to next pipe
		HA12 : entity work.Latch4 port map(XORLatch, Clk, BottomLatch2);				-- 4-Bit Latch to next pipe
		
		--Pipeline 3
		HA13 : entity work.Invert port map(XORLatch2, Inverted);							-- X^-1 Inversion
		HA14 : entity work.Latch4 port map(Inverted, Clk, InvertedLatch);				-- 4-Bit Latch to next pipe
		HA15 : entity work.Latch4 port map(TopLatch2, Clk, TopLatch3);					-- 4-Bit Latch to next pipe
		HA16 : entity work.Latch4 port map(BottomLatch2, Clk, BottomLatch3);			-- 4-Bit Latch to next pipe
		
		--Pipeline 4
		HA17 : entity work.Bit4Mul port map(InvertedLatch, TopLatch3, Bit4MultiTop);			-- 4-bit Multi Top
		HA18 : entity work.Bit4Mul port map(InvertedLatch, BottomLatch3, Bit4MultiBottom);	-- 4-bit Multi Bottom
		Bit4Multi <= (	Bit4MultiTop &	Bit4MultiBottom );									-- Add 7:0 -> 7:4 & 3:0
		HA19 : entity work.Latch8 port map(Bit4Multi, Clk, Bit4MultiLatch);			-- 8-Bit Latch to next pipe
				
		--Pipeline 5
		HA20 : entity work.IDeltaAffine port map(Bit4MultiLatch, Mux03);				-- Forward Operation
		HA21 : entity work.IDelta port map(Bit4MultiLatch, Mux04);						-- Reverse Operation
		HA22 : entity work.Mux2_8 port map(Mux03, Mux04, Inverse, Data_Out);			-- Mux Output 
end RTL;