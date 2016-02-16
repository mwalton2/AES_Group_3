--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:25:11 02/13/2016
-- Design Name:   
-- Module Name:   C:/Xilinx/Projets/S-Box/TB_Bit2Mul.vhd
-- Project Name:  S-Box
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Bit2Mul
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
USE ieee.numeric_std.ALL;
 
ENTITY TB_Bit2Mul IS
END TB_Bit2Mul;
 
ARCHITECTURE behavior OF TB_Bit2Mul IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Bit2Mul
    PORT(
         x : IN  std_logic_vector(1 downto 0);
         y : IN  std_logic_vector(1 downto 0);
         Output : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal x : std_logic_vector(1 downto 0) := "00";
   signal y : std_logic_vector(1 downto 0) := "00";

 	--Outputs
   signal Output : std_logic_vector(1 downto 0):= "00";

 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Bit2Mul PORT MAP (
          x => x,
          y => y,
          Output => Output
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		x <= "00";
		y <= "00";
		wait for 10 ns;
		
		x <= "00";
		y <= "01";
		wait for 10 ns;
		
		x <= "00";
		y <= "10";
		wait for 10 ns;
		
		x <= "00";
		y <= "11";
		wait for 10 ns;
		
		x <= "01";
		y <= "00";
		wait for 10 ns;
		
		x <= "01";
		y <= "01";
		wait for 10 ns;
		
		x <= "01";
		y <= "10";
		wait for 10 ns;
		
		x <= "01";
		y <= "11";
		wait for 10 ns;
		
		x <= "10";
		y <= "00";
		wait for 10 ns;
		
		x <= "10";
		y <= "01";
		wait for 10 ns;
		
		x <= "10";
		y <= "10";
		wait for 10 ns;
		
		x <= "10";
		y <= "11";
		wait for 10 ns;
		
		x <= "11";
		y <= "00";
		wait for 10 ns;
		
		x <= "11";
		y <= "01";
		wait for 10 ns;
		
		x <= "11";
		y <= "10";
		wait for 10 ns;
		
		x <= "11";
		y <= "11";
		wait for 10 ns;
      wait;
   end process;
END;
