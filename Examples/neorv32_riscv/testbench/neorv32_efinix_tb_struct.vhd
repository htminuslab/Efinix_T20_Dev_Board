---------------------------------------------------------------------------------------------------
--  neorv32 testbench        
--
--  Revision History:                                                        
--                                                                           
--  Date:          	Revision    Author    
--  12/07/2025      1.0 		HABT                             
---------------------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY std;
USE std.TEXTIO.all;


ENTITY neorv32_efinix_tb IS
   -- GENERIC( 
      -- -- Clocking --
      -- CLOCK_FREQUENCY : natural := 0;            -- clock frequency of clk_i in Hz
      -- -- Internal Instruction memory --
      -- IMEM_EN         : boolean := true;         -- implement processor-internal instruction memory
      -- IMEM_SIZE       : natural := 32*1024;      -- size of processor-internal instruction memory in bytes
      -- -- Internal Data memory --
      -- DMEM_EN         : boolean := true;         -- implement processor-internal data memory
      -- DMEM_SIZE       : natural := 32*1024;      -- size of processor-internal data memory in bytes
      -- -- Processor peripherals --
      -- IO_GPIO_NUM     : natural := 4;            -- number of GPIO input/output pairs (0..32)
      -- IO_PWM_NUM_CH   : natural := 0             -- number of PWM channels to implement (0..16)
   -- );
END neorv32_efinix_tb ;


ARCHITECTURE struct OF neorv32_efinix_tb IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL CLK     : std_logic;
   SIGNAL CLKUART : std_logic;
   SIGNAL GPIO    : std_ulogic_vector(3 DOWNTO 0);
   SIGNAL RESETN  : std_logic;
   SIGNAL UARTRX  : std_ulogic := '0';
   SIGNAL UARTTX  : std_ulogic;


   -- Component Declarations
   COMPONENT neorv32_efinix
   -- GENERIC (
      -- -- Clocking --
      -- CLOCK_FREQUENCY : natural := 62666700;      -- clock frequency of clk_i in Hz
      -- -- Internal Instruction memory --
      -- IMEM_EN         : boolean := true;          -- implement processor-internal instruction memory
      -- IMEM_SIZE       : natural := 32*1024;       -- size of processor-internal instruction memory in bytes
      -- -- Internal Data memory --
      -- DMEM_EN         : boolean := true;          -- implement processor-internal data memory
      -- DMEM_SIZE       : natural := 32*1024;       -- size of processor-internal data memory in bytes
      -- -- Processor peripherals --
      -- IO_GPIO_NUM     : natural := 4;             -- number of GPIO input/output pairs (0..32)
      -- IO_PWM_NUM_CH   : natural := 0              -- number of PWM channels to implement (0..16)
   -- );
   PORT (
      CLK    : IN     std_logic;
      RESETN : IN     std_logic;
      UARTRX : IN     std_ulogic  := '0';
      GPIO   : OUT    std_ulogic_vector (4-1 DOWNTO 0);
      UARTTX : OUT    std_ulogic
   );
   END COMPONENT;
   COMPONENT neorv32_efinix_tester
   PORT (
      CLK     : OUT    std_logic ;
      CLKUART : OUT    std_logic ;
      RESETN  : OUT    std_logic ;
      UARTRX  : OUT    std_ulogic 
   );
   END COMPONENT;
   COMPONENT uartmon
   GENERIC (
      CLK16UART : integer   := 2;      -- (CLK/(16*9600))
      MAXCHAR_C : integer   := 40;
      COMPORT_C : character := '0'
   );
   PORT (
      RX     : IN     std_logic;
      clk    : IN     std_logic;
      resetn : IN     std_logic
   );
   END COMPONENT;

BEGIN

   -- Instance port mappings.
   U_DUT : neorv32_efinix
      -- GENERIC MAP (
         -- -- Clocking --
         -- CLOCK_FREQUENCY => 62666700,         -- clock frequency of clk_i in Hz
         -- -- Internal Instruction memory --
         -- IMEM_EN         => true,             -- implement processor-internal instruction memory
         -- IMEM_SIZE       => 64*1024,          -- size of processor-internal instruction memory in bytes
         -- -- Internal Data memory --
         -- DMEM_EN         => true,             -- implement processor-internal data memory
         -- DMEM_SIZE       => 64*1024,          -- size of processor-internal data memory in bytes
         -- -- Processor peripherals --
         -- IO_GPIO_NUM     => 4,                -- number of GPIO input/output pairs (0..32)
         -- IO_PWM_NUM_CH   => 0                 -- number of PWM channels to implement (0..16)
      -- )
      PORT MAP (
         CLK    => CLK,
         RESETN => RESETN,
         GPIO   => GPIO,
         UARTTX => UARTTX,
         UARTRX => UARTRX
      );
	  
   U_TEST : neorv32_efinix_tester
      PORT MAP (
         CLK     => CLK,
         CLKUART => CLKUART,
         RESETN  => RESETN,
         UARTRX  => UARTRX
      );
   U_UMON : uartmon
      GENERIC MAP (
         CLK16UART => 2,         -- (CLK/(16*9600))
         MAXCHAR_C => 40,
         COMPORT_C => '0'
      )
      PORT MAP (
         RX     => UARTTX,
         clk    => CLKUART,
         resetn => RESETN
      );

END struct;
