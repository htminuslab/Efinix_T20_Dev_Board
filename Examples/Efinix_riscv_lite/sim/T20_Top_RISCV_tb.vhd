library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity t20_top_riscv_tb is
end entity t20_top_riscv_tb;

architecture rtl of t20_top_riscv_tb is
	
	component uartmon
	generic (
      CLK16UART : integer   := 2;      -- (CLK/(16*9600))
      MAXCHAR_C : integer   := 40;
      COMPORT_C : character := '0'
	);
	port (
      rx     : in     std_logic;
      clk    : in     std_logic;
      resetn : in     std_logic
	);
	end component;
	
	
	signal nreset_s	  : std_logic;
	signal clk_s	  : std_logic:='0';
	signal clkuart_s  : std_logic:= '0';
	signal rx_s   	  : std_logic;
	signal tx_s   	  : std_logic;
	
	
begin
	
	clk_s <= not clk_s after 41.6667 ns;							-- 12MHz
	
	clkuart_s <= NOT clkuart_s after 135.6336 ns;					-- UART 16*115200*2
	--clkuart_s <= NOT clkuart_s after 1.124991 us;					-- UART 16*13889*2

	
	DUT : entity work.T20_TOP_RISCV
	port map (
		CLK    => clk_s,
		RESETN => nreset_s,
		RX     => rx_s,
		TX     => tx_s);

    UMON : uartmon
	GENERIC MAP (
         CLK16UART => 2,         -- (CLK/(16*9600))
         MAXCHAR_C => 60,
         COMPORT_C => '0'
    )
    PORT MAP (
		RX     => tx_s,
		clk    => clkuart_s,
		resetn => nreset_s
    );


	process
		begin
			nreset_s  <= '0';
			rx_s      <= '1';
			wait for 240 ns;
			wait until rising_edge(clk_s);
			nreset_s  <= '1';			
			wait;	
	end process;


end architecture rtl;
