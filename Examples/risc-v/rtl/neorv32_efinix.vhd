---------------------------------------------------------------------------------------------------
--  Top level neorv32 minimum boot + pll        
--
--  Revision History:                                                        
--                                                                           
--  Date:          	Revision    Author    
--  12/07/2025      1.0 		HABT                             
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library neorv32;

entity neorv32_efinix is
  generic (
    -- Clocking --
    CLOCK_FREQUENCY : natural := 62666700;       	-- clock frequency of clk_i in Hz
    -- Internal Instruction memory --
    IMEM_EN         : boolean := true;    			-- implement processor-internal instruction memory
    IMEM_SIZE       : natural := 40*1024; 			-- size of processor-internal instruction memory in bytes
    -- Internal Data memory --			
    DMEM_EN         : boolean := true;    			-- implement processor-internal data memory
    DMEM_SIZE       : natural := 32*1024; 			-- size of processor-internal data memory in bytes
    -- Processor peripherals --			
    IO_GPIO_NUM     : natural := 4;       			-- number of GPIO input/output pairs (0..32)
    IO_PWM_NUM_CH   : natural := 0        			-- number of PWM channels to implement (0..16)
  );
  port (
    -- Global control --
    -- clk_i      : in  std_logic;
    -- rstn_i     : in  std_logic;
	CLK     : in  std_logic;
	RESETN  : in  std_logic;  
	
	
    -- GPIO (available if IO_GPIO_EN = true) --
    GPIO     : out std_ulogic_vector(IO_GPIO_NUM-1 downto 0);
    -- primary UART0 (available if IO_UART0_EN = true) --
    -- uart_txd_o : out std_ulogic; -- UART0 send data
    -- uart_rxd_i : in  std_ulogic := '0'; -- UART0 receive data
	UARTTX 	: out std_ulogic; 									-- UART0 send data
	UARTRX 	: in  std_ulogic := '0' 							-- UART0 receive data
		
    -- PWM (available if IO_PWM_NUM_CH > 0) --
   -- pwm_o      : out std_ulogic_vector(IO_PWM_NUM_CH-1 downto 0)
  );
end entity;

architecture rtl of neorv32_efinix is


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

	signal CLKOUT0 : std_logic;
	signal LOCKED_s	   : std_logic;
	signal resetn_s    : std_logic;


  -- internal IO connection --
  signal con_gpio_o : std_ulogic_vector(31 downto 0);
  signal con_pwm_o  : std_ulogic_vector(15 downto 0);

begin

	EFX_PLL_V2_inst : EFX_PLL_V2					-- Instantiate PLL, requires Unified mode
	generic map (
		M => 94,
		N => 1,
		O => 2,
		CLKOUT0_DIV   => 9,
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
		CLKOUT0 => CLKOUT0, 						-- 62.667MHz
		CLKOUT1 => open,
		CLKOUT2 => open,
		LOCKED  => LOCKED_s,
		RSTN    => RESETN,
		FBK     => '0',
		CLKIN   => "000"&CLK,
		CLKSEL  => "00"
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



  -- The core of the problem ----------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  neorv32_inst: entity neorv32.neorv32_top
  generic map (
    -- Clocking --
    CLOCK_FREQUENCY  => CLOCK_FREQUENCY, -- clock frequency of CLK in Hz
    -- Boot Configuration --
    BOOT_MODE_SELECT => 0,               -- boot via internal bootloader
    -- RISC-V CPU Extensions --
    RISCV_ISA_Zicntr => true,            -- implement base counters?
    -- Internal Instruction memory --
    IMEM_EN          => IMEM_EN,         -- implement processor-internal instruction memory
    IMEM_SIZE        => IMEM_SIZE,       -- size of processor-internal instruction memory in bytes
    -- Internal Data memory --
    DMEM_EN          => DMEM_EN,         -- implement processor-internal data memory
    DMEM_SIZE        => DMEM_SIZE,       -- size of processor-internal data memory in bytes
    -- Processor peripherals --
    IO_GPIO_NUM      => IO_GPIO_NUM,     -- number of GPIO input/output pairs (0..32)
    IO_CLINT_EN      => true,            -- implement core local interruptor (CLINT)?
    IO_UART0_EN      => true,            -- implement primary universal asynchronous receiver/transmitter (UART0)?
    IO_PWM_NUM_CH    => IO_PWM_NUM_CH    -- number of PWM channels to implement (0..12); 0 = disabled
  )
  port map (
    -- Global control --
    clk_i       => CLKOUT0,                        -- global clock, rising edge
    rstn_i      => resetn_s,                       -- global reset, low-active, async
    -- GPIO (available if IO_GPIO_NUM > 0) --
    gpio_o      => con_gpio_o,                   -- parallel output
    gpio_i      => (others => '0'),              -- parallel input
    -- primary UART0 (available if IO_UART0_EN = true) --
    uart0_txd_o => UARTTX,                   -- UART0 send data
    uart0_rxd_i => UARTRX,                   -- UART0 receive data
    -- PWM (available if IO_PWM_NUM_CH > 0) --
    pwm_o       => con_pwm_o                     -- pwm channels
  );

  -- GPIO --
  GPIO <= NOT con_gpio_o(IO_GPIO_NUM-1 downto 0);

  -- PWM --
  --pwm_o <= con_pwm_o(IO_PWM_NUM_CH-1 downto 0);


end architecture;
