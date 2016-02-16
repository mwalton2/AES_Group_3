----------------------------------------------------------------------------------
-- Company: EEE6225 - System Design
-- Engineer: Matthew Walton
-- 
-- Create Date:	02/13/2016 
-- Design Name: 	Top Level Generic S-BOX
-- Module Name:   Square X - RTL 
-- Project Name:	Advanced Encryption Standard
-- Target Devices:
-- Tool versions:	
-- Description:
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SquareX is
    Port ( Data : in  STD_LOGIC_VECTOR (3 downto 0);			-- Data input MSB 3:0 LSB
           Output : out  STD_LOGIC_VECTOR (3 downto 0));		-- Data output MSB 3:0 LSB
end SquareX;

architecture RTL of SquareX is

begin
	--Performs X^2 Operation
	Output <= (
		 	Data(3)
		&	(Data(3) xor Data(2))
		&	(Data(2) xor Data(1))
		&	(Data(1) xor Data(0) xor Data(3))
	);
end RTL;

