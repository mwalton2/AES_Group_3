--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:25:32 02/15/2016
-- Design Name:   
-- Module Name:   C:/Xilinx/Projets/S-Box/TB_SquareX.vhd
-- Project Name:  S-Box
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SquareX
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
 
ENTITY TB_SquareX IS
END TB_SquareX;
 
ARCHITECTURE behavior OF TB_SquareX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SquareX
    PORT(
         Data : IN  std_logic_vector(3 downto 0);
         Output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Data : std_logic_vector(3 downto 0) := "0000";

 	--Outputs
   signal Output : std_logic_vector(3 downto 0);
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SquareX PORT MAP (
          Data => Data,
          Output => Output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
       wait for 100 ns;	
		
		Data <= "0000";
		wait for 10 ns;
		
		Data <= "0001";
		wait for 10 ns;
		
		Data <= "0010";
		wait for 10 ns;
		
		Data <= "0011";
		wait for 10 ns;
		
		Data <= "0100";
		wait for 10 ns;
		
		Data <= "0101";
		wait for 10 ns;
		
		Data <= "0110";
		wait for 10 ns;
		
		Data <= "0111";
		wait for 10 ns;
		
		Data <= "1000";
		wait for 10 ns;
		
		Data <= "1001";
		wait for 10 ns;
		
		Data <= "1010";
		wait for 10 ns;
		
		Data <= "1011";
		wait for 10 ns;
		
		Data <= "1100";
		wait for 10 ns;
		
		Data <= "1101";
		wait for 10 ns;
		
		Data <= "1110";
		wait for 10 ns;
		
		Data <= "1111";
		wait for 10 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
