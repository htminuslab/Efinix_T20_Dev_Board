---------------------------------------------------------------------------------------------------
--
--  HTLRV32 Risc-V Processor                                                                                                                    
--  Copyright (C) 2013-2025 HT-LAB                                           
--                                                                           
--  https://github.com/htminuslab                                 
--                                                                           
---------------------------------------------------------------------------------------------------      
---------------------------------------------------------------------------------------------------
--
--  Simple UART Monitor, characters string received are reflected on the transcript window
--  Assume 9600bps, the DIVIDER_C should be (CLK/(16*9600))  (-1?)
--
--  Revision History:                                                        
--                                                                           
--  Date:          	Revision    Author    
--  10/02/2013      1.0			Created for HTL486     
--  25/05/2025      1.1 		HABT, Checked with Questa Base 2025.1, uploaded to github                               
---------------------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;

LIBRARY std;
USE std.TEXTIO.all;

ENTITY uartmon IS
GENERIC( 
     CLK16UART  : integer := 2; 				-- (CLK/(16*9600))
     MAXCHAR_C  : integer := 40;
	 COMPORT_C  : character := '0');
   PORT(RX 		: IN  std_logic;
		clk    	: IN  std_logic;
		resetn 	: IN  std_logic);
END uartmon ;

--
ARCHITECTURE rtl OF uartmon IS

    signal uartdivcnt_s : integer;     
	signal rxclk16_s    : std_logic;                                	
    signal txclk1_s     : std_logic;                               	-- x1 TX clock
    signal div16_s      : unsigned(3 downto 0); 					-- divide by 16 counter
			
    type   rxstates is (sHigh,sLow,sData,sLatch,sError);            -- Receive Statemachine
    signal rxstate      : rxstates;
    	
    signal rxshift_s    : std_logic_vector(8 downto 0);             -- Receive Shift Register (9 bits!) 
    signal rxbitcnt_s   : integer;-- range 0 to 10;
    signal samplecnt_s  : integer;-- range 0 to 15;
	
	
begin
    
    -----------------------------------------------------------------------------------------------
    -- UART bitrate divider, create x16 rx and and x1 txclock
	-- System clock CLK is divided by CLK16UART then by another 16 for TX clock (=baudrate)
    -----------------------------------------------------------------------------------------------
    process(clk,RESETN)                                                    
    begin
		if RESETN='0' then                     
			uartdivcnt_s <= 0;  
			div16_s      <= (others => '0');				
			rxclk16_s    <= '0';
			txclk1_s     <= '0';
		elsif rising_edge(clk) then           
            if uartdivcnt_s=CLK16UART-1 then 
				uartdivcnt_s <= 0;
                rxclk16_s    <= '1';
				div16_s <= div16_s + 1;					
				if div16_s="1110" then
					txclk1_s <= '1';
				else
					txclk1_s <= '0';
				end if;					
             else 
				rxclk16_s    <= '0';
				txclk1_s     <= '0';
                uartdivcnt_s <= uartdivcnt_s + 1;
             end if;	
      end if;   
    end process;
	
	
	-----------------------------------------------------------------------------------------------
    -- UART Receiver
    -----------------------------------------------------------------------------------------------
    process(clk,RESETN)  
		
		variable L   : line;
		variable i_v : integer;
	   
		function std_to_char(inp: std_logic_vector) return character is
			constant ASCII_TABLE : string (1 to 256) :=
			".......... .. .................. !" & '"' &
			"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHI"  &
			"JKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnop"  &
			"qrstuvwxyz{|}~........................."  &
			"......................................."  &
			"......................................."  &
			"..........................";
		variable temp : integer;
		begin  
			temp:=to_integer(unsigned(inp))+1;
			return ASCII_TABLE(temp);
		end std_to_char;
	
	
    begin 
        if RESETN='0' then                                      	-- Sync Reset                   
			rxstate     <= sHigh;                               	-- Wait for Rising edge
            samplecnt_s <= 6;
            rxbitcnt_s  <= 0;
            rxshift_s   <= (others => '1'); 
			i_v := 0;     											-- clear character counter
        elsif rising_edge(clk) then             						
			if rxclk16_s='1' then                              		-- Only action on Sampling clock  TODO change to rising_edge
                case rxstate is                       
                    when sHigh => 
                        --rsrl_s      <= '0'; 
						samplecnt_s <= 6;
						rxbitcnt_s  <= 0;
                        if RX='1' then                               
                            rxstate <= sHigh;                       -- Wait for falling edge
                        else 
                            rxstate <= sLow;                        -- rx data line is low, start bit?
                        end if;                 
                        
                    when sLow =>                                    -- Next wait 16/2 samples
                        if RX='0' AND samplecnt_s=0 then            -- After 8 samples RX is still low so startbit detected
                            rxstate <= sData;                       -- Start filling RX reg
                            samplecnt_s <= 15;
                        elsif RX='1' then                           -- Not a valid startbit, 
                            rxstate <= sHigh;                         
                        else
                            samplecnt_s <= samplecnt_s-1;			
                        end if;
						
                    when sData =>                                   -- Start logging 8 databits
                        if samplecnt_s=0 then                       -- sample bit
                            rxshift_s <= RX & rxshift_s(8 downto 1);-- 9bits
                            if rxbitcnt_s=8 AND RX='1' then
                                rxstate <= sLatch;    
                            elsif rxbitcnt_s=8 AND RX='0' then      -- Incorrect Stopbit, must be 1
                                rxstate <= sError;    
                            else
                                rxstate <= sData;
                            end if;
                            rxbitcnt_s  <= rxbitcnt_s+1;
							samplecnt_s <= 15;
						else
							samplecnt_s <= samplecnt_s-1;
                        end if;
						
                    when sLatch =>                                  -- Valid frame received latch into rxchar and set RDRF flag
                        rxstate <= sHigh;
						
						if i_v=0 then 
							write(L,string'("UART"));
							write(L,COMPORT_C);						-- COM0 or COM1
							write(L,string'(": "));
							if (rxshift_s(7 downto 0)/=X"0D" and rxshift_s(7 downto 0)/=X"0A") then 
								write(L,std_to_char(rxshift_s(7 downto 0))); 
							end if;         
							i_v := i_v+1;
						elsif (i_v=MAXCHAR_C or rxshift_s(7 downto 0)=X"0D" or rxshift_s(7 downto 0)=X"0A") then                
							writeline(output,L);
							i_v:=0;
						else 
							if (rxshift_s(7 downto 0)/=X"0D" and rxshift_s(7 downto 0)/=X"0A") then 
								write(L,std_to_char(rxshift_s(7 downto 0))); 
							end if;         
							i_v := i_v+1;
						end if;
						
                    
                    when sError =>
                        if RX='0' then                               
                            rxstate <= sError;                      -- Wait RX to go high again
                        else 
                            rxstate <= sHigh;                       -- Restart checking for falling edge
                        end if; 
                         
                    when others => rxstate <= sHigh;              
                end case;                       
            end if;  
		end if;
    end process;   
	
END ARCHITECTURE rtl;

