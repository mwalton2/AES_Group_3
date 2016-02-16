----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:53:09 02/13/2016 
-- Design Name: 
-- Module Name:    Mux2-1 - Behavioral 
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

entity Mux2 is
    Port ( D1 : in  STD_LOGIC_VECTOR (7 downto 0);
           D2 : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (7 downto 0));
end Mux2;

architecture RTL of Mux2 is

begin
	Dout <= D1 when (S = '0') else
			  D2 when (S = '1') else
			  "00000000";
end RTL;

