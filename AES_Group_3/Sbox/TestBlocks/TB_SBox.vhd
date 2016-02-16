--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:33:52 02/13/2016
-- Design Name:   
-- Module Name:   C:/Xilinx/Projets/S-Box/TB_SBOX.vhd
-- Project Name:  S-Box
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SBox
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
 
ENTITY TB_SBOX IS
END TB_SBOX;
 
ARCHITECTURE behavior OF TB_SBOX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SBox
    PORT(
         Inverse : IN  std_logic;
         Clk : IN  std_logic;
         Data_In : IN  std_logic_vector(7 downto 0);
         Data_Out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal Inverse : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Data_In : std_logic_vector(7 downto 0) := "10011001";

 	--Outputs
   signal Data_Out : std_logic_vector(7 downto 0):= "00000000";

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SBox PORT MAP (
          Inverse => Inverse,
          Clk => Clk,
          Data_In => Data_In,
          Data_Out => Data_Out
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 
		wait for Clk_period*10;
		Data_In <= "11111111";
		
		wait for Clk_period*10;
		Data_In <= "10001000";
		
      wait;
   end process;

END;