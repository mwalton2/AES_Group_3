--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:34:08 02/15/2016
-- Design Name:   
-- Module Name:   C:/Xilinx/Projets/S-Box/TB_IDeltaAffine.vhd
-- Project Name:  S-Box
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IDeltaAffine
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
 
ENTITY TB_IDeltaAffine IS
END TB_IDeltaAffine;
 
ARCHITECTURE behavior OF TB_IDeltaAffine IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IDeltaAffine
    PORT(
         Data : IN  std_logic_vector(7 downto 0);
         Output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Data : std_logic_vector(7 downto 0) := "10001000";

 	--Outputs
   signal Output : std_logic_vector(7 downto 0);
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IDeltaAffine PORT MAP (
          Data => Data,
          Output => Output
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
