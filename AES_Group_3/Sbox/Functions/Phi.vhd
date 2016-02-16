----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:59 02/13/2016 
-- Design Name: 
-- Module Name:    Phi - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Phi is
    Port ( Data : in  STD_LOGIC_VECTOR (1 downto 0);
           Output : out  STD_LOGIC_VECTOR (1 downto 0));
end Phi;

architecture RTL of Phi is

begin
	--Multiply Phi
	Output <= (
	--Data(1)
	--& Data(0)
	
	
	--	Data(1)
	-- & (Data(0) xor Data(1))
			  
		
		(Data(0) xor Data(1))
		& Data(1)  	
	);
	
end RTL;

