----------------------------------------------------------------------------------
-- Company: EEE6225 - System Design
-- Engineer: Matthew Walton
-- 
-- Create Date:	02/13/2016 
-- Design Name: 	Top Level Generic S-BOX
-- Module Name:   MDelta - RTL 
-- Project Name:	Advanced Encryption Standard
-- Target Devices:
-- Tool versions:	
-- Description:
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MDelta is
    Port ( Data : in  STD_LOGIC_VECTOR (7 downto 0);			-- Data input MSB 7:0 LSB
           Output : out  STD_LOGIC_VECTOR (7 downto 0));		-- Data output MSB 7:0 LSB
end MDelta;

architecture RTL of MDelta is

begin	--Performs Forward Operation Multiply X By Delta
	Output <= (
				(Data(5) xor Data(7))
			&	(Data(1) xor Data(2) xor Data(3) xor Data(4) xor Data(6) xor Data(7))
			&	(Data(2) xor Data(3) xor Data(5) xor Data(7))
			&	(Data(1) xor Data(2) xor Data(3) xor Data(5) xor Data(7))
			&	(Data(1) xor Data(2) xor Data(6) xor Data(7))
			&	(Data(1) xor Data(2) xor Data(3) xor Data(4) xor Data(7))
			&	(Data(1) xor Data(4) xor Data(6))
			&	(Data(0) xor Data(1) xor Data(6))
	);
end RTL;

