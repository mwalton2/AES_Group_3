----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:12:13 02/16/2016 
-- Design Name: 
-- Module Name:    LAT128 - Behavioral 
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

entity LAT128 is
    Port ( Signal_In : in  STD_LOGIC_VECTOR (127 downto 0);
           Clk : in  STD_LOGIC;
           Signal_Out : out  STD_LOGIC_VECTOR (127 downto 0));
end LAT128;



architecture RTL of LAT128 is

begin
	process
	begin
		--Signal_Out <= "0000";
		wait until Clk'event and Clk = '1' ;
		Signal_Out <= Signal_In;
		end process;
end RTL;



