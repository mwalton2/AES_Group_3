--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:21:25 02/13/2016
-- Design Name:   
-- Module Name:   C:/Xilinx/Projets/S-Box/TB_Bit4Mul.vhd
-- Project Name:  S-Box
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Bit4Mul
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
USE ieee.std_logic_unsigned.all;

-- LIBRARY ieee;
-- USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- USE ieee.numeric_std.ALL;
 
ENTITY TB_Bit4Mul IS
END TB_Bit4Mul;
 
ARCHITECTURE behavior OF TB_Bit4Mul IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Bit4Mul
    PORT(
         x : IN  std_logic_vector(3 downto 0);
         y : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(3 downto 0) := "0111";
   signal y : std_logic_vector(3 downto 0) := "1101";

 	--Outputs
   signal output : std_logic_vector(3 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Bit4Mul PORT MAP (
          x => x,
          y => y,
          output => output
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		--for J in 0 to 16 loop
		--	for I in 0 to 16 loop
		--			-- Increment xTime_in by 1
		--			x <= x + "0001";
					-- Wait 10 ns 
		--			wait for 10 ns;
		--		end loop;
		--	y <= y + "0001";
		--end loop;
		
      wait;
   end process;

END;
