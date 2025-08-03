---------------------------------------------------------------------------------------------------
--                                                                           
--  T20Q100 Sapphire port
--                                         
--  Copyright (C) 2025 HT-LAB                                           
--                                                                                                            
--  https://github.com/htminuslab    
--                                                                          
---------------------------------------------------------------------------------------------------        
--
--	Standard Sapphire core + SPI + UART + Timer	+ PIO	 
--
--  PIO(0)   = Flash(0)/PSRAM(1) select
--  PIO(3:1) = LED3:1
--
--  Revision History:                                                        
--                                                                           
--  Date:          Revision         Author         
--  14-jun-2025	   1.0				HABT
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity T20_TOP_RISCV is
   port( 
		CLK     	: in  std_logic;
		RESETN  	: in  std_logic;
		
		CCK			: out std_logic;								-- Flash SPI interface
		MISO        : inout std_logic;
		MOSI		: inout std_logic;
		WPN_N		: inout std_logic;								-- IO2 in QSPI
		HOLD_N		: inout std_logic;								-- IO3 in QSPI
		SPI_CS_N	: out std_logic;								-- Flash SS
		PSRAM_CS_N  : out std_logic;								-- PSRAM CS
		
		LED1   	    : out std_logic;
		LED2   	    : out std_logic;
		LED3   	    : out std_logic;
	
		RX      	: in  std_logic;
		TX      	: out std_logic);
end T20_TOP_RISCV;


architecture rtl of T20_TOP_RISCV is


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

	signal CLKOUT0_s    	: std_logic;
	signal LOCK_s        	: std_logic;	-- PLL lock used as reset
	signal io_systemReset_s : std_logic;

	-- signal system_gpio_0_io_read_s  : std_logic_vector(3 downto 0);	
	-- signal system_gpio_0_io_writeEnable_s: std_logic_vector(3 downto 0);	
	-- signal system_gpio_0_io_write_s : std_logic_vector(3 downto 0);	
		
	signal io_jtag_tms_s : std_logic;
	signal io_jtag_tdi_s : std_logic;
  --signal io_jtag_tdo_s : std_logic;
	signal io_jtag_tck_s : std_logic;
	
	signal system_spi_0_io_data_0_read			: std_logic;		-- MISO
	signal system_spi_0_io_data_0_write			: std_logic;	
	signal system_spi_0_io_data_0_writeEnable	: std_logic;	
	signal system_spi_0_io_data_1_read 			: std_logic;		-- MOSI
	signal system_spi_0_io_data_1_write			: std_logic;	
	signal system_spi_0_io_data_1_writeEnable 	: std_logic;	
	signal system_spi_0_io_data_2_read 			: std_logic;		-- WPN
	signal system_spi_0_io_data_2_write 		: std_logic;	
	signal system_spi_0_io_data_2_writeEnable 	: std_logic;	
	signal system_spi_0_io_data_3_read			: std_logic;		-- HOLD
	signal system_spi_0_io_data_3_write 		: std_logic;
	signal system_spi_0_io_data_3_writeEnable 	: std_logic;

	signal system_spi_0_io_sclk_write			: std_logic;
	signal system_spi_0_io_ss                   : std_logic;
	
	signal system_gpio_0_io_read  				: std_logic_vector(3 downto 0);	
	signal system_gpio_0_io_writeEnable			: std_logic_vector(3 downto 0);	
	signal system_gpio_0_io_write 				: std_logic_vector(3 downto 0);	
	
	
	signal miso_s 	: std_logic;  
	signal mosi_s 	: std_logic;
	signal wpn_n_s 	: std_logic; 
	signal hold_n_s : std_logic;
	
	signal system_spi_0_io_data_0_write_s : std_logic;				-- Latched signals
	signal system_spi_0_io_data_1_write_s : std_logic;
	signal system_spi_0_io_data_2_write_s : std_logic;
	signal system_spi_0_io_data_3_write_s : std_logic;
	signal system_spi_0_io_data_0_writeEnable_s : std_logic; 
	signal system_spi_0_io_data_1_writeEnable_s : std_logic; 
	signal system_spi_0_io_data_2_writeEnable_s : std_logic; 
	signal system_spi_0_io_data_3_writeEnable_s : std_logic; 
	
	signal system_spi_0_io_sclk_write_s : std_logic;
	signal system_spi_0_io_ss_s : std_logic;
	
	signal selectFlash : std_logic;									-- 0=Flash, 1=PSRAM
	
begin
	io_jtag_tms_s <= '0';
	io_jtag_tdi_s <= '0';
	
	io_jtag_tck_s <= '0';
	system_gpio_0_io_read <= (others => '0');
	
	process(CLKOUT0_s,io_systemReset_s)
    begin
		if io_systemReset_s='1' then
			LED1 <= '1';											-- Active low=on
			LED2 <= '1';								
			LED3 <= '1';	
			selectFlash <= '0';										-- Default to flash
			SPI_CS_N    <= '1';
			PSRAM_CS_N  <= '1';
			-- system_gpio_0_io_writeEnable_s 	<= (others => '0');
			-- system_gpio_0_io_write_s 		<= (others => '0');
			-- system_gpio_0_io_read_s 		<= (others => '0');
		elsif rising_edge(CLKOUT0_s) then
		
			-- system_gpio_0_io_writeEnable_s 	<= system_gpio_0_io_writeEnable;
			-- system_gpio_0_io_write_s 		<= system_gpio_0_io_write;
			-- system_gpio_0_io_read_s 		<= system_gpio_0_io_read;
		
		
			if system_gpio_0_io_writeEnable(1)='1' then
				LED1 <= system_gpio_0_io_write(1);
			end if;
			if system_gpio_0_io_writeEnable(2)='1' then
				LED2 <= system_gpio_0_io_write(2);
			end if;
			if system_gpio_0_io_writeEnable(3)='1' then
				LED3 <= system_gpio_0_io_write(3);
			end if;
			if system_gpio_0_io_writeEnable(0)='1' then
				selectFlash <= system_gpio_0_io_write(0);
			end if;
			
			if selectFlash='0' then
				SPI_CS_N <= system_spi_0_io_ss_s;
			else
				PSRAM_CS_N <= system_spi_0_io_ss_s;			
			end if;
			
		end if;
	end process;
	
	process(CLKOUT0_s)
    begin
		if rising_edge(CLKOUT0_s) then
			miso_s 	 <= MISO;   
			mosi_s 	 <= MOSI;   
			wpn_n_s  <= WPN_N;  
			hold_n_s <= HOLD_N; 	
			system_spi_0_io_data_0_write_s       <= system_spi_0_io_data_0_write; -- MOSI
			system_spi_0_io_data_1_write_s       <= system_spi_0_io_data_1_write; -- MISO
			system_spi_0_io_data_2_write_s       <= system_spi_0_io_data_2_write;
			system_spi_0_io_data_3_write_s       <= system_spi_0_io_data_3_write;
			system_spi_0_io_data_0_writeEnable_s <= system_spi_0_io_data_0_writeEnable; 
			system_spi_0_io_data_1_writeEnable_s <= system_spi_0_io_data_1_writeEnable; 
			system_spi_0_io_data_2_writeEnable_s <= system_spi_0_io_data_2_writeEnable; 
			system_spi_0_io_data_3_writeEnable_s <= system_spi_0_io_data_3_writeEnable; 
			
			system_spi_0_io_sclk_write_s         <= system_spi_0_io_sclk_write;
			system_spi_0_io_ss_s                 <= system_spi_0_io_ss;
				
		end if;
    end process;
	
	MOSI   <= system_spi_0_io_data_0_write_s when system_spi_0_io_data_0_writeEnable_s='1' else 'Z'; 
	MISO   <= system_spi_0_io_data_1_write_s when system_spi_0_io_data_1_writeEnable_s='1' else 'Z'; 
	WPN_N  <= system_spi_0_io_data_2_write_s when system_spi_0_io_data_2_writeEnable_s='1' else 'Z';  
	HOLD_N <= system_spi_0_io_data_3_write_s when system_spi_0_io_data_3_writeEnable_s='1' else 'Z';  

	CCK    <= system_spi_0_io_sclk_write_s when system_spi_0_io_ss_s='0' else '1';-- do we need this?
	
	u_T20_Sapphire : entity work.T20_Sapphire
	port map (
		io_systemClk 						=> CLKOUT0_s,
		
		io_jtag_tms 						=> io_jtag_tms_s,
		io_jtag_tdi 						=> io_jtag_tdi_s,
		io_jtag_tdo 						=> open,
		io_jtag_tck 						=> io_jtag_tck_s,
		
		system_spi_0_io_data_0_read			=> mosi_s,
		system_spi_0_io_data_0_write 		=> system_spi_0_io_data_0_write,
		system_spi_0_io_data_0_writeEnable 	=> system_spi_0_io_data_0_writeEnable,
		
		system_spi_0_io_data_1_read 		=> miso_s,
		system_spi_0_io_data_1_write		=> system_spi_0_io_data_1_write,
		system_spi_0_io_data_1_writeEnable 	=> system_spi_0_io_data_1_writeEnable,
		
		system_spi_0_io_data_2_read 		=> wpn_n_s,
		system_spi_0_io_data_2_write 		=> system_spi_0_io_data_2_write,
		system_spi_0_io_data_2_writeEnable 	=> system_spi_0_io_data_2_writeEnable,
		
		system_spi_0_io_data_3_read			=> hold_n_s,
		system_spi_0_io_data_3_write 		=> system_spi_0_io_data_3_write,
		system_spi_0_io_data_3_writeEnable 	=> system_spi_0_io_data_3_writeEnable,
		
		system_spi_0_io_sclk_write 			=> system_spi_0_io_sclk_write,
				
		io_asyncReset 						=> NOT LOCK_s,
		io_systemReset 						=> io_systemReset_s,
			
		system_uart_0_io_txd 				=> TX,
		system_uart_0_io_rxd 				=> RX,
			
		system_gpio_0_io_writeEnable 		=> system_gpio_0_io_writeEnable,
		system_gpio_0_io_write 				=> system_gpio_0_io_write,
		system_gpio_0_io_read 				=> system_gpio_0_io_read,
		
		system_spi_0_io_ss 					=> system_spi_0_io_ss
	);
	
	
    -----------------------------------------------------------------------------------------------
    -- PLL to generate 100MHz from 12MHz input clock, requires Unified netlist mode
	-- Also don't use Interface Designer until after the first run, then correct pin numbers on the 
	-- second run.
    -----------------------------------------------------------------------------------------------
    u_EFX_PLL_V2 : EFX_PLL_V2				
	generic map (
		M => 100,
		N => 1,
		O => 2,
		CLKOUT0_DIV   => 6,
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
		CLKOUT0 => CLKOUT0_s,             
		CLKOUT1 => open,
		CLKOUT2 => open,
		LOCKED  => LOCK_s,
		RSTN    => RESETN,
		FBK     => '0',
		CLKIN   => "000"&CLK,
		CLKSEL  => "00"
	);	
	
	
	
end rtl;
