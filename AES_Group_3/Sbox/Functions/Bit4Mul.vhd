----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:32:50 02/13/2016 
-- Design Name: 
-- Module Name:    Bit4Mul - Behavioral 
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

entity Bit4Mul is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end Bit4Mul;

architecture RTL of Bit4Mul is

signal topPhi : STD_LOGIC_VECTOR (1 downto 0);

signal TopTop : STD_LOGIC_VECTOR (1 downto 0);
signal TopBot : STD_LOGIC_VECTOR (1 downto 0);
signal BotTop : STD_LOGIC_VECTOR (1 downto 0);
signal BotBot : STD_LOGIC_VECTOR (1 downto 0);

signal top2mul : STD_LOGIC_VECTOR (1 downto 0);
signal mid2mul : STD_LOGIC_VECTOR (1 downto 0);
signal bot2mul : STD_LOGIC_VECTOR (1 downto 0);

signal topxor : STD_LOGIC_VECTOR (1 downto 0);
signal botxor : STD_LOGIC_VECTOR (1 downto 0);

begin

	TopTop <= (x(3) & x(2));
	TopBot <= (x(1) & x(0));
	
	BotTop <= (y(3) & y(2));
	BotBot <= (y(1) & y(0));

	HB1 : entity work.Bit2Mul port map(TopTop, BotTop, top2mul);
	
	topxor <= (TopTop xor TopBot);
	botxor <= (BotTop xor BotBot);
	
	HB2 : entity work.Bit2Mul port map(TopBot, BotBot, bot2mul);
	HB3 : entity work.Bit2Mul port map(topxor, botxor, mid2mul);
	
	HB4 : entity work.Phi port map(top2mul, topPhi);
	
	--output <= (topPhi & topPhi );
	
	output <= (			
	
					(mid2mul xor bot2mul)
				&	(topPhi xor bot2mul)
				
	);





	--bit21a <= x(3 downto 2);
   --bit21b <= y(3 downto 2);
    
  -- bit23a <= x(1 downto 0);
   --bit23b <= y(1 downto 0);
	
   --bit22a <= (bit21a xor bit23a);
   --bit22b <= (bit21b xor bit23b); 
	
   --HB1 : entity work.Bit2Mul port map(bit21a, bit21b, top);
	--HB2 : entity work.Bit2Mul port map(bit22a, bit22b, mid);
	--HB3 : entity work.Bit2Mul port map(bit23a, bit23b, bot);
	
	--HB4 : entity work.Phi port map(top, topPhi);
	
	--output <= (			
	--				(topPhi xor bot)
	--			&	(mid xor bot)
	--);
end RTL;

