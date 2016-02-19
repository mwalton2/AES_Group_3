----------------------------------------------------------------------------------
-- Company: EEE6225 - System Design
-- Engineer: Matthew Walton
-- 
-- Create Date:	02/13/2016 
-- Design Name: 	Top Level Generic S-BOX
-- Module Name:   Mux 2_8 - RTL 
-- Project Name:	Advanced Encryption Standard
-- Target Devices:
-- Tool versions:	
-- Description:
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2_8 is
    Port ( D1 : in  STD_LOGIC_VECTOR (7 downto 0);					-- Data input MSB 7:0 LSB
           D2 : in  STD_LOGIC_VECTOR (7 downto 0);					-- Data input MSB 7:0 LSB
           S : in  STD_LOGIC;												-- Multiplex Select 0->D1 & 1->D2
           Dout : out  STD_LOGIC_VECTOR (7 downto 0));			-- Data output MSB 7:0 LSB
end Mux2_8;

architecture RTL of Mux2_8 is

begin
	Dout <= D1 when (S = '0') else				-- Output D1
			  D2 when (S = '1') else				-- Output D2
			  "00000000";								-- Confused So Output NULL
end RTL;

