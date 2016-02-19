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
           Cypher_Text : out  STD_LOGIC_VECTOR (127 downto 0));
			  

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
	
	signal Key_Out1 : STD_LOGIC_VECTOR (127 downto 0);
	--and on to latstae 10
	
	--signal Key_In1
	
begin


--Round 0 is just add the cypher key
	--Add cypher key
	
	
	--Should have a latch at the front/input??
	
	
	Stage0 : entity work.Stage0 port map(Plain_Text, Cypher_Key, State_0);
		--Round 0 is only adding the cypher key to the cypher text
	LAT0 : entity work.LAT128 port map(State_0, Clk, LAT_State_0);
	
--Round 1-9 are the repetitivie rounds aka (Round)
	--Stage1 : entity work.Stage port map (LAT_State_0, Cypher_Key, CLk, State_1, Key_Out1);
	--LAT1 : entity work.Latch128 port map(State_1, Clk, LAT_State_1);
   --Stage2 : entity work.Stage port map (LATState1, Key_In2, CLk, State2, Key_Out2);
	--LAT2 : entity work.Latch128 port map(State2, Clk, LATState2);
	--.
	--.
	--.
	--Round9

--Round 10 is similar to round 1-9 but without the


--Fully Pipelined
	--Reg between each round
	--Reg between each module within a round
--Non-looping
	--The whole system has been unrolled
	--One big row of AES to try and get it to work

end RTL;

