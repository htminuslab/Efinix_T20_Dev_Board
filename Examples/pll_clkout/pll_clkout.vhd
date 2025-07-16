---------------------------------------------------------------------------------------------------
--                                                                           
--  T20Q100 PLL Clock Output test
--                                         
--  Copyright (C) 2025 HT-LAB                                           
--                                                                                                            
--  https://github.com/htminuslab    
--                                                                             
---------------------------------------------------------------------------------------------------        
--
--  Unified Mode needs to be enabled
--  
--
--
--  Revision History:                                                        
--                                                                           
--  Date:          Revision         Author         
--  14-jun-2025	   1.0				HABT
---------------------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY pll_clkout IS
	port (	RESETN	: in  std_logic;
			CLK		: in  std_logic;
			CLKOUT0 : out std_logic);
END pll_clkout ;

--
ARCHITECTURE rtl OF pll_clkout IS

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

	signal CLKOUT0_s   : std_logic;
	signal LOCKED_s	   : std_logic;

begin

    ----------------------------------------------------
    -- PLL Instantiation, requires Unified mode
    ----------------------------------------------------
	EFX_PLL_V2_inst : EFX_PLL_V2					
	generic map (
		M => 128,
		N => 1,
		O => 2,
		CLKOUT0_DIV   => 8,
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
		LOCKED  => LOCKED_s,
		RSTN    => RESETN,
		FBK     => '0',
		CLKIN   => "000"&CLK,
		CLKSEL  => "00"
	);

    process(CLKOUT0_s,LOCKED_s)
    begin
		if LOCKED_s = '0' then
			CLKOUT0 <= '0';
        elsif rising_edge(CLKOUT0_s) then
			CLKOUT0 <= NOT CLKOUT0;
		end if;
	end process;   

END ARCHITECTURE rtl;

