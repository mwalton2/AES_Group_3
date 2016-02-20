----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:44:48 02/20/2016 
-- Design Name: 
-- Module Name:    Transpose - Behavioral 
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

entity Transpose is
	Port ( Transpose_In : in STD_LOGIC_VECTOR ( 127 downto 0);
			 Tranpose_Out : out STD_LOGIC_VECTOR (127 downto 0));

end Transpose;

architecture Behavioral of Transpose is

begin

	Tranpose_Out (127 downto 120) <= Transpose_In (127 downto 120);
	Tranpose_Out (87 downto 80) <= Transpose_In (87 downto 80);
	Tranpose_Out (47 downto 40) <= Transpose_In (47 downto 40);
	Tranpose_Out (7 downto 0) <= Transpose_In (7 downto 0);
	
	
	Tranpose_Out (119 downto 112) <= Transpose_In (95 downto 88);
   Tranpose_Out (95 downto 88) <= Transpose_In (119 downto 112);
	
	Tranpose_Out (111 downto 104) <= Transpose_In (63 downto 56);
	Tranpose_Out (63 downto 56) <= Transpose_In (111 downto 104);
	
	Tranpose_Out (103 downto 96) <= Transpose_In (31 downto 24);
	Tranpose_Out (31 downto 24) <= Transpose_In (103 downto 96);
	
	Tranpose_Out (23 downto 16) <= Transpose_In (71 downto 64);
	Tranpose_Out (71 downto 64) <= Transpose_In (23 downto 16);
	
	Tranpose_Out (15 downto 8) <= Transpose_In (39 downto 32);
	Tranpose_Out (39 downto 32) <= Transpose_In (15 downto 8);
	
   Tranpose_Out (55 downto 48) <= Transpose_In (79 downto 72);
	Tranpose_Out (79 downto 72) <= Transpose_In (55 downto 48);



end Behavioral;

