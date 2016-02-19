----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:16:48 02/15/2016 
-- Design Name: 
-- Module Name:    Round - Behavioral 
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

entity Stage is
    Port ( Data_In : in  STD_LOGIC_VECTOR (127 downto 0);
           Key_In : in  STD_LOGIC_VECTOR (127 downto 0);
           Clk : in  STD_LOGIC ;
           Data_Out : out  STD_LOGIC_VECTOR (127 downto 0);
			  Key_Out : out STD_LOGIC_VECTOR (128 downto 0));
end Stage;

architecture RTL of Stage is

   --signal SB_Out : STD_LOGIC_VECTOR (127 downto 0) ;
	--signal LAT_SB_Out : STD_LOGIC_VECTOR (127 downto 0) ;

	--signal SR_Out : STD_LOGIC_VECTOR (127 downto 0) ;
	--signal LAT_SR_Out :STD_LOGIC_VECTOR (127 downto 0) ;
	
	--signal MC_Out : STD_LOGIC_VECTOR (127 downto 0) ;
	--signal LAT_MC_Out : STD_LOGIC_VECTOR (127 downto 0) ;
	
	--signal Round_Key :STD_LOGIC_VECTOR (127 downto 0) ;
   --signal LAT_RK_Out : STD_LOGIC_VECTOR (127 downto 0) ;
	
	--signal RK_Out :STD_LOGIC_VECTOR (127 downto 0) ;
	
begin

--Key scheduled occurs parallel with the states below
	--KS : entity work.top_row port map(Key_In, Key_Out)
	--add in a few buffers to delay the output of the KS
	--
	
--Order of Round is
--0 forward and 1 reverse
	--SB : entity work.SBox port map (DIR, Clk, Data_In (127 downto 120), SB_Out (127 downto 120));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (119 downto 112), SB_Out (119 downto 112));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (111 downto 104), SB_Out (111 downto 104));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (103 downto 96), SB_Out (103 downto 96));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (95 downto 89), SB_Out (95 downto 89));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (87 downto 80), SB_Out (87 downto 80));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (79 downto 72), SB_Out (79 downto 72));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (71 downto 64), SB_Out (71 downto 64));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (63 downto 56), SB_Out (63 downto 56));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (55 downto 48), SB_Out (55 downto 48));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (47 downto 40), SB_Out (47 downto 40));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (39 downto 32), SB_Out (39 downto 32));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (31 downto 24), SB_Out (31 downto 24));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (23 downto 16), SB_Out (23 downto 16));
	--SB : entity work.SBox port map (DIR, Clk, Data_In (15 downto 8), SB_Out (15 downto 8));
   --SB : entity work.SBox port map (DIR, Clk, Data_In (7 downto 0), SB_Out (7 downto 0)); --0 forward and 1
	--LAT1: entity work.LAT128 port map (SB_Out, Clk, LAT_SB_Out); -- will need a massive 127 bit latch for this
 
	--SR : entity work.shift_rows port map (LAT_SB_Out ,SR_Out );
	--LAT2: entity work.LAT128 port map (SR_Out, Clk, LAT_SR_Out);
	
	--MC : entity work.mix_columns port map (LAT_SR_Out, MC_Out);
	--LAT3: entity work.LAT128 port map (MC_Out, Clk, LAT_MC_Out);
	
	--RK: entity work.Round_Key port map (RK_In, LAT_MC_Out, RK_Out);
	--LAT4: entity work.LAT128 port map (RK_Out, Data_Out); -- may not need this as I latch between stages anyways. Will test with and without it
	

end RTL;

