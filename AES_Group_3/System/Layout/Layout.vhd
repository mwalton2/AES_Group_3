----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:19:55 02/15/2016 
-- Design Name: 
-- Module Name:    Layout - Behavioral 
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

entity Layout is
    Port ( Plain_Text : in  STD_LOGIC_VECTOR (127 downto 0);
           Cypher_Key : in  STD_LOGIC_VECTOR (127 downto 0);
			  Clk : in  STD_LOGIC ;
           Cypher_Text : out  STD_LOGIC_VECTOR (127 downto 0);
			  DIR : in STD_LOGIC);
			 
end Layout;

architecture RTL of Layout is
	-- signal Round1toRound2 : STD_LOGIC_VECTOR (7 downto 0);	
	--carry on for RoundNtoRoundN+1 : STF_LOGIC_VECTOR, i.e. the state going from one round to the next
	--signal LATRound1toRound2 : STD_LOGIC_VECTOR (7 downto 0);
	-- states are the data beign sent between stages. i.e. state 1 is ouput from stage 1
	signal State_0 : STD_LOGIC_VECTOR (127 downto 0);
	signal State_1 : STD_LOGIC_VECTOR (127 downto 0);
	signal State_2 : STD_LOGIC_VECTOR (127 downto 0);
	signal State_3 : STD_LOGIC_VECTOR (127 downto 0);
	signal State_4 : STD_LOGIC_VECTOR (127 downto 0);
	signal State_5 : STD_LOGIC_VECTOR (127 downto 0);
	signal State_6 : STD_LOGIC_VECTOR (127 downto 0);
	signal State_7 : STD_LOGIC_VECTOR (127 downto 0);
	signal State_8 : STD_LOGIC_VECTOR (127 downto 0);
	signal State_9 : STD_LOGIC_VECTOR (127 downto 0);
	signal State_10 : STD_LOGIC_VECTOR (127 downto 0);
	--and on to state 10
	--latched version of states
	signal LAT_State_0 : STD_LOGIC_VECTOR (127 downto 0);
	signal LAT_State_1 : STD_LOGIC_VECTOR (127 downto 0);
	signal LAT_State_2 : STD_LOGIC_VECTOR (127 downto 0);
	signal LAT_State_3 : STD_LOGIC_VECTOR (127 downto 0);
	signal LAT_State_4 : STD_LOGIC_VECTOR (127 downto 0);
	signal LAT_State_5 : STD_LOGIC_VECTOR (127 downto 0);
	signal LAT_State_6 : STD_LOGIC_VECTOR (127 downto 0);
	signal LAT_State_7 : STD_LOGIC_VECTOR (127 downto 0);
	signal LAT_State_8 : STD_LOGIC_VECTOR (127 downto 0);
	signal LAT_State_9 : STD_LOGIC_VECTOR (127 downto 0);
	signal LAT_State_10 : STD_LOGIC_VECTOR (127 downto 0);
	
	--signal Key_Out1 : STD_LOGIC_VECTOR (127 downto 0);
	signal KS1: STD_LOGIC_VECTOR (127 downto 0);
	signal KS2: STD_LOGIC_VECTOR (127 downto 0);
	signal KS3: STD_LOGIC_VECTOR (127 downto 0);
	signal KS4: STD_LOGIC_VECTOR (127 downto 0);
	signal KS5: STD_LOGIC_VECTOR (127 downto 0);
	signal KS6: STD_LOGIC_VECTOR (127 downto 0);
	signal KS7: STD_LOGIC_VECTOR (127 downto 0);
	signal KS8: STD_LOGIC_VECTOR (127 downto 0);
	signal KS9: STD_LOGIC_VECTOR (127 downto 0);
	signal KS10: STD_LOGIC_VECTOR (127 downto 0);
	
	signal LATKS1: STD_LOGIC_VECTOR (127 downto 0);
	signal LATKS2: STD_LOGIC_VECTOR (127 downto 0);
	signal LATKS3: STD_LOGIC_VECTOR (127 downto 0);
	signal LATKS4: STD_LOGIC_VECTOR (127 downto 0);
	signal LATKS5: STD_LOGIC_VECTOR (127 downto 0);
	signal LATKS6: STD_LOGIC_VECTOR (127 downto 0);
	signal LATKS7: STD_LOGIC_VECTOR (127 downto 0);
	signal LATKS8: STD_LOGIC_VECTOR (127 downto 0);
	signal LATKS9: STD_LOGIC_VECTOR (127 downto 0);
	signal LATKS10: STD_LOGIC_VECTOR (127 downto 0);
	
	
	
	signal Transposed_Cypher_Key: STD_LOGIC_VECTOR (127 downto 0);
	
	signal Transposed_State_1 : STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_State_2 : STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_State_3 : STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_State_4 : STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_State_5 : STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_State_6 : STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_State_7 : STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_State_8 : STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_State_9 : STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_State_10 : STD_LOGIC_VECTOR (127 downto 0);

	signal Transposed_LAT_State_1: STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_LAT_State_2: STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_LAT_State_3: STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_LAT_State_4: STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_LAT_State_5: STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_LAT_State_6: STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_LAT_State_7: STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_LAT_State_8: STD_LOGIC_VECTOR (127 downto 0);
	signal Transposed_LAT_State_9: STD_LOGIC_VECTOR (127 downto 0);
	
	--signal Cypher_Text : STD_LOGIC_VECTOR (127 downto 0);
	
	
	--signal DIR : STD_LOGIC ;

	--and on to latstae 10
	
	--signal Key_In1
	
