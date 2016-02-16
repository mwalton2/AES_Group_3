----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:16:50 02/12/2016 
-- Design Name: 
-- Module Name:    Bit2Mul - RTL 
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

begin
	--2-bit Multiply
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