vlib neorv32
vmap neorv32 neorv32

vmap Efinix H:/simlib/Efinix/Efinix

vlog -quiet -work neorv32 ..\outflow\risc-v.map.core.v -suppress 2685 -suppress 2718
vlog -quiet -work neorv32 ..\outflow\risc-v.map.peri.v -suppress 2685 -suppress 2718

vcom -quiet -2008 -work neorv32 ../testbench/neorv32_efinix_tester.vhd
vcom -quiet -2008 -work neorv32 ../testbench/neorv32_efinix_tb_struct.vhd
vcom -quiet -2008 -work neorv32 ../testbench/uartmon.vhd

vsim -c neorv32.neorv32_efinix_tb -qbase_tune -t ps -L Efinix -do "set NumericStdNoWarnings 1; nolog -r /*; run 40 ms; quit -f"
