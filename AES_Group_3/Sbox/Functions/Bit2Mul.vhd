----------------------------------------------------------------------------------
-- Company: EEE6225 - System Design
-- Engineer: Matthew Walton
-- 
-- Create Date:	02/13/2016 
-- Design Name: 	Top Level Generic S-BOX
-- Module Name:   2-Bit Multiply - RTL 
-- Project Name:	Advanced Encryption Standard
-- Target Devices:
-- Tool versions:	
-- Description:
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bit2Mul is
    Port ( x : in  STD_LOGIC_VECTOR (1 downto 0);
           y : in  STD_LOGIC_VECTOR (1 downto 0);
           Output : out  STD_LOGIC_VECTOR (1 downto 0));
end Bit2Mul;

architecture RTL of Bit2Mul is

	signal a2a : STD_LOGIC;
	signal a2b : STD_LOGIC;
	
	signal a1 : STD_LOGIC;
	signal a2 : STD_LOGIC;
	signal a3 : STD_LOGIC;

begin	--2-bit Multiply
		a2a <= (x(0) xor x(1));
		a2b <= (y(0) xor y(1));

		a3 <= (x(1) and y(1));
		a2 <= (a2a and a2b);
		a1 <= (x(0) and y(0));

	Output <= (
			 (a1 xor a2)
		&	 (a3 xor a1)
	);
end RTL;