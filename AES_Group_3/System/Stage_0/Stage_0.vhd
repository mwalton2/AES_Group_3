----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:48:22 02/16/2016 
-- Design Name: 
-- Module Name:    Stage0 - Behavioral 
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

entity Stage0 is
    Port ( Plain_Text : in  STD_LOGIC_VECTOR (127 downto 0);
           Cypher_Key : in  STD_LOGIC_VECTOR (127 downto 0);
           State_0 : out  STD_LOGIC_VECTOR (127 downto 0));
			  
end Stage0;

architecture RTL of Stage0 is

begin
	RK : entity work.Round_Key port map ( Plain_Text, Cypher_Key, State_0);
end RTL;

