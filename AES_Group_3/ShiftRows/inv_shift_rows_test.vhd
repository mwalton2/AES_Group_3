--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:10:22 02/17/2016
-- Design Name:   
-- Module Name:   C:/Users/Andrew/Documents/University/4th Year/Coursework/EEE6225 System Design/VHDL Projects/inv_shift_rows/inv_shift_rows_test.vhd
-- Project Name:  inv_shift_rows
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: inv_shift_rows
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
 
ENTITY TB_inv_shift_rows_test IS
END TB_inv_shift_rows_test;
 
ARCHITECTURE behavior OF TB_inv_shift_rows_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT inv_shift_rows
    PORT(
         inv_shift_rows_in : IN  std_logic_vector(127 downto 0);
         inv_shift_rows_out : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inv_shift_rows_in : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal inv_shift_rows_out : std_logic_vector(127 downto 0):= (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: inv_shift_rows PORT MAP (
          inv_shift_rows_in => inv_shift_rows_in,
          inv_shift_rows_out => inv_shift_rows_out
        );

process
		begin 
		
		wait for 10 ns;
		inv_shift_rows_in (127 downto 120)<= "11010100"; -- d4
		inv_shift_rows_in (119 downto 112)<= "10111111"; -- bf
		inv_shift_rows_in (111 downto 104)<= "01011101"; -- 5d
		inv_shift_rows_in (103 downto 96)<= "00110000"; -- 30
		
		inv_shift_rows_in (95 downto 88)<= "11100000"; -- e0
		inv_shift_rows_in (87 downto 80)<= "10110100"; -- b4
		inv_shift_rows_in (79 downto 72)<= "01010010"; -- 52
		inv_shift_rows_in (71 downto 64)<= "10101110"; -- ae
		
		inv_shift_rows_in (63 downto 56)<= "10111000"; -- b8
		inv_shift_rows_in (55 downto 48)<= "01000001"; -- 41
		inv_shift_rows_in (47 downto 40)<= "00010001"; -- 11
		inv_shift_rows_in (39 downto 32)<= "11110001"; -- f1
		
		inv_shift_rows_in (31 downto 24)<= "00011110"; -- 1e
		inv_shift_rows_in (23 downto 16)<= "00100111"; -- 27
		inv_shift_rows_in (15 downto 8)<= "10011000"; -- 98
		inv_shift_rows_in (7 downto 0) <= "11100101"; -- e5
		
   end process;
END;
