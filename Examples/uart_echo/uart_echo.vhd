---------------------------------------------------------------------------------------------------
--                                                                           
--  T20Q100 Simple UART test
--                                         
--  Copyright (C) 2025 HT-LAB                                           
--                                                                                                            
--  https://github.com/htminuslab    
--                                                                          
---------------------------------------------------------------------------------------------------        
--
--	Basic 8N1 UART Module		 
--
--  Revision History:                                                        
--                                                                           
--  Date:          Revision         Author         
--  14-jun-2025	   1.0				HABT
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity uart_echo is
   port( 
      CLK     : in     std_logic;
	  RESETN  : in     std_logic;
	  LED     : out    std_logic;
	  RX      : in     std_logic;
      TX2     : out    std_logic;
      TX      : out    std_logic);
end uart_echo ;


architecture rtl of uart_echo is

	signal dbuso_s		: std_logic_vector(7 downto 0);
	signal dbusi_s		: std_logic_vector(7 downto 0);
	signal rdrf_s		: std_logic;
	signal tdre_s		: std_logic;
	signal wr_s         : std_logic;
	
	signal ledcount     : unsigned(19 downto 0); 			-- n/12MHz=87msec
		
    type   txstates is (sIdle, sTDRE);            
    signal txstate      : txstates;

	component uart
	generic (
		clk16uart : integer := 313					
	);
	port (
      clk    : in     std_logic;
      dbusi  : in     std_logic_vector (7 downto 0);
      rx     : in     std_logic;
      sreset : in     std_logic;
      wr     : in     std_logic;
      dbuso  : out    std_logic_vector (7 downto 0);
      rdrf   : out    std_logic;
      tdre   : out    std_logic;
      tx     : out    std_logic
	);
	end component;

begin

    TX2 <= TX;
    
	process(CLK,RESETN)
	begin
		if RESETN='0' then
			ledcount <= (others => '1');
            dbusi_s  <= (others => '1');
			txstate  <= sIdle;
		elsif rising_edge(CLK) then
			wr_s <= '0';			
			case txstate is                       
				when sIdle => 
					if rdrf_s='1' AND tdre_s='1' then
						dbusi_s <= std_logic_vector(unsigned(dbuso_s)+'1');	-- echo back ascii+1						
						--txstate <= sRead;     
                        wr_s    <= '1';
                        txstate <= sTDRE;              
					end if;
				--when sRead =>
                  --  wr_s    <= '1';
                    --txstate <= sTDRE;                   
				when sTDRE =>
					if tdre_s='0' then						-- Char written?
						txstate <= sIdle;
					end if;			
					
				when others =>
					txstate <= sIdle;
			end case;	

			if rdrf_s='1' then
				ledcount <= (others => '1');
            elsif ledcount/=X"00000" then  
                ledcount <= ledcount -'1';
			end if;
			
		end if;
	
	end process;

	LED <= '0' when ledcount/=X"00000" else '1';

	uuart : uart
		generic map (
			clk16uart => 78					-- 12MHz/9600/16
		)
		port map (
			clk    => CLK,
			sreset => RESETN,
			wr     => wr_s,
			dbuso  => dbuso_s,
			dbusi  => dbusi_s,
			rdrf   => rdrf_s,
			tdre   => tdre_s,
			tx     => TX,
			rx     => RX
		);
end rtl;