begin
--this is forwards 
   --Transposed cypher key is used for the key schedule
	
	TR0 : entity work.Transpose port map (Cypher_Key, Transposed_Cypher_Key);
	KS : entity work.KeySchedule port map (Transposed_Cypher_Key, KS1, KS2, KS3, KS4, KS5, KS6, KS7, KS8, KS9, KS10, LATKS1, LATKS2, LATKS3, LATKS4, LATKS5, LATKS6, LATKS7, LATKS8, LATKS9, LATKS10, Clk, DIR );
	
	--Round 0 is only adding the cypher key to the cypher text
	Stage0 : entity work.Stage0 port map(Plain_Text, Cypher_Key, State_0);
	LAT0 : entity work.LAT128 port map(State_0, Clk, LAT_State_0);
	--Cypher_Text <= LAT_State_0;
	
--	--Round 1-9 are the repetitivie rounds aka (Round)
	Stage1 : entity work.Stage port map (LAT_State_0, KS1, CLk, State_1, DIR);
	TR1 : entity work.Transpose port map (State_1, Transposed_State_1);
	LAT1 : entity work.Latch128 port map(Transposed_State_1, Clk, Transposed_LAT_State_1);
	 --Cypher_Text <= LAT_State_1; 
	 
	Stage2 : entity work.Stage port map (Transposed_LAT_State_1, KS2, CLk, State_2, DIR);
	TR2 : entity work.Transpose port map (State_2, Transposed_State_2);
	LAT2 : entity work.Latch128 port map(Transposed_State_2, Clk, Transposed_LAT_State_2);   	
   --Cypher_Text <= Transposed_LAT_State_2;
  
  	Stage3 : entity work.Stage port map (Transposed_LAT_State_2, KS3, CLk, State_3, DIR);
	TR3 : entity work.Transpose port map (State_3, Transposed_State_3);
	LAT3 : entity work.Latch128 port map(Transposed_State_3, Clk, Transposed_LAT_State_3);
	--Cypher_Text <= Transposed_LAT_State_3;
	
	Stage4 : entity work.Stage port map (Transposed_LAT_State_3, KS4, CLk, State_4, DIR);
	TR4 : entity work.Transpose port map (State_4, Transposed_State_4);
	LAT4 : entity work.Latch128 port map(Transposed_State_4, Clk, Transposed_LAT_State_4);
	--Cypher_Text <= Transposed_LAT_State_4;
	
   Stage5 : entity work.Stage port map (Transposed_LAT_State_4, KS5, CLk, State_5, DIR);
	TR5 : entity work.Transpose port map (State_5, Transposed_State_5);
	LAT5 : entity work.Latch128 port map(Transposed_State_5, Clk, Transposed_LAT_State_5);
	--Cypher_Text <= Transposed_LAT_State_5;
	
	
	Stage6 : entity work.Stage port map (Transposed_LAT_State_5, KS6, CLk, State_6, DIR);
	TR6 : entity work.Transpose port map (State_6, Transposed_State_6);
	LAT6 : entity work.Latch128 port map(Transposed_State_6, Clk, Transposed_LAT_State_6);
	--Cypher_Text <= Transposed_LAT_State_6;
	
	Stage7 : entity work.Stage port map (Transposed_LAT_State_6, KS7, CLk, State_7, DIR);
	TR7 : entity work.Transpose port map (State_7, Transposed_State_7);
	LAT7 : entity work.Latch128 port map(Transposed_State_7, Clk, Transposed_LAT_State_7);
	--Cypher_Text <= Transposed_LAT_State_7;
	
   Stage8 : entity work.Stage port map (Transposed_LAT_State_7, KS8, CLk, State_8, DIR);
	TR8 : entity work.Transpose port map (State_8, Transposed_State_8);
	LAT8 : entity work.Latch128 port map(Transposed_State_8, Clk, Transposed_LAT_State_8);
	--Cypher_Text <= Transposed_LAT_State_8;
	
	Stage9 : entity work.Stage port map (Transposed_LAT_State_8, KS9, CLk, State_9, DIR);
	TR9 : entity work.Transpose port map (State_9, Transposed_State_9);
	LAT9 : entity work.Latch128 port map(Transposed_State_9, Clk, Transposed_LAT_State_9);
	--Cypher_Text <= Transposed_LAT_State_9;

	Stage10 : entity work.Stage10 port map (Transposed_LAT_State_9, KS10, Clk, State_10, DIR);
	TR10B : entity work.Transpose port map (State_10, Transposed_State_10);
	
   Cypher_Text<=Transposed_State_10;

end RTL;

