vlib work
vmap work work
vmap Efinix H:/simlib/Efinix/Efinix

vlog -quiet ../ip/T20_Sapphire/Testbench/modelsim/T20_Sapphire.v

vcom -quiet -2008 uartmon.vhd
vcom -quiet -2008 ../T20_Top_RISCV.vhd

@rem vlog -quiet outflow/Efinix_riscv.map.v
vcom -quiet -2008 T20_Top_RISCV_tb.vhd
@rem vsim -voptargs="+acc" t20_top_riscv_tb -do "wave.do"
vsim -c t20_top_riscv_tb -t ps -L Efinix -do "set NumericStdNoWarnings 1; nolog -r /*; run 10 ms; quit -f"