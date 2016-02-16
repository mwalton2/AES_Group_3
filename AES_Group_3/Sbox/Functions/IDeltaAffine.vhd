----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:56:55 02/12/2016 
-- Design Name: 
-- Module Name:    IDeltaAffine - Behavioral 
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

entity IDeltaAffine is
    Port ( Data : in  STD_LOGIC_VECTOR (7 downto 0);
           Output : out  STD_LOGIC_VECTOR (7 downto 0));
end IDeltaAffine;

architecture RTL of IDeltaAffine is

begin
	--Inverse Delta & Affine
	Output <= (
				(Data(2) xor Data(3) xor Data(7))-- xor 0)
			&	(Data(4) xor Data(5) xor Data(6) xor not(Data(7)))-- xor 1)
			&	(Data(2) xor not(Data(7)))-- xor 1)
			&	(Data(0) xor Data(1) xor Data(4) xor Data(7))-- xor 0)
			&	(Data(0) xor Data(1) xor Data(2))-- xor 0)
			&	(Data(0) xor Data(2) xor Data(3) xor Data(4) xor Data(5) xor Data(6))-- xor 0)
			&	(Data(0) xor not(Data(7)))-- xor 1)
			&	(Data(0) xor Data(1) xor Data(2) xor Data(6) xor not(Data(7)))-- xor 1)
	);
end RTL;