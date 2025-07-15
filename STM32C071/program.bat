@ECHO Program STM32C071 Microcontroller
pause
STM32_Programmer_CLI -c port=swd -d stm32node01.bin 0x8000000 -v