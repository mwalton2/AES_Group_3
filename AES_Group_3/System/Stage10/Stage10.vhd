----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:07 02/19/2016 
-- Design Name: 
-- Module Name:    Stage10 - Behavioral 
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

entity Stage10 is
    Port ( Data_In : in  STD_LOGIC_VECTOR (127 downto 0);
           Key_In : in  STD_LOGIC_VECTOR (127 downto 0);
           Clk : in  STD_LOGIC ;
           Cypher_Text : out  STD_LOGIC_VECTOR (127 downto 0);
			  DIR : in STD_LOGIC);	
			
end Stage10;

architecture RTL of Stage10 is

	signal SB_Out : STD_LOGIC_VECTOR (127 downto 0);
	
	signal SR_Out : STD_LOGIC_VECTOR (127 downto 0) ;
	
	signal LAT_SR_Out : STD_LOGIC_VECTOR (127 downto 0);
	
begin
	

   SB1 : entity work.SBox8 port map (DIR, Clk, Data_In (127 downto 120), SB_Out (127 downto 120));
	SB2 : entity work.SBox8 port map (DIR, Clk, Data_In (119 downto 112), SB_Out (119 downto 112));
	SB3 : entity work.SBox8 port map (DIR, Clk, Data_In (111 downto 104), SB_Out (111 downto 104));
	SB4 : entity work.SBox8 port map (DIR, Clk, Data_In (103 downto 96), SB_Out (103 downto 96));
	SB5 : entity work.SBox8 port map (DIR, Clk, Data_In (95 downto 89), SB_Out (95 downto 89));
	SB6 : entity work.SBox8 port map (DIR, Clk, Data_In (87 downto 80), SB_Out (87 downto 80));
	SB7 : entity work.SBox8 port map (DIR, Clk, Data_In (79 downto 72), SB_Out (79 downto 72));
	SB8 : entity work.SBox8 port map (DIR, Clk, Data_In (71 downto 64), SB_Out (71 downto 64));
	SB9 : entity work.SBox8 port map (DIR, Clk, Data_In (63 downto 56), SB_Out (63 downto 56));
	SB10 : entity work.SBox8 port map (DIR, Clk, Data_In (55 downto 48), SB_Out (55 downto 48));
	SB11 : entity work.SBox8 port map (DIR, Clk, Data_In (47 downto 40), SB_Out (47 downto 40));
	SB12 : entity work.SBox8 port map (DIR, Clk, Data_In (39 downto 32), SB_Out (39 downto 32));
	SB13 : entity work.SBox8 port map (DIR, Clk, Data_In (31 downto 24), SB_Out (31 downto 24));
	SB14 : entity work.SBox8 port map (DIR, Clk, Data_In (23 downto 16), SB_Out (23 downto 16));
	SB15 : entity work.SBox8 port map (DIR, Clk, Data_In (15 downto 8), SB_Out (15 downto 8));
 SB16 : entity work.SBox8 port map (DIR, Clk, Data_In (7 downto 0), SB_Out (7 downto 0)); --0 forward and 1


	SR : entity work.shift_rows port map (SB_Out ,SR_Out );
	LAT2: entity work.LAT128 port map (SR_Out, Clk, LAT_SR_Out);
	
	RK: entity work.Round_Key port map (Key_In, LAT_SR_Out, Cypher_Text);
	--LAT4: entity work.LAT128 port map (RK_Out, Data_Out); -- may not need this as I latch between stages anyways. Will test with and without it
	
end RTL;

