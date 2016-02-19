----------------------------------------------------------------------------------
-- Company: EEE6225 - System Design
-- Engineer: Matthew Walton
-- 
-- Create Date:	02/13/2016 
-- Design Name: 	Top Level Generic S-BOX
-- Module Name:   Mux 4-1 - RTL 
-- Project Name:	Advanced Encryption Standard
-- Target Devices:
-- Tool versions:	
-- Description:
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4_32 is
    Port ( D1 : in  STD_LOGIC_VECTOR (31 downto 0);					-- Data input MSB 7:0 LSB
           D2 : in  STD_LOGIC_VECTOR (31 downto 0);					-- Data input MSB 7:0 LSB
			  D3 : in  STD_LOGIC_VECTOR (31 downto 0);					-- Data input MSB 7:0 LSB
			  D4 : in  STD_LOGIC_VECTOR (31 downto 0);					-- Data input MSB 7:0 LSB
           S : in   STD_LOGIC_VECTOR (1 downto 0);						-- Multiplex Select 0->D1 & 1->D2
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));				-- Data output MSB 7:0 LSB
end Mux4_32;

architecture RTL of Mux4_32 is

begin
	
	Dout <= D1 when (S = "00") else				-- Output D1
			  D2 when (S = "01") else				-- Output D2
			  D3 when (S = "10") else				-- Output D2
			  D4 when (S = "11") else				-- Output D2
			  x"00000000";								-- Confused So Output NULL
end RTL;
