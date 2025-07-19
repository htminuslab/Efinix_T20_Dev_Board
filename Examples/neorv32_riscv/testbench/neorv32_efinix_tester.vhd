---------------------------------------------------------------------------------------------------
-- Simple tester module for neorv32 testbench        
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

ENTITY neorv32_efinix_tester IS
   PORT( 
      CLK     : OUT    std_logic;
      CLKUART : OUT    std_logic;
      RESETN  : OUT    std_logic;
      UARTRX  : OUT    std_ulogic
   );
END neorv32_efinix_tester ;

ARCHITECTURE rtl OF neorv32_efinix_tester IS

	signal clk_s         : std_logic := '0';
	signal clkuart_s     : std_logic := '0';
	
BEGIN

	clk_s     <= NOT clk_s after 41.6667 ns;							-- 12MHz
	CLK       <= clk_s;
	
	--clkuart_s <= NOT clkuart_s after 1627.604 ns;					-- UART 16*9600*2
	clkuart_s <= NOT clkuart_s after 135.6336 ns;					-- UART 16*115200*2
	CLKUART   <= clkuart_s;
	
	RESETN    <= '0', '1' after 655 ns;


	UARTRX    <= '1';


END ARCHITECTURE rtl;

