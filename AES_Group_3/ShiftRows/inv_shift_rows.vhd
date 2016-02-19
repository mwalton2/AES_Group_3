----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:51:29 02/17/2016 
-- Design Name: 
-- Module Name:    inv_shift_rows - Behavioral 
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

entity inv_shift_rows is
    Port ( inv_shift_rows_in : in  STD_LOGIC_VECTOR (127 downto 0);
           inv_shift_rows_out : out  STD_LOGIC_VECTOR (127 downto 0));
end inv_shift_rows;

architecture rtl of inv_shift_rows is

begin
process (inv_shift_rows_in)
	begin
		inv_shift_rows_out( 127 downto 120) <= inv_shift_rows_in( 127 downto 120); 	--S0,0to S'0,0
		inv_shift_rows_out( 95 downto 88) <= inv_shift_rows_in( 95 downto 88); 			--S0,1 to S'0,1
		inv_shift_rows_out( 63 downto 56) <= inv_shift_rows_in(63 downto 56); 			--S0,2 to S'0,2
		inv_shift_rows_out( 31 downto 24) <= inv_shift_rows_in(31 downto 24); 			--S0,3 to S'0,3
		
		inv_shift_rows_out( 87 downto 80) <= inv_shift_rows_in( 119 downto 112 ); 		--S1,0 to S'1,1
		inv_shift_rows_out( 55 downto 48) <= inv_shift_rows_in( 87 downto 80); 			--S1,1 to S'1,2
		inv_shift_rows_out( 23 downto 16) <= inv_shift_rows_in( 55 downto 48); 			--S1,2 to S'1,3
		inv_shift_rows_out( 119 downto 112) <= inv_shift_rows_in(23 downto 16); 		--S1,3 to S'1,0
		
		inv_shift_rows_out( 47 downto 40) <= inv_shift_rows_in( 111 downto 104); 		--S2,0 to S'2,2
		inv_shift_rows_out( 15 downto 8) <= inv_shift_rows_in( 79 downto 72); 			--S2,1 to S'2,3
		inv_shift_rows_out( 111 downto 104) <= inv_shift_rows_in( 47 downto 40); 		--S2,2 to S'2,0
		inv_shift_rows_out( 79 downto 72) <= inv_shift_rows_in( 15 downto 8); 			--S2,3 to S'2,1
		
		inv_shift_rows_out( 7 downto 0) <= inv_shift_rows_in( 103 downto 96); 			--S3,0 to S'3,3
		inv_shift_rows_out( 103 downto 96) <= inv_shift_rows_in( 71 downto 64); 		--S3,1 to S'3,0
		inv_shift_rows_out( 71 downto 64) <= inv_shift_rows_in( 39 downto 32); 			--S3,2 to S'3,1
		inv_shift_rows_out( 39 downto 32) <= inv_shift_rows_in( 7 downto 0); 			--S3,3 to S'3,2
	end process;

end rtl;

