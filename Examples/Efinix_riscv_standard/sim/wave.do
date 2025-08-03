onerror {resume}
quietly virtual signal -install /t20_top_riscv_tb/UMON { /t20_top_riscv_tb/UMON/rxshift_s(7 downto 0)} char
quietly WaveActivateNextPane {} 0
add wave -noupdate /t20_top_riscv_tb/DUT/CLKOUT0_s
add wave -noupdate /t20_top_riscv_tb/u_W25Q32JVxxIM/CLK
add wave -noupdate /t20_top_riscv_tb/u_W25Q32JVxxIM/CSn
add wave -noupdate /t20_top_riscv_tb/u_W25Q32JVxxIM/DIO
add wave -noupdate -color Coral /t20_top_riscv_tb/u_W25Q32JVxxIM/DO
add wave -noupdate /t20_top_riscv_tb/u_W25Q32JVxxIM/HOLDn
add wave -noupdate /t20_top_riscv_tb/u_W25Q32JVxxIM/WPn
add wave -noupdate /t20_top_riscv_tb/u_W25Q32JVxxIM/RESETn
add wave -noupdate /t20_top_riscv_tb/DUT/PSRAM_CS_N
add wave -noupdate /t20_top_riscv_tb/DUT/SPI_CS_N
add wave -noupdate /t20_top_riscv_tb/DUT/u_T20_Sapphire/io_asyncReset
add wave -noupdate /t20_top_riscv_tb/DUT/u_T20_Sapphire/io_systemReset
add wave -noupdate /t20_top_riscv_tb/DUT/u_T20_Sapphire/system_spi_0_io_data_0_write
add wave -noupdate /t20_top_riscv_tb/DUT/u_T20_Sapphire/system_spi_0_io_data_0_writeEnable
add wave -noupdate /t20_top_riscv_tb/DUT/u_T20_Sapphire/system_spi_0_io_data_1_write
add wave -noupdate /t20_top_riscv_tb/DUT/u_T20_Sapphire/system_spi_0_io_data_1_writeEnable
add wave -noupdate /t20_top_riscv_tb/DUT/u_T20_Sapphire/system_spi_0_io_data_2_read
add wave -noupdate /t20_top_riscv_tb/DUT/u_T20_Sapphire/system_spi_0_io_data_2_write
add wave -noupdate /t20_top_riscv_tb/DUT/u_T20_Sapphire/system_spi_0_io_data_2_writeEnable
add wave -noupdate /t20_top_riscv_tb/DUT/u_T20_Sapphire/system_spi_0_io_data_3_read
add wave -noupdate /t20_top_riscv_tb/DUT/u_T20_Sapphire/system_spi_0_io_data_3_write
add wave -noupdate /t20_top_riscv_tb/DUT/u_T20_Sapphire/system_spi_0_io_data_3_writeEnable
add wave -noupdate /t20_top_riscv_tb/DUT/LED1
add wave -noupdate /t20_top_riscv_tb/DUT/LED2
add wave -noupdate /t20_top_riscv_tb/DUT/LED3
add wave -noupdate /t20_top_riscv_tb/DUT/selectFlash
add wave -noupdate /t20_top_riscv_tb/DUT/system_gpio_0_io_read_s
add wave -noupdate /t20_top_riscv_tb/DUT/system_gpio_0_io_write_s
add wave -noupdate /t20_top_riscv_tb/DUT/system_gpio_0_io_writeEnable_s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {110885883 ps} 0} {{Cursor 2} {1508590691 ps} 1}
quietly wave cursor active 1
configure wave -namecolwidth 245
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 40
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {110819339 ps} {111024350 ps}
