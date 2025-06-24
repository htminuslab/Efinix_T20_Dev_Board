# Efinix T20Q100 Development Board
## Low-Cost Efinix FPGA development board 

 
# 1. Introduction


Note I am not sponsord by Efinix, I simply like their low-cost FPGA's which are at the time I made this board better value for money than FPGAs from the other major vendors.

# 2. Board Specification

FPGA Efinix T20Q100F4, luts/mem
8..24MHz clock (PLL input), optional 32.768KHz RTC Clock
Programming: Build in USB-C to SPI bridge
I/O : xxx pins available all 3.3volt
Serial Communication: On-board microcontroller to create UART-USB-UART bridge
Control : xx pins can be toggled/read from the PC via the On-Board microtroller
1.8volt LVDS is not supported
Optional 8MByte QSPI memory


# 3. Board Design Criteria

The Board was designed with the following requirements:
1) On-Board Programmer, there is nothing more anoying that purchasing a development board only to find out you need a seperate dongle to program it
2) Programmed using the serial port. Installing drivers like xx don't always goes smoothly. The serial port, although ?? years old is still fully supported under Linux/MACOS/Windows. The only difference with the original standard is that the RS232 drivers are no longer required. A USB-C cable is all you need to program the board and communicate with your design. 
3) Low-Cost, this affected the design in several ways, the board is a 4 layer board with all components on one side. I tried a 2 layer board but gave up after I noticed that the price difference with a 4 board was minimal. The selection of the FPGA, Efinix makes excellent low cost FPGA which are far more cost efective that the AMD/Intel/Lattice equivalent. Minimum amount of switches, there is 1 push button connected to the FPGA but the FPGA is designed to be controlled by a PC (if you need switches).  
4) Easy communication with a PC. The board contains a tiny microcontroller which can act as a USB UART bridge. Thus you can program the board and communicate with your board using a different serial port. 
5) Free tools, the Efinix P&R tools are free and well supported. The same applies to the STM microcontroller, all the programming and configuring tools (like STM32Cube) are free from ST. This means you can change the microcontroller behaviour/IO etc as per your requirements. The only issue here (which classes with point 1) is that you need an STM programming cable. There was simply too much logic to add this to the board and it is not something you change on a regular bases. Most users will not need to change the code. The programming dongle can be purchased for very little moneyt from places like Aliexpress.
6) Expandability, all the free I/O pins are available on the 2.54mm IDC connectors. The clock and power rails are also available on the pins. For most I/O you can use the on-board resulators, if you need more power a standard USB-C port can deliver up to 15Watt.
7) Example design. I wrote a few example designs to get you up and running as quick as possible. 
8) The board should be able to be hand-soldered. This means no 020?? but you still need a microscope unless you have good eyesight. Just watch some of the hundreds of SMD soldering tutorial on youtube.
9) Small size PCB, to keep the cost down

One dissapointment was that the Efinix FPGA is not available from JLC.. which increases the cost. I do hope that they will start to stock these parts which will nodoubt will lower the cost. If you want to manufacture a low cost board then make sure all parts are available from xxx.


# 4. How to order a fully assembled board

You can order a fully assembled board from PCBWay. Note the purchase is directly from PCBWAY, if something goes wrong you need to contact them directly, I have no control over this process other than making the design available to PCBWAY (or JLCPCB or....)
Note that due to crazy delivery cost of the 8MByte SPI memory ($42 for a $2 chip) I did not include it in the original build. There are normally priced versions available on sites like Aliexpress but some of these could be fake or clones, YMMV.

# 4. How to make your own board

The gerber files, schematics and partlist are available in the PCB directory. You can zip these files up and send them to PCBWAY, JLCPCB etc for manufacturing. I would highly recommend you add a stencil when you order this board. Also if you have never used these manufacturers they might give you vouchers which makes the board even cheaper. 

# 4.1 How to program the on-board microcontroller

To program the on-board microcontroller you need the STM32 ST-LINK Utility and the programmer.hex file in the ST directory. Be careful with this step as you can only attempt this once. If you make a mistake then you need the ST... programmer. See section 4.2 if this happens to you. The reason why you can only do this once is that initially the ROM is empty and the build-in bootloader ignores it, however, as soon as you write some code into it it executes it and if the code is incorrect it hangs. Luckily you can still use the build-in bootloader but it requires an external programmer. 

# 4.2 Programming the SMT32C071 failed

If for some reason the programming failed then you need to use the STM32C071 build in bootloader which requires the xxx programmer (available from Aliexpress/ebay etc). Figure 1 shows how to connect the programmer. 


# 4.3 How to test the board

If you make your own board then I would recommend you test each I/O pin, this can be done by uploading the xxx test program. This will simple toggle each pin which you can observe with an oscilloscope. 


# 5. On-Board Programmer

The board has an STM32C071 microcontroller (less than $1) which acts as a UART-USB-C-SPI bridge. No SPI/JTAG programmer is required for this board. At this time the source code for the STM32C071 is not available. If you want to write your own code you need STM32CubeIDE which is freely available from ST Microelectronics.

# 5.1 Programmer Frame Format

If you want to write your own programmer PC software the C source code is available in the programmer directory. The frame format is very simple. No byte stuffing is added as a UART over USB is close to error free.

# 6. FAQ

## 6.1 Can you sell me a fully tested board?
Unfortunately not but you can contact me if you get stuck and tried everything.
## 6.2 Why do you have different size capacitors?
Yes, sorry, I used different sizes as I had quite a few capacitors left from another project. If I ever make a new revision I will streamline all capacitors to the same 0406 size.
## 6.3 Why don't you provide the source code for the STM32C071?
This contains code from another (paid for) project.
## 6.4 Can you change the on-board controller to do XYZ?
Sorry no, however, I am available if you have any questions. It is actually not that difficult to write some custom code.
## 6.5 Do you know a reliable source for the QSPI memory?
No, but the one I bought from xxx seems to work OK.



# 6. Errata

I have noticed that some of the decoupling capacitors are missing the labels. Luckily all the values are the same. 


## License

See the LICENSE file for details.

## Notice
All other trademarks are the property of their respective owners.
