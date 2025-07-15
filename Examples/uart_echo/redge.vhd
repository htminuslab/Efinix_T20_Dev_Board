---------------------------------------------------------------------------------------------------
--
--	Rising_Edge strobe Flag Set/Reset
-- 
--  Revision History:                                                        
--                                                                           
--  Date:          Revision         Author         
--
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

entity redge is
     generic(RESHL : std_logic:='1';	 							-- Reset Active High/Low
   		     RESVAL: std_logic:='0');	 							-- Flag default value after reset
     port (clk     : in  std_logic;    								-- System Clock   
           reset   : in  std_logic;         							  
           strobe  : in  std_logic;    								-- Flag assert strobe (slow clock)
	       clredge : in  std_logic;    								-- Rising_edge clear signal
		   pulse   : out std_logic;	 								-- Rising edge clk wide pulse
		   flag    : out std_logic);            
end redge;


architecture rtl of redge is

  signal dind1_s : std_logic;
  signal dind2_s : std_logic;
  signal pulse_s : std_logic;

begin
    
	Process (clk,reset)                								-- First delay        
    begin								
		if reset=RESHL then            								         
			dind1_s <= '0';              								
		elsif rising_edge(clk) then    								 
			dind1_s <= strobe;            								         		  
		end if;   								
    end process;    								
								
	Process (clk,reset)                								-- Second delay        
    begin
		if reset=RESHL then                     
			dind2_s <= '0';              
		elsif rising_edge(clk) then     
			dind2_s <= dind1_s;                     		  
		end if;   
    end process;
    
	pulse_s <= '1' when (dind1_s='1' and dind2_s='0') else '0';
	pulse <= pulse_s;

	Process (clredge, reset, pulse_s)        
	begin
		if reset=RESHL then
			flag <= RESVAL;              							-- Default value upon reset   
		elsif pulse_s='1' then   
			flag <= '1';      
		elsif rising_edge(clredge) then 
			flag <= '0';
		end if;    
	end process;

end rtl;
                                   
