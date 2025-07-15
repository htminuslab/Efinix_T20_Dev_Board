---------------------------------------------------------------------------------------------------
--                                                                           
--  T20Q100 Led toggle test
--                                         
--  Copyright (C) 2025 HT-LAB                                           
--                                                                                                            
--  https://github.com/htminuslab    
--                                                                             
---------------------------------------------------------------------------------------------------        
--
--  Simple test to write UART string "Pin is high " when pin PC15 is high and "Pin is low  " when the
--  pin is low. A *RESET* string is printed when the reset pin PA15 is toggled.
--  The pin levels are set by the EfinixLoader program, example:
--
--  
--
--  Revision History:                                                        
--                                                                           
--  Date:          Revision         Author         
--  14-jun-2025	   1.0				HABT/ChatGPT
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pin_level is
    port (
        CLK     : in  std_logic;
        RESETN  : in  std_logic;
        CMD     : in  std_logic;
        LED     : out std_logic;
        TX      : out std_logic
    );
end entity pin_level;

architecture rtl of pin_level is

	component EFX_PLL_V2 is
	generic ( N, M, O        : integer := 1;
			  CLKOUT0_DIV    : integer := 1;
			  CLKOUT1_DIV    : integer := 1;
			  CLKOUT2_DIV    : integer := 1;
			  CLKOUT0_PHASE  : integer := 0;
			  CLKOUT1_PHASE  : integer := 0;
			  CLKOUT2_PHASE  : integer := 0;
			  FEEDBACK_CLK   : string := "INTERNAL";
			  FEEDBACK_MODE  : string := "INTERNAL";
			  REFCLK_FREQ    : real := 25.0);
	port ( CLKOUT0, CLKOUT1, CLKOUT2, LOCKED : out std_logic;
		   RSTN, FBK                         : in  std_logic;
		   CLKIN                             : in  std_logic_vector(3 downto 0);
		   CLKSEL                            : in  std_logic_vector(1 downto 0));
	end component EFX_PLL_V2;


    -- Declare UART component
    component uart is
	    generic(CLK16UART : integer :=313);								-- 16*baudrate
        port (
            CLK    : in     std_logic;
            DBUSI  : in     std_logic_vector (7 downto 0);
            RX     : in     std_logic;
            SRESET : in     std_logic;
            WR     : in     std_logic;
            DBUSO  : out    std_logic_vector (7 downto 0);
            RDRF   : out    std_logic;
            TDRE   : out    std_logic;
            TX     : out    std_logic
        );
    end component;   

    -- UART internal signals
    signal uart_wr     : std_logic := '0';
    signal uart_dbusi  : std_logic_vector(7 downto 0) := (others => '0');
    signal uart_dbuso  : std_logic_vector(7 downto 0);
    signal uart_rdrf   : std_logic;
    signal uart_tdre   : std_logic;

    -- FSM and debounce signals
    type state_type is (IDLE, SEND,WAITTDRE,CHECK);
    signal state       : state_type := IDLE;
    signal msg         : string(1 to 12) := (others => ' ');
    signal index       : integer range 1 to 13 := 1;

    signal prev_cmd_db : std_logic := '0';							-- Previous cmd level

	signal CLKOUT0     : std_logic;
	signal LOCKED_s	   : std_logic;
	signal resetn_s    : std_logic;
	
begin

    LED <= NOT CMD;                                                 -- Active low
    
    ----------------------------------------------------
    -- PLL Instantiation, requires Unified mode
    ----------------------------------------------------
	EFX_PLL_V2_inst : EFX_PLL_V2					
	generic map (
		M => 128,
		N => 1,
		O => 2,
		CLKOUT0_DIV   => 16,
		CLKOUT1_DIV   => 2,
		CLKOUT2_DIV   => 2,
		CLKOUT0_PHASE => 0,
		CLKOUT1_PHASE => 0,
		CLKOUT2_PHASE => 0,
		FEEDBACK_CLK  => "INTERNAL",
		FEEDBACK_MODE => "INTERNAL",
		REFCLK_FREQ   => 12.0
	)
	port map (
		CLKOUT0 => CLKOUT0, --48MHz
		CLKOUT1 => open,
		CLKOUT2 => open,
		LOCKED  => LOCKED_s,
		RSTN    => RESETN,
		FBK     => '0',
		CLKIN   => "000"&CLK,
		CLKSEL  => "10"
	);



    ----------------------------------------------------
    -- UART Instantiation
    ----------------------------------------------------
    uart_inst : uart
	    generic map(CLK16UART => 27)								-- 48MHz/16/115200 baudrate
        port map (
            CLK    => CLKOUT0,
            DBUSI  => uart_dbusi,
            RX     => '0',
            SRESET => resetn_s,
            WR     => uart_wr,
            DBUSO  => uart_dbuso,
            RDRF   => uart_rdrf,
            TDRE   => uart_tdre,
            TX     => TX
        );

	
	process(CLK, RESETN)
	begin
		if RESETN='0' then
			resetn_s <= '0';
		elsif rising_edge(CLK) then
			if LOCKED_s='1' then
				resetn_s <= '1';
			else 
				resetn_s <= '0';
			end if;
		end if;
	end process;


    ----------------------------------------------------
    -- UART Control FSM
    ----------------------------------------------------
    process(CLKOUT0,resetn_s)
    begin
		if resetn_s = '0' then
			state       <= IDLE;
			uart_dbusi  <= (others => '0');
            uart_wr     <= '0';
            index       <= 1;
            prev_cmd_db <= '0';
        elsif rising_edge(CLKOUT0) then
			uart_wr <= '0';
            case state is
                when IDLE =>
                    uart_wr <= '0';

                    if CMD /= prev_cmd_db then
                        if CMD = '1' then
                            msg     <= "Pin is high"&CR;
                        else
                            msg     <= "Pin is low "&CR;
                        end if;

                        index       <= 1;
                        state       <= SEND;
						uart_wr     <= '1';
                        prev_cmd_db <= CMD;
                    end if;

                when SEND =>
					uart_dbusi <= std_logic_vector(to_unsigned(character'pos(msg(index)), 8));
					index      <= index + 1;
					state      <= WAITTDRE;                     

				when WAITTDRE =>
					if uart_tdre = '0' then				-- Char written
						state   <= CHECK;
					end if;						
					
				when CHECK =>					
					if uart_tdre = '1' then					
						if index <= 12 then 	
							uart_wr <= '1';
							state   <= SEND;
						else
							state   <= IDLE;							
						end if;
					end if;

            end case;
        end if;

    end process;

end architecture rtl;
