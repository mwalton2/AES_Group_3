----------------------------------------------------------------------------------
-- Company: EEE6225 - System Design
-- Engineer: Matthew Walton
-- 
-- Create Date:	02/13/2016 
-- Design Name: 	Top Level Generic S-BOX
-- Module Name:   Latch 4 - RTL 
-- Project Name:	Advanced Encryption Standard
-- Target Devices:
-- Tool versions:	
-- Description:
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Latch4 is
    Port ( Signal_In : in  STD_LOGIC_VECTOR (3 downto 0);				-- Data input MSB 3:0 LSB
           Clk : in  STD_LOGIC;													-- Sync Signal
           Signal_Out : out  STD_LOGIC_VECTOR (3 downto 0));			-- Data output MSB 3:0 LSB
end Latch4;

architecture RTL of Latch4 is

begin
	--process (Clk)
	--begin
	--	if Clk'event and Clk = '1' then
	--		Signal_Out <= Signal_In;
	--	end if;
	--end process;
	
	process
	begin
		wait until Clk'event and Clk = '1' ;
		Signal_Out <= Signal_In;
	end process;
	
end RTL;

