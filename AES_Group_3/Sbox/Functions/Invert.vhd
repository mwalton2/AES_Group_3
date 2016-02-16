----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:09:24 02/12/2016 
-- Design Name: 
-- Module Name:    Invert - Behavioral 
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

entity Invert is
    Port ( Data : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end Invert;

architecture RTL of Invert is

signal Data321 : STD_LOGIC;
signal Data320 : STD_LOGIC;
signal Data310 : STD_LOGIC;
signal Data210 : STD_LOGIC;

signal Data31 : STD_LOGIC;
signal Data30 : STD_LOGIC;
signal Data21 : STD_LOGIC;
signal Data20 : STD_LOGIC;

begin
   	--Invert
		--1 -> 0 -> 3
		--2 -> 1 -> 2
		--3 -> 2 -> 1
		--4 - >3 -> 0
	
	 --x123 = and(x(1),and(x(2),x(3)));       
    --x124 = and(x(1),and(x(2),x(4)));
    --x134 = and(x(1),and(x(3),x(4)));
    --x234 = and(x(2),and(x(3),x(4)));
	 
	
	 Data321 <= (Data(3) and Data(2) and Data(1));
	 Data320 <= (Data(3) and Data(2) and Data(0));
    Data310 <= (Data(3) and Data(1) and Data(0));
    Data210 <= (Data(2) and Data(1) and Data(0));
	 
	 --x13 = and(x(1),x(3));          
    --x14 = and(x(1),x(4));
    --x23 = and(x(2),x(3));
    --x24 = and(x(2),x(4));
    
    Data31 <= (Data(3) and Data(1));
    Data30 <= (Data(3) and Data(0));
    Data21 <= (Data(2) and Data(1));
    Data20 <= (Data(2) and Data(0));
	 
	 --1 -> 0 -> 3
	 --2 -> 1 -> 2
	 --3 -> 2 -> 1
	 --4 - >3 -> 0
	 
	 --y(1) = xor(xor(x(1),x123),xor(x14,x(2)));
    --y(2) = xor(x123,xor(x124,xor(x14,xor(x(2),x23)))); 
    --y(3) = xor(x(1),xor(x123,xor(x134,xor(x(2),xor(x24,x(3))))));
    --y(4) = xor(x123,xor(x124,xor(x13,xor(x134,xor(x14,xor(x(2),xor(x23,xor(x234,xor(x(3),x(4))))))))));
	
Output <= (
		(Data(3) xor Data321 xor Data30 xor Data(2))
    &	(Data321 xor Data320 xor Data30 xor Data(2) xor Data21)
  --&	(Data(3) xor Data321 xor Data310 xor Data(2) xor Data21 xor Data(1))
	 &	(Data(3) xor Data321 xor Data310 xor Data(2) xor Data20 xor Data(1))
    &	(Data321 xor Data320 xor Data31 xor Data310 xor Data30 xor Data(2) xor Data21 xor Data210 xor Data(1) xor Data(0))
);

end RTL;

