----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:07 02/12/2016 
-- Design Name: 
-- Module Name:    SquareX - Behavioral 
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

entity SquareX is
    Port ( Data : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end SquareX;

architecture RTL of SquareX is

begin
	--Square X
	Output <= (
			
		 	
		 	
		 	Data(3)
		&	(Data(3) xor Data(2))
		&	(Data(2) xor Data(1))
		&	(Data(1) xor Data(0) xor Data(3))
	
		--	(Data(1) xor Data(0) xor Data(3))
	--	 &	(Data(2) xor Data(1))
	--	 &	(Data(3) xor Data(2))
	--	 &	Data(3)
	);
end RTL;
