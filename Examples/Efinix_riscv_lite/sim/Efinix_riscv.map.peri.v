// Efinix verilog description of module T20_TOP_RISCV
// Date : Jul 19 2025  16:32
// Copyright (C) 2013-2025 Efinix Inc. All rights reserved.

module T20_TOP_RISCV (CLK, RESETN, RX, TX);
    input CLK;
    input RESETN;
    input RX;
    output TX;


    \T20_TOP_RISCV~core  \T20_TOP_RISCV~core~inst  (.\EFX_PLL_V2_inst~CLKOUT0 (\EFX_PLL_V2_inst~CLKOUT0 ), .\EFX_PLL_V2_inst~LOCKED (\EFX_PLL_V2_inst~LOCKED ), .\EFX_PLL_V2_inst~RSTN (\EFX_PLL_V2_inst~RSTN ), .CLK(\CLK~EFX_IBUF~O ), .RESETN(\RESETN~EFX_IBUF~O ), .RX(\RX~EFX_IBUF~O ), .TX(\TX~EFX_OBUF~I ));
    EFX_PLL_V2 EFX_PLL_V2_inst (.RSTN(\EFX_PLL_V2_inst~RSTN ), .FBK(1'b0), .CLKIN({1'b0, 1'b0, 1'b0, \CLK~EFX_IBUF~O }), .CLKSEL({1'b0, 1'b0}), .CLKOUT0(\EFX_PLL_V2_inst~CLKOUT0 ), .CLKOUT1(), .CLKOUT2(), .LOCKED(\EFX_PLL_V2_inst~LOCKED )) /* EFX_ATTRIBUTE_CELL_NAME=EFX_PLL_V2, M=100, N=1, O=2, CLKOUT0_DIV=6, CLKOUT1_DIV=2, CLKOUT2_DIV=2, CLKOUT0_PHASE=0, CLKOUT1_PHASE=0, CLKOUT2_PHASE=0, REFCLK_FREQ=12.000000 */ ;
    defparam EFX_PLL_V2_inst.N = 1;
    defparam EFX_PLL_V2_inst.M = 100;
    defparam EFX_PLL_V2_inst.O = 2;
    defparam EFX_PLL_V2_inst.CLKOUT0_DIV = 6;
    defparam EFX_PLL_V2_inst.CLKOUT1_DIV = 2;
    defparam EFX_PLL_V2_inst.CLKOUT2_DIV = 2;
    defparam EFX_PLL_V2_inst.CLKOUT0_PHASE = 0;
    defparam EFX_PLL_V2_inst.CLKOUT1_PHASE = 0;
    defparam EFX_PLL_V2_inst.CLKOUT2_PHASE = 0;
    defparam EFX_PLL_V2_inst.FEEDBACK_CLK = "INTERNAL";
    defparam EFX_PLL_V2_inst.FEEDBACK_MODE = "INTERNAL";
    defparam EFX_PLL_V2_inst.REFCLK_FREQ = 12.000000;
    EFX_IBUF \CLK~EFX_IBUF  (.I(CLK), .O(\CLK~EFX_IBUF~O )) /* EFX_ATTRIBUTE_CELL_NAME=EFX_IBUF, PULL_OPTION="NONE" */ ;
    defparam \CLK~EFX_IBUF .PULL_OPTION = "NONE";
    EFX_IBUF \RESETN~EFX_IBUF  (.I(RESETN), .O(\RESETN~EFX_IBUF~O )) /* EFX_ATTRIBUTE_CELL_NAME=EFX_IBUF, PULL_OPTION="NONE" */ ;
    defparam \RESETN~EFX_IBUF .PULL_OPTION = "NONE";
    EFX_IBUF \RX~EFX_IBUF  (.I(RX), .O(\RX~EFX_IBUF~O )) /* EFX_ATTRIBUTE_CELL_NAME=EFX_IBUF, PULL_OPTION="NONE" */ ;
    defparam \RX~EFX_IBUF .PULL_OPTION = "NONE";
    EFX_OBUF \TX~EFX_OBUF  (.I(\TX~EFX_OBUF~I ), .O(TX)) /* EFX_ATTRIBUTE_CELL_NAME=EFX_OBUF */ ;
endmodule// T20_TOP_RISCV