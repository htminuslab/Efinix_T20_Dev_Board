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
--	Standard Sapphire core + SPI + UART + Timer		 
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
		
		CCK			: out std_logic;					-- Flash SPI interface
		MISO        : inout std_logic;
		MOSI		: inout std_logic;
		WPN_N		: inout std_logic;					-- IO2 in QSPI
		HOLD_N		: inout std_logic;					-- IO3 in QSPI
		SPI_CS_N	: out std_logic;					-- Flash SS
		
		RX      	: in  std_logic;
		TX      	: out std_logic);
end T20_TOP_RISCV;


`protect version=1
`protect author="author-a", author_info="author-a-details"
`protect data_method="aes256-cbc"

-- `protect key_keyowner="Siemens"
-- `protect key_keyname="SIEMENS-VERIF-SIM-RSA-1"
-- `protect key_method="rsa"
-- `protect key_public_key
-- MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1PiOZztKubrEWF7LoPly
-- 26t+dcRxa9eY3hY+9bJa7kbYCr12J8ChCO/gCtEgf8u0+GtiXbQ+7mYPOSWupa+R
-- mLYPhZQUxxgoVw4r/kL0UVpURaPSSa+E38wTsB9BkS6M/GXCosW341N1sqclVe7k
-- ppvsfFYuqFOoEjZYERek1EpadfJsbykBS2HeAll+WtRKKuDWnX9AOrYD4EbMUEN/
-- gTi3We8l6dCwCz6c7YvdA3EWexGIeYGKSc58NZ309jgxypRvA6j+zjdtSsnepD04
-- hgHbQZK0796cKaH1kNnV7OZQRss4l5Y7/Mo2jjMZCN81CZjmsB7U6/b5RLTI2mcS
-- vwIDAQAB

`protect key_keyowner="Siemens"
`protect key_keyname="SIEMENS-VERIF-SIM-RSA-2"
`protect key_method="rsa"
`protect key_public_key
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx+k+qA5XYbKGz7OB2dvm
zKfSz1pu6AdBOqTfSozf9O4OMKPkbXBrRWFvCCDTXh93KZAHkXy4MjruMaX2GZVO
zb88BMWaZBd5EfHBLUOjUZNQARtG0birIXXJxF3d9OWFmkaS/LKlY7z/NKpuGawh
Z1r3h43ZxAsq6F3ZmxLuIwOSDNE+rvcOp4Y1nt330BzS/3deXr3AyCDveRh015II
XJIHpbGFAuCa4z8P5GMUso01O1EREnVoIoCvx8lGLoAIYGYFawKjK7dOXGCbU7qc
VmyPExL0cTfeeXApDNTUQAwvifj8Pjmfe+7dOfTqY9ZQsCHWO/Uto7ERjzb2RCTS
TQIDAQAB


`protect key_keyowner="Efinix Inc."
`protect key_keyname="EFX_K01"
`protect key_method="rsa"
`protect key_public_key
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoLsMSomQjYVrWnI0lp/z
O8PoZQ5GUgaeEBwUItHNjMoz6JFJU5/T0pSf637SwrmQyeCcO8wHKglG5LrxiwOZ
/8c0l0AsjycSVhhLnzR4UUQg34s/BHX6uf1eKtAYXhSmuWzH3bks2sqpARAJIG4P
Lo2xjUAOKem8f/cDA/EGEAxPXadUVh/pcT0c4Cg7lbd3kembQBgvqewUCY5AOlE8
QKsqMVzZNZQCd1CJfRYLo4cQgz8ezVjz4Bc6kJ05P9ekQ+lyX89RvcSpW9NUS4a7
6nUaM/znmSw8BKbvpJtzA2SNC6LBUQDWRbvDhwdtq4zd2cCzsWdZQCDq97MvcpKQ
3wIDAQAB

`protect begin	

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
	
	signal system_spi_0_io_data_0_read			: std_logic;	-- MISO
	signal system_spi_0_io_data_0_write			: std_logic;
	signal system_spi_0_io_data_0_writeEnable	: std_logic;
	signal system_spi_0_io_data_1_read 			: std_logic;	-- MOSI
	signal system_spi_0_io_data_1_write			: std_logic;
	signal system_spi_0_io_data_1_writeEnable 	: std_logic;
	signal system_spi_0_io_data_2_read 			: std_logic;	-- WPN
	signal system_spi_0_io_data_2_write 		: std_logic;
	signal system_spi_0_io_data_2_writeEnable 	: std_logic;
	signal system_spi_0_io_data_3_read			: std_logic;	-- HOLD
	signal system_spi_0_io_data_3_write 		: std_logic;
	signal system_spi_0_io_data_3_writeEnable 	: std_logic;

	signal system_spi_0_io_sclk_write			: std_logic;
	
	signal miso_s 	: std_logic;  
	signal mosi_s 	: std_logic;
	signal wpn_n_s 	: std_logic; 
	signal hold_n_s : std_logic;
	
	signal system_spi_0_io_data_0_write_s : std_logic;
	signal system_spi_0_io_data_1_write_s : std_logic;
	signal system_spi_0_io_data_2_write_s : std_logic;
	signal system_spi_0_io_data_3_write_s : std_logic;
	signal system_spi_0_io_data_0_writeEnable_s : std_logic; 
	signal system_spi_0_io_data_1_writeEnable_s : std_logic; 
	signal system_spi_0_io_data_2_writeEnable_s : std_logic; 
	signal system_spi_0_io_data_3_writeEnable_s : std_logic; 
	
	signal system_spi_0_io_sclk_write_s : std_logic;
	
begin
	io_jtag_tms_s <= '0';
	io_jtag_tdi_s <= '0';
	
	io_jtag_tck_s <= '0';
	system_gpio_0_io_read_s <= (others => '0');
	
	
	
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
		end if;
    end process;
	
	MOSI   <= system_spi_0_io_data_0_write_s when system_spi_0_io_data_0_writeEnable_s='1' else 'Z'; 
	MISO   <= system_spi_0_io_data_1_write_s when system_spi_0_io_data_1_writeEnable_s='1' else 'Z'; 
	WPN_N  <= system_spi_0_io_data_2_write_s when system_spi_0_io_data_2_writeEnable_s='1' else 'Z';  
	HOLD_N <= system_spi_0_io_data_3_write_s when system_spi_0_io_data_3_writeEnable_s='1' else 'Z';  

	CCK    <= system_spi_0_io_sclk_write_s when SPI_CS_N='0' else '1';
	
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
		io_systemReset 						=> open,
			
		system_uart_0_io_txd 				=> TX,
		system_uart_0_io_rxd 				=> RX,
			
		system_gpio_0_io_writeEnable 		=> open,
		system_gpio_0_io_write 				=> open,
		system_gpio_0_io_read 				=> system_gpio_0_io_read_s,
		
		system_spi_0_io_ss 					=> SPI_CS_N
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
`protect end	