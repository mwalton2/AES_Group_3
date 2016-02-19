----------------------------------------------------------------------------------
-- Company: EEE6225 - System Design
-- Engineer: Matthew Walton
-- 
-- Create Date:	02/13/2016 
-- Design Name: 	Top Level Generic S-BOX
-- Module Name:   SBox_Shift_Rows - RTL 
-- Project Name:	Advanced Encryption Standard
-- Target Devices:
-- Tool versions:	
-- Description:
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SBox_Shift_Rows32 is
	Port (  RowSelect : in  STD_LOGIC_VECTOR (1 downto 0);		-- Which row of 128 bit data? 0 ->00 1 ->01..
			  Inverse : STD_LOGIC;											-- Set 0 for forward, 1 for inverse
			  Clk : STD_LOGIC;												-- Sync clock
			  Data_In : in  STD_LOGIC_VECTOR (31 downto 0);			-- Data input MSB 7:0 LSB
           Data_Out : out  STD_LOGIC_VECTOR (31 downto 0)		-- Data output MSB 7:0 LSB
			);
			  
end SBox_Shift_Rows32;

architecture RTL of SBox_Shift_Rows32 is
	signal SubBytes : STD_LOGIC_VECTOR (31 downto 0);				-- Input After SubBytes
	signal Mux01 : STD_LOGIC_VECTOR (31 downto 0);					-- Forward Mux input
	signal Mux02 : STD_LOGIC_VECTOR (31 downto 0);					-- Reverse Mux input

begin
		HD1 : entity work.Sbox8 port map(inverse, Clk, Data_In (31 downto 24), SubBytes (31 downto 24));
		HD2 : entity work.Sbox8 port map(inverse, Clk, Data_In (23 downto 16), SubBytes (23 downto 16));
		HD3 : entity work.Sbox8 port map(inverse, Clk, Data_In (15 downto 8), SubBytes (15 downto 8));
		HD4 : entity work.Sbox8 port map(inverse, Clk, Data_In (7 downto 0), SubBytes (7 downto 0));
		
		HD5: entity work.ShiftRow32 port map(RowSelect, SubBytes, Mux01);
		HD6: entity work.InvShiftRow32 port map(RowSelect, SubBytes, Mux02);
		HD7 : entity work.mux2_32 port map(Mux01, Mux02, Inverse, Data_Out);
end RTL;