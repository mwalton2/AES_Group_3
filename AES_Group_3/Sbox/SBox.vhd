----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:10:53 02/13/2016 
-- Design Name: 
-- Module Name:    SBox - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SBox is
	Port (  Inverse : STD_LOGIC;
			  Clk : STD_LOGIC;
			  Data_In : in  STD_LOGIC_VECTOR (7 downto 0);
           Data_Out : out  STD_LOGIC_VECTOR (7 downto 0)
			);
			  
end SBox;

architecture RTL of SBox is
	--Pipeline 1
	signal Mux1 : STD_LOGIC_VECTOR (7 downto 0);
	signal Mux2 : STD_LOGIC_VECTOR (7 downto 0);
	signal MuxOut : STD_LOGIC_VECTOR (7 downto 0);	
	signal XORData : STD_LOGIC_VECTOR (3 downto 0);
	
	signal TopLatch : STD_LOGIC_VECTOR (3 downto 0);
	signal BottomLatch : STD_LOGIC_VECTOR (3 downto 0);
	signal XORLatch : STD_LOGIC_VECTOR (3 downto 0);
	
	--Pipeline 2
	signal Squared : STD_LOGIC_VECTOR (3 downto 0);
	signal Lamda : STD_LOGIC_VECTOR (3 downto 0);
	signal Multi : STD_LOGIC_VECTOR (3 downto 0);
	
	signal XORData2 : STD_LOGIC_VECTOR (3 downto 0);
	signal XORLatch2 : STD_LOGIC_VECTOR (3 downto 0);
	
	signal TopLatch2 : STD_LOGIC_VECTOR (3 downto 0);
	signal BottomLatch2 : STD_LOGIC_VECTOR (3 downto 0);
	
	--Pipeline 3
	signal Inverted : STD_LOGIC_VECTOR (3 downto 0);
	signal InvertedLatch : STD_LOGIC_VECTOR (3 downto 0);
	
	signal TopLatch3 : STD_LOGIC_VECTOR (3 downto 0);
	signal BottomLatch3 : STD_LOGIC_VECTOR (3 downto 0);
	
	--Pipeline 4
	signal Bit4Multi : STD_LOGIC_VECTOR (7 downto 0);
	signal Bit4MultiTop : STD_LOGIC_VECTOR (3 downto 0);
	signal Bit4MultiBottom : STD_LOGIC_VECTOR (3 downto 0);
	signal Bit4MultiLatch : STD_LOGIC_VECTOR (7 downto 0);
	
	--Pipeline 5
	signal Mux3 : STD_LOGIC_VECTOR (7 downto 0);
	signal Mux4 : STD_LOGIC_VECTOR (7 downto 0);
	
begin
		--Pipeline 1
		HA1 : entity work.MDelta port map(Data_In, Mux1);
		HA2 : entity work.MDeltaAffine port map(Data_In, Mux2);
		HA3 : entity work.Mux2 port map(Mux1, Mux2, Inverse, MuxOut);

		XORData <= (MuxOut(7 downto 4) xor MuxOut(3 downto 0)
						);
		
		HA4 : entity work.Latch4 port map((MuxOut(7 downto 4)), Clk, TopLatch);
		HA5 : entity work.Latch4 port map((MuxOut(3 downto 0)), Clk, BottomLatch);
		HA6 : entity work.Latch4 port map(XORData, Clk, XORLatch);
		
		--Pipeline 2
		HA7 : entity work.SquareX port map(TopLatch, Squared);
		HA8 : entity work.Mlamda port map(Squared, Lamda);
		
		HA9 : entity work.Bit4Mul port map(BottomLatch, XORLatch, Multi);		
		XORData2 <= (Multi xor Lamda);
		
		HA10 : entity work.Latch4 port map(XORData2, Clk, XORLatch2);
		
		HA11 : entity work.Latch4 port map(TopLatch, Clk, TopLatch2);
		HA12 : entity work.Latch4 port map(XORLatch, Clk, BottomLatch2);
		
		--Pipeline 3
		HA13 : entity work.Invert port map(XORLatch2, Inverted);
		HA14 : entity work.Latch4 port map(Inverted, Clk, InvertedLatch);
				
		HA15 : entity work.Latch4 port map(TopLatch2, Clk, TopLatch3);
		HA16 : entity work.Latch4 port map(BottomLatch2, Clk, BottomLatch3);
		
		--Pipeline 4
		HA17 : entity work.Bit4Mul port map( InvertedLatch, TopLatch3, Bit4MultiTop);
		
		--Data_Out <= (TopLatch3 & InvertedLatch);
		
		HA18 : entity work.Bit4Mul port map(InvertedLatch, BottomLatch3, Bit4MultiBottom);
		
		--Data_Out <= ( Bit4MultiBottom & Bit4MultiBottom);
		
		
		Bit4Multi <= (
							Bit4MultiTop(3)
						&	Bit4MultiTop(2)
						&	Bit4MultiTop(1)
						&	Bit4MultiTop(0)
						&	Bit4MultiBottom(3)
						&	Bit4MultiBottom(2)
						&	Bit4MultiBottom(1)
						&	Bit4MultiBottom(0)
						);
						--Data_Out <=  Bit4Multi;
		
		HA19 : entity work.Latch8 port map(Bit4Multi, Clk, Bit4MultiLatch);
		--HA19 : entity work.Latch8 port map("10010000", Clk, Bit4MultiLatch);
		
		--Pipeline 5
		HA20 : entity work.IDeltaAffine port map(Bit4MultiLatch, Mux3);
		HA21 : entity work.IDelta port map(Bit4MultiLatch, Mux4);
		
		HA22 : entity work.Mux2 port map(Mux3, Mux4, Inverse, Data_Out);
		
end RTL;