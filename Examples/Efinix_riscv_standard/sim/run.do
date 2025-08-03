vlog -quiet W25Q32JVxxIM.v
vlog -quiet ../ip/T20_Sapphire/Testbench/modelsim/T20_Sapphire.v
vcom -quiet -2008 uartmon.vhd
vcom -quiet -2008 ../T20_Top_RISCV.vhd
vcom -quiet -2008 T20_Top_RISCV_tb.vhd
vsim t20_top_riscv_tb -voptargs="+acc" -t ps -L Efinix 
set NumericStdNoWarnings 1
do wave.do
run -all
