--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:22:55 02/15/2016
-- Design Name:   
-- Module Name:   C:/Users/Andrew/Documents/University/4th Year/Coursework/EEE6225 System Design/VHDL Projects/shift_rows/shift_rows_test.vhd
-- Project Name:  shift_rows
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift_rows
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_shift_rows_test IS
END TB_shift_rows_test;
 
ARCHITECTURE behavior OF TB_shift_rows_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_rows
    PORT(
         shiftrows_in : IN  std_logic_vector(127 downto 0);
         shiftrows_out : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal shiftrows_in : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal shiftrows_out : std_logic_vector(127 downto 0):= (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_rows PORT MAP (
          shiftrows_in => shiftrows_in,
          shiftrows_out => shiftrows_out
        );
		process
		begin 
		
		wait for 10 ns;
		shiftrows_in (127 downto 120)<= "11010100"; -- d4
		shiftrows_in (119 downto 112)<= "00100111"; -- 27
		shiftrows_in (111 downto 104)<= "00010001"; -- 11
		shiftrows_in (103 downto 96)<= "10101110"; -- ae
		
		shiftrows_in (95 downto 88)<= "11100000"; -- e0
		shiftrows_in (87 downto 80)<= "10111111"; -- bf
		shiftrows_in (79 downto 72)<= "10011000"; -- 98
		shiftrows_in (71 downto 64)<= "11110001"; -- f1
		
		shiftrows_in (63 downto 56)<= "10111000"; -- b8
		shiftrows_in (55 downto 48)<= "10110100"; -- b4
		shiftrows_in (47 downto 40)<= "01011101"; -- 5d
		shiftrows_in (39 downto 32)<= "11100101"; -- e5
		
		shiftrows_in (31 downto 24)<= "00011110"; -- 1e
		shiftrows_in (23 downto 16)<= "01000001"; -- 41
		shiftrows_in (15 downto 8)<= "01010010"; -- 52
		shiftrows_in (7 downto 0) <= "00110000"; -- 30
		
   end process;

END;
