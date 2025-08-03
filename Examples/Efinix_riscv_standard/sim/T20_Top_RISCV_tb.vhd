library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity t20_top_riscv_tb is
end entity t20_top_riscv_tb;

architecture rtl of t20_top_riscv_tb is
	
	signal nreset_s	  : std_logic;
	signal clk_s	  : std_logic:='0';
	signal clkuart_s  : std_logic:= '0';
	signal rx_s   	  : std_logic;
	signal tx_s   	  : std_logic;
	
	signal cck_s	  : std_logic:='1';
	signal miso_s     : std_logic;
	signal mosi_s	  : std_logic;
	signal wpn_n_s	  : std_logic:='1';
	signal hold_n_s	  : std_logic:='1';
	signal spi_cs_n_s : std_logic:='1';
	
begin
	
	clk_s <= not clk_s after 41.6667 ns;							-- 12MHz
	
	clkuart_s <= NOT clkuart_s after 135.6336 ns;					-- UART 16*115200*2
	
	process
		begin
			nreset_s  <= '0';
			rx_s      <= '1';
			wait for 240 ns;
			wait until rising_edge(clk_s);
			nreset_s  <= '1';	
			wait for 42 us; 		-- io_systemReset negated quite late 
			wait;	
	end process;
	
	
	DUT : entity work.T20_TOP_RISCV
	port map (
		CLK      => clk_s,
		RESETN   => nreset_s,		
		CCK		 =>	cck_s,					-- Flash SPI interface
		MISO     => miso_s,    
		MOSI	 => mosi_s,	
		WPN_N	 =>	wpn_n_s,				-- IO2 in QSPI
		HOLD_N	 =>	hold_n_s,				-- IO3 in QSPI
		SPI_CS_N =>	spi_cs_n_s,				-- Flash SS
		RX       => rx_s,
		TX       => tx_s);

    UMON : entity work.uartmon
	GENERIC MAP (
         CLK16UART => 2,         -- (CLK/(16*9600))
         MAXCHAR_C => 100,
         COMPORT_C => '0'
    )
    PORT MAP (
		RX     => tx_s,
		clk    => clkuart_s,
		resetn => nreset_s
    );

	u_W25Q32JVxxIM : entity work.W25Q32JVxxIM
		port map (
			CSn    => spi_cs_n_s,
			CLK    => cck_s,
			RESETn => nreset_s,
			DIO    => mosi_s,
			WPn    => open,  
			HOLDn  => open, 
			DO     => miso_s
		);

end architecture rtl;
