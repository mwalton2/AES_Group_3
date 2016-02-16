----------------------------------------------------------------------------------
-- Company: EEE6225 - System Design
-- Engineer: Matthew Walton
-- 
-- Create Date:	02/13/2016 
-- Design Name: 	Top Level Generic S-BOX
-- Module Name:   4-Bit Multiply - RTL 
-- Project Name:	Advanced Encryption Standard
-- Target Devices:
-- Tool versions:	
-- Description:
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bit4Mul is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);				-- Data input MSB 3:0 LSB
           y : in  STD_LOGIC_VECTOR (3 downto 0);				-- Data input MSB 3:0 LSB
           output : out  STD_LOGIC_VECTOR (3 downto 0));		-- Data output MSB 3:0 LSB
end Bit4Mul;

architecture RTL of Bit4Mul is

signal TopTop : STD_LOGIC_VECTOR (1 downto 0);
signal TopBot : STD_LOGIC_VECTOR (1 downto 0);
signal BotTop : STD_LOGIC_VECTOR (1 downto 0);
signal BotBot : STD_LOGIC_VECTOR (1 downto 0);

signal top2mul : STD_LOGIC_VECTOR (1 downto 0);
signal mid2mul : STD_LOGIC_VECTOR (1 downto 0);
signal bot2mul : STD_LOGIC_VECTOR (1 downto 0);

signal topxor : STD_LOGIC_VECTOR (1 downto 0);
signal botxor : STD_LOGIC_VECTOR (1 downto 0);
signal topPhi : STD_LOGIC_VECTOR (1 downto 0);

begin
	TopTop <= (x(3) & x(2));
	TopBot <= (x(1) & x(0));
	
	BotTop <= (y(3) & y(2));
	BotBot <= (y(1) & y(0));

	HB1 : entity work.Bit2Mul port map(TopTop, BotTop, top2mul);
	HB2 : entity work.Bit2Mul port map(TopBot, BotBot, bot2mul);

	topxor <= (TopTop xor TopBot);
	botxor <= (BotTop xor BotBot);
	HB3 : entity work.Bit2Mul port map(topxor, botxor, mid2mul);
	HB4 : entity work.Phi port map(top2mul, topPhi);
	
	output <= (	
			(mid2mul xor bot2mul)
		&	(topPhi xor bot2mul)
	);
end RTL;