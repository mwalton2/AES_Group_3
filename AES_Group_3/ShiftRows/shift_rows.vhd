----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:20:43 02/15/2016 
-- Design Name: 
-- Module Name:    shift_rows - Behavioral 
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

entity shift_rows is
    Port ( shiftrows_in : in  STD_LOGIC_VECTOR (127 downto 0);
           shiftrows_out : out  STD_LOGIC_VECTOR (127 downto 0));
end shift_rows;

architecture RTL of shift_rows is

begin
	process (shiftrows_in)
	begin
		shiftrows_out(127 downto 120) <= shiftrows_in (127 downto 120); 	-- S0,0 to S'0,0
		shiftrows_out(95 downto 88) <= shiftrows_in (95 downto 88);			-- S0,1 to S'0,1
		shiftrows_out(63 downto 56) <= shiftrows_in (63 downto 56); 		-- S0,2 to S'0,2
		shiftrows_out(31 downto 24) <= shiftrows_in (31 downto 24); 		-- S0,3 to S'0,3
		
		shiftrows_out(23 downto 16) <= shiftrows_in (119 downto 112); 		-- S1,0 to S'1,3
		shiftrows_out(119 downto 112) <= shiftrows_in (87 downto 80);		-- S1,1 to S'1,0
		shiftrows_out(87 downto 80) <= shiftrows_in (55 downto 48); 		-- S1,2 to S'1,1
		shiftrows_out(55 downto 48) <= shiftrows_in (23 downto 16); 		-- S1,3 to S'1,2
		
		shiftrows_out(47 downto 40) <= shiftrows_in (111 downto 104); 		-- S2,0 to S'2,2
		shiftrows_out(15 downto 8) <= shiftrows_in (79 downto 72); 			-- S2,1 to S'2,3
		shiftrows_out(111 downto 104) <= shiftrows_in (47 downto 40); 		-- S2,2 to S'2,0
		shiftrows_out(79 downto 72) <= shiftrows_in (15 downto 8); 			-- S2,3 to S'2,1
		
		shiftrows_out(71 downto 64) <= shiftrows_in (103 downto 96);  		-- S3,0 to S'3,1
		shiftrows_out(39 downto 32) <= shiftrows_in (71 downto 64); 		-- S3,1 to S'3,2
		shiftrows_out(7 downto 0) <= shiftrows_in (39 downto 32); 			-- S3,2 to S'3,3
		shiftrows_out(103 downto 96) <= shiftrows_in (7 downto 0);  		-- S3,3 to S'3,0
	end process;

end RTL;

