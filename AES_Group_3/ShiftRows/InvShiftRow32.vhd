----------------------------------------------------------------------------------
-- Company: EEE6225 - System Design
-- Engineer: Matthew Walton, Andrew Quarmy
-- 
-- Create Date:	02/19/2016 
-- Design Name: 	Top Level Generic S-BOX
-- Module Name:   Inv Shift Rows - RTL 
-- Project Name:	Advanced Encryption Standard
-- Target Devices:
-- Tool versions:	
-- Description:
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InvShiftRow32 is
    Port ( 	RowSelect : in STD_LOGIC_VECTOR (1 downto 0);
				shiftrows_in : in  STD_LOGIC_VECTOR (31 downto 0);
            shiftrows_out : out  STD_LOGIC_VECTOR (31 downto 0));
end InvShiftRow32;

architecture RTL of InvShiftRow32 is

signal Mux1 : STD_LOGIC_VECTOR (31 downto 0);					-- Forward Mux input
signal Mux2 : STD_LOGIC_VECTOR (31 downto 0);					-- Forward Mux input
signal Mux3 : STD_LOGIC_VECTOR (31 downto 0);					-- Forward Mux input
signal Mux4 : STD_LOGIC_VECTOR (31 downto 0);					-- Forward Mux input

begin
		Mux1(31 downto 24) <= shiftrows_in (31 downto 24); 		-- S0,0 to S'0,0
		Mux1(23 downto 16) <= shiftrows_in (23 downto 16);			-- S0,1 to S'0,1
		Mux1(15 downto 8) <= shiftrows_in (15 downto 8); 			-- S0,2 to S'0,2
		Mux1(7 downto 0) <= shiftrows_in (7 downto 0); 				-- S0,3 to S'0,3
	
		Mux2(23 downto 16) <= shiftrows_in (31 downto 24); 		-- S1,0 to S'1,3
		Mux2(15 downto 8) <= shiftrows_in (23 downto 16);			-- S1,1 to S'1,0
		Mux2(7 downto 0) <= shiftrows_in (15 downto 8); 			-- S1,2 to S'1,1
		Mux2(31 downto 24) <= shiftrows_in (7 downto 0); 			-- S1,3 to S'1,2
		
		Mux3(15 downto 8) <= shiftrows_in (31 downto 24); 			-- S2,0 to S'2,2
		Mux3(7 downto 0) <= shiftrows_in (23 downto 16); 			-- S2,1 to S'2,3
		Mux3(31 downto 24) <= shiftrows_in (15 downto 8); 			-- S2,2 to S'2,0
		Mux3(23 downto 16) <= shiftrows_in (7 downto 0); 			-- S2,3 to S'2,1
		
		Mux4(7 downto 0) <= shiftrows_in (31 downto 24);  			-- S3,0 to S'3,1
		Mux4(31 downto 24) <= shiftrows_in (23 downto 16); 		-- S3,1 to S'3,2
		Mux4(23 downto 16) <= shiftrows_in (15 downto 8); 			-- S3,2 to S'3,3
		Mux4(15 downto 8) <= shiftrows_in (7 downto 0);  			-- S3,3 to S'3,0
		
		HC1 : entity work.Mux4_32 port map(Mux1, Mux2, Mux3, Mux4, RowSelect, shiftrows_out);
end RTL;

