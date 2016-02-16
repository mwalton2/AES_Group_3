----------------------------------------------------------------------------------
-- Company: EEE6225 - System Design
-- Engineer: Matthew Walton
-- 
-- Create Date:	02/13/2016 
-- Design Name: 	Top Level Generic S-BOX
-- Module Name:   Inverse Delta - RTL 
-- Project Name:	Advanced Encryption Standard
-- Target Devices:
-- Tool versions:	
-- Description:
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

entity IDelta is
    Port ( Data : in  STD_LOGIC_VECTOR (7 downto 0);
           Output : out  STD_LOGIC_VECTOR (7 downto 0));
end IDelta;

architecture RTL of IDelta is

begin
	--Inverse Delta
	Output <= (
				(Data(1) xor Data(5) xor Data(6) xor Data(7))
			&	(Data(2) xor Data(6))
			&	(Data(1) xor Data(5) xor Data(6))
			&	(Data(1) xor Data(2) xor Data(4) xor Data(5) xor Data(6))
			&	(Data(1) xor Data(2) xor Data(3) xor Data(4) xor Data(5))
			&	(Data(1) xor Data(2) xor Data(3) xor Data(4) xor Data(7))
			&	(Data(4) xor Data(5))
			&	(Data(0) xor Data(2) xor Data(4) xor Data(5) xor Data(6))
	);
end RTL;