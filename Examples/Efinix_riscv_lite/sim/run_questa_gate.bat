vlib work
vmap work work
vmap Efinix H:/simlib/Efinix/Efinix

@REM vlog -quiet ..\outflow\Efinix_riscv.map.core.v -suppress 2685 -suppress 2718
@REM vlog -quiet ..\outflow\Efinix_riscv.map.peri.v
vlog -quiet Efinix_riscv.map.core.v -suppress 2685 -suppress 2718
vlog -quiet Efinix_riscv.map.peri.v

vcom -quiet -2008 uartmon.vhd
vcom -quiet -2008 T20_Top_RISCV_tb.vhd

vsim -c t20_top_riscv_tb -t ps -L Efinix -do "set NumericStdNoWarnings 1; nolog -r /*; run 10 ms; quit -f"

