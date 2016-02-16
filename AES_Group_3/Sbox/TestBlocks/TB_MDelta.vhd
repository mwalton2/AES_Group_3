--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:25:38 02/13/2016
-- Design Name:   
-- Module Name:   C:/Xilinx/Projets/S-Box/TB_MDelta.vhd
-- Project Name:  S-Box
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MDelta
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
 
ENTITY TB_MDelta IS
END TB_MDelta;
 
ARCHITECTURE behavior OF TB_MDelta IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT MDelta
    PORT(
         Data : IN  std_logic_vector(7 downto 0);
         Output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
 
   --Inputs
   signal Data : std_logic_vector(7 downto 0) := "00000000";
 	--Outputs
   signal Output : std_logic_vector(7 downto 0) := "00000000";
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: MDelta PORT MAP (
          Data => Data,
          Output => Output
        );

  	process
	begin		
		wait for 10 ns;
		Data <= "00000000";
		wait for 10 ns;	
		Data <= "00000001";
		wait for 10 ns;
		Data <= "00000010";	
		wait for 10 ns;
		Data <= "00000100";
		wait for 10 ns;
		Data <= "00001000";
		wait for 10 ns;
		Data <= "00010000";	
		wait for 10 ns;
		Data <= "00100000";
		wait for 10 ns;
		Data <= "01000000";
		wait for 10 ns;
		Data <= "10000000";	
	end process;
END;
