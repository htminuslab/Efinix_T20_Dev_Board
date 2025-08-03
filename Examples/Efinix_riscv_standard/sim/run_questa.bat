vlib work
vmap work work
vmap Efinix H:/simlib/Efinix/Efinix

vlog -quiet W25Q32JVxxIM.v
vlog -quiet ../ip/T20_Sapphire/Testbench/modelsim/T20_Sapphire.v



@REM use protected top level
@rem vcom -quiet -2008 ../T20_Top_RISCV_prot.vhd
vcom -quiet -2008 ../T20_Top_RISCV.vhd

vcom -quiet -2008 uartmon.vhd
vcom -quiet -2008 T20_Top_RISCV_tb.vhd

vsim t20_top_riscv_tb -voptargs="+acc" -t ps -L Efinix -do "set NumericStdNoWarnings 1; do wave.do; run -all"
@rem vsim -c t20_top_riscv_tb -t ps -L Efinix -do "set NumericStdNoWarnings 1; nolog -r /*; run 500 ms; quit -f"