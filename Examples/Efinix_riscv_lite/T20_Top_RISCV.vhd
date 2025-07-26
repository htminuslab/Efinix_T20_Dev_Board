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
--	Just CPU + UART		 
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
		CLK     : in  std_logic;
		RESETN  : in  std_logic;
		RX      : in  std_logic;
		TX      : out std_logic);
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

	signal CLKOUT0_s     : std_logic;
	signal LOCK_s        : std_logic;	-- PLL lock used as reset

	signal system_gpio_0_io_read_s : std_logic_vector(3 downto 0);	
	signal io_jtag_tms_s : std_logic;
	signal io_jtag_tdi_s : std_logic;
  --signal io_jtag_tdo_s : std_logic;
	signal io_jtag_tck_s : std_logic;
	
begin
	io_jtag_tms_s <= '0';
	io_jtag_tdi_s <= '0';
	
	io_jtag_tck_s <= '0';
	system_gpio_0_io_read_s <= (others => '0');
	

    -----------------------------------------------------------------------------------------------
    -- PLL to generate 100MHz from 12MHz input clock, requires Unified netlist mode
	-- Also don't use Interface Designer until after the first run, then correct pin numbers on the 
	-- second run.
    -----------------------------------------------------------------------------------------------
    EFX_PLL_V2_inst : EFX_PLL_V2					
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

	
	u_T20_Sapphire : entity work.T20_Sapphire
	port map (
		io_systemClk => CLKOUT0_s,
		io_jtag_tms => io_jtag_tms_s,
		io_jtag_tdi => io_jtag_tdi_s,
		io_jtag_tdo => open,
		io_jtag_tck => io_jtag_tck_s,
		io_asyncReset => NOT LOCK_s,
		io_systemReset => open,
		system_uart_0_io_txd => TX,
		system_uart_0_io_rxd => RX,
		system_gpio_0_io_writeEnable => open,
		system_gpio_0_io_write => open,
		system_gpio_0_io_read => system_gpio_0_io_read_s
	);
	
	
	
	
	
	
end rtl;
