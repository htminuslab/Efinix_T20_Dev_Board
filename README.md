# Efinix T20Q100F3 low-cost Development Board

 
# 1. Introduction

This repository described a small low-cost Efinix T20Q100 FPGA development board. The board can be home-made or ordered fully assembled from PCBWay. The cost as of June 2025 is around [TBC] for a single board.


<p align="center">
<img src="T20Q100_devboard.PNG" alt="T20Q100F3 Development Board"/>
</p>


# 2. Board Specification

- FPGA [Efinix T20Q100F3C4](https://www.efinixinc.com/shop/t20.php), 19728 Luts, 1020Kbit Memory, 36 Multipliers, 5 PLL, 16Mbit Flash
- Easy programmable and powered via USB-C, no drivers required!
- Programs can be loaded into Ram or Flash memory
- 8..48MHz clock (PLL input), optional 32KHz Clock
- 47<sup>1</sup> 3.3volt I/O pins divided over 3 IDC connectors
- 17 FPGA pins can be toggled/monitored via USB-C
- IP Core communication via USB-C (UART2UART bridge)
- *Optional 8MByte ESP-PSRAM64H memory chip*
- On-Board tiny STM32C071 microcontroller to control the FPGA
- Small, less than credit card size (71mm x 48mm)
- Sapphire RISC-V core @106MHz using just 20% of the FPGA LUTs

<sup>1</sup> 1.8volt LVDS is not supported

<p align="center">
<img src="dev_board.png" alt="Development Board"/>
</p>
<p align="center">
Figure1:T20Q100 Development Board 
</p>

# 3. Board Design Criteria

The Board was designed with the following requirements:

**1) On-Board Programmer**

There is nothing more annoying that purchasing a development board only to find out you need a separate dongle to program it. 

*Unfortunately this rule was broken for the on-board STM32 microcontroller which failed to program using [ST's DFU mode](https://www.st.com/resource/en/application_note/cd00264379-usb-dfu-protocol-used-in-the-stm32-bootloader-stmicroelectronics.pdf), luckily the STM32 programming dongles are very cheap.*

**2) Programmed using a plain old serial port**

Installing some special USB drivers isn't always plain sailing. The serial port, although **60 years** old is still fully supported under Linux/MACOS/Windows. A USB-C cable is all you need to program the board and communicate with your design. The serial data is routed close to error free over the USB bus and converted to SPI for the FPGA.

**3) Low-Cost and Simple**

Some of the development boards have tons of interfaces and a price to match. Sometimes you just want a simple board with a target FPGA and some I/O pins, this is one of those boards. The board contains an **Efinix T20Q100F3C4** FPGA which provides one of the best value for money FPGA you can currently buy. In addition, the FPGA comes in a "makers" friendly LQFP package and is readily available for around £8 (DigiKey). The board uses 4 layers with all the components on one side. The price different between a 2 and 4 layers was tiny but having components on both sides did increase the price. A tiny STM32C071 (less than £1 from LCSC) was added which acts as the programmer (USB to SPI bridge), clock oscillator, IP communication and soft switches.

**4) Easy communication with a PC**

The board STMC071 microcontroller can act as a USB to UART bridge and toggle/monitor FPGA pins. Thus you can program the board and communicate with your IP without requiring an external USB to TTL cable. The second UART remains active so you can communicate with e.g. your RISC-V core and toggle/monitor pins at the same time.

**5) Free tools**

The Efinix P&R tools are free and well supported. The same applies to the STM32 microcontroller, programming and configuration tools (like STM32Cube) can be downloaded for free from the ST website. The programming C source code is provided in the EfinixLoader directory and can easily be compiled by gcc/cl etc. 

**6) Expandable**

47 I/O pins of the FPGA are available on three 2.54mm IDC connectors. The power rails including the USB Vbus line are also available on one of the IDC connectors. 

**7) Assembled at home**

The board should be able to be hand-soldered. This means no 0201 components where used but you still need a microscope unless you have very good eyesight. Just watch some of the hundreds of SMD soldering tutorial on YouTube. 


# 4. How to order a fully assembled board

You can order a [fully assembled board from PCBWay](https://www.pcbway.com/project/shareproject/Efinix_T20Q100_FPGA_Development_Board_0ee8c6c9.html), this is the easiest and quickest way to get the board. The only disadvantage is the minimum order quantity of 5 boards. 

The price displayed when you select PCB+Assembly is not the price you pay (not talking about VAT+Delivery). After you add the boards to the shopping cart PCBWay calculates the real price after a short review period. 

Note that the purchase is directly from PCBWAY, if something goes wrong you need to contact them directly, I have no control over this process other than making the design freely available. 

<p align="center">
<img src="readymade.png" alt="Fully Assembled Board"/>
</p>

The fully assembled board does not yet contain the ESP-PSRAM64H and any through-hole components as this will increase the assembly cost considerably. The ESP-PSRAM64H was omitted due to the (silly) delivery charges. This is an easy to solder device and can be added later. You also don't have to use an ESP-PSRAM64H as most of the SOIC8 PSRAM devices have the same pin-out and SPI commands. For example an alternative (untested) device is the "APS1604M-3SQR" 16Mbit QSPI/QPI PSRAM device which is available for around [$1 from LCSC](https://lcsc.com/product-detail/PSRAM_AP-Memory-APS1604M-3SQR-ZR_C22423595.html?s_z=n_PSRAM). 

Once you have received the board(s) you need to solder J5 (4 pins) and close jumper J3.

# 5. How to make your own board

Making your own board can be more cost-effective if you already have the necessary tools. The price from PCBWay [07/25] is roughly $60/&pound;45 for 5 boards (excl delivery, VAT). The most expensive chip is the T20Q100F3 which is available from [DigiKey](https://www.digikey.com/en/products/detail/efinix-inc/T20Q100F3C4/19101258) for about $10, watch out for delivery charges. The remaining parts can be purchased from [LCSC Electronics](https://lcsc.com/) for very little money.

The Gerber files, schematics and part list are available in the PCB directory. You can zip up these files and send them to PCBWAY, JLCPCB etc for manufacturing. I would highly recommend you add a stencil when you order this board. Also if you have never used these manufacturers before they might give you first-time-buyer vouchers which makes the board even cheaper. 

<p align="center">
<img src="blank_pcb.png" alt="Blank PCB Board"/>
</p>

I assembled one of the board myself and although I did have some difficulties with dry joints and solder bridges it did work in the end. I used a hotplate and a digital microscope to assemble it.


# 6. Steps to program the on-board microcontroller

There are several ways the STM32C071 microcontroller can be programmed. The initial idea was to use the on-board STM32 DFU loader which should work via the USB-C port, unfortunately this worked on one board but failed on others. I have not been able to figure why but I suspect the loader locks on to the wrong peripheral when it sniffs for data and never reaches the USB port. 
The only method that worked consistently and reliably on all boards was to use an ST-Link/V2 programmer. Luckily you can purchase one of the programmer for just a few pounds/dollars/euros on places like eBay, Amazon, AliExpress (which I used). 

<p align="center">
<img src="clone_stlink.png" alt="ST-Link/V2 programmer"/>
</p>
<p align="center">
Figure2: Low-Cost ST-Link/V2 programmers
</p>

Note however that most of these dongles are clones and not always work perfectly with the official free STM tools. In my case the STM32Cube programmer in GUI mode did not recognised my (white, left) ST-Link/V2 programmer. Luckily the command line version worked fine, in addition STMCubeIDE build in programmer also worked fine.


<p align="center">
<img src="stlink_v2.png" alt="ST-Link/V2 connection"/>
</p>
<p align="center">
Figure3: connecting ST-Link/V2 to J5
</p>

Here are the steps to program the STM32 microcontroller:

1) Purchase an STM32 ST-Link/V2 dongle
2) Download the free [STM32 Cube Programmer Utility](https://www.st.com/en/development-tools/stm32cubeprog.html)
3) Connect the ST-link/V2 as shown in figure 3, note a fully assembled board from PCBWay does not have any through-hole components so you need to solder the J5 connector first.
4) Open a CMD prompt, navigate to the STM32C071 directory and issue the following command:

```
STM32_Programmer_CLI -c port=swd -d stm32node01.bin 0x8000000 -v
```

The output should look something like:

```
H:\GitHub\Efinix_T20_Dev_Board\STM32C071>STM32_Programmer_CLI -c port=swd -d stm32node01.bin 0x8000000 -v
      -------------------------------------------------------------------
                       STM32CubeProgrammer v2.20.0
      -------------------------------------------------------------------

ST-LINK SN  : R
ST-LINK FW  : V2J46S7
Board       : --
Voltage     : 3.08V
SWD freq    : 4000 KHz
Connect mode: Normal
Reset mode  : Software reset
Device ID   : 0x493
Revision ID : Rev Z
Device name : STM32C07x
Flash size  : 128 KBytes
Device type : MCU
Device CPU  : Cortex-M0+
BL Version  : 0xD1

Opening and parsing file: stm32node01.bin

Memory Programming ...
  File          : stm32node01.bin
  Size          : 34.45 KB
  Address       : 0x08000000

Erasing memory corresponding to segment 0:
Erasing internal memory sectors [0 17]
Download in Progress:
██████████████████████████████████████████████████ 100%

File download complete
Time elapsed during download operation: 00:00:01.012

Verifying...

Read progress:
██████████████████████████████████████████████████ 100%

Time elapsed during verifying operation: 00:00:00.230

Download verified successfully
```

Power cycle the board and you should get 2 extra UARTs, **you are now ready to use the board **


<p align="center">
<img src="device_manager.png" alt="device_manager showing 2 extra UART"/>
</p>
<p align="center">
Figure4: Windows device_manager showing 2 extra UART
</p>

Note the STM32 microcontroller are a popular choice for makers and hence you can find lots of resources on the internet on how to programming these devices.


# 6.1 Test we can communicate with the microcontroller

After programming the on-board microcontroller we can test the communication by using the EfinixLoader program. The EfinixLoader is a simple program which takes an FPGA bitstream file (in hex) and uploads it to the Efinix T20Q100 FPGA (or its internal Flash). 

**Navigate to the EfinixLoader directory for more information and source code for this loader.**

For a quick test you can issue the following command:

```
h:\GitHub\Efinix_T20_Dev_Board\EfinixLoader>EfinixLoader.exe -com 7 -status

**************************************************
***        Efinix SPI FPGA Hex loader          ***
***         Ver 0.2 (c)2025 HT-LAB             ***
*** github.com/htminuslab/Efinix_T20_Dev_Board ***
**************************************************

Comport            : \\.\COM7 921600,N,8,1
cdone=0 NSTATUS=1  >> Ready for Programming <<

Done.
```

This should report if communication is working.

Note that 2 UARTs are routed via the USB-C port, by default the lower UART port should be connected to the EfinixLoader, however, I am not sure this is always the case on the various OS's.
The second UART is connected to the EFINIX FPGA and can be used to communicate with a UART IP core.


# 7 FPGA Examples

The example folders has several ready to run examples including two RISC-V cores (Neorv32, Efinix's Sapphire @100MHz) a PLL a UART2UART bridge and of course the mandatory blinking LED example. 

For simulation I use Questa Base but I kept the scripts as simple as possible so porting to another (dual language) simulator should be straightforward.

 
# 8 Board Specifications

The schematics, parts list and PCB gerber files can be found in the PCB directory.

## 8.1 Clock Sources

The T20Q100 development board does not have an external oscillator, instead the STM32C071 is used to generate the FPGA clock. This not only keeps the cost down but also provide a more flexible clock generation solution as the STMC071 can generate a range of frequencies from 1MHz to 48MHz. A T20Q100 PLL can then be used to further adjust the frequency.

<p align="center">
<img src="clock_sources.png" alt="Clock Sources"/>
</p>
</p>
<p align="center">
Figure5: Clock Sources
</p>

The generated clock out of the STM32C071 is routed to pin 7 and pin 54 of the T20Q100 FPGA. In the schematics the clock is labelled as CLK48M, however, a default value of 12MHz is used which is within the spec of the T20Q100 PLL (GPIOR_157_PLLIN) and is a more power efficient than routing 48MHz across the board.  However since the minimum PLL in clock frequency is 10MHz the clock is also routed to a standard (non-PLL) input (CLK0, pin 7).

A second clock of 32KHz is available but not yet implemented. The 32KHz clock has a 5% tolerance (before calibration) compare to 1% for the 12MHz clock. You can easily use the 12MHz clock to generate a more accurate 32KHz clock and the power consumption difference is minimal. For these reasons I have programmed the pin as a general I/O but feel free to convince me otherwise.
 

See **examples\pll_test** for a unified flow example. Note that the current Efinity 2025.1.110 version does seems to have some gremlins when it comes to the PLL. I have observed some strange behaviour where the PLL was not recognised in the source until I added the SDC file. If you hit any issues post it on the Efinix Mailing list, there some good Efinix AE's on that list.

## 8.2 Internal Flash

The T20Q100F3 has 16Mbit of internal flash which can be used to load the FPGA during power up and/or for internal storage. The Efinixloader can be used to program the flash and to read the contents back. Each image requires 663Kbyte, thus about 1.4MByte is available for user code. See examples directory for an example on how to read the flash with a RISC_V core. 


## 8.3 PSRAM memory

The user can fit a Pseudo Static Memory device which can be used to add some RAM to the board. The board was designed and tested with a 64Mbit ESP-PSRAM64H. Note that most of the SOIC8 PSRAM devices seem to have the same pin-out and SPI commands. For example an alternative (untested) device is the "APS1604M-3SQR" 16Mbit QSPI/QPI PSRAM device which is available for around [$1 from LCSC](https://lcsc.com/product-detail/PSRAM_AP-Memory-APS1604M-3SQR-ZR_C22423595.html?s_z=n_PSRAM). 

<p align="center">
<img src="psram_flash.png" alt="Flash/PSRAM Connections"/>
</p>
</p>
<p align="center">
Figure6: Flash/PSRAM Connections
</p>

Note that if J3 is closed (which is recommended) pin GPIOL_00 and GPIOL_45 are connected and hence only 1 should be driven at the same time. The examples directory has an example on how to read the PSRAM with a RISC_V core.

## 8.4 LEDs

The T20Q100 development board has 5 LED's, 1 red LED is used for Power, 1 blue LED is connected to the STM32C071 controller and the remaining 3 LED's can be controller by the T20Q100 (pin GPIOB_TXP01, GPIOB_TXN04 and GPIOB_TXP07). Apart from the power LED and other LED's are off by default.  The 3 FPGA LED's are all used in the blink_led example example. The STM32 blue LED connected to the STM32C071 port PB4. You can turn it on and off using the Efinixloader (Windows Batch file example):

```
@REM STM32 Blue Led on
EfinixLoader.exe -com 7 -setpinb 4 0
@REM STM32 Blue Led off
EfinixLoader.exe -com 7 -setpinb 4 1
```

This STM32C071 blue led is used for debugging and if turned on something has gone wrong on the STM32C071 code.

## 8.5 Push Button

The T20Q100 Development board has a tiny single push button connected to GPIOB_TXP04(32) pin, the push action results in an active low signal (default pull-up). When using this push button a debounce circuit might be required. In my opinion it is easier to use the STM32C071 to drive a pin than to use this tiny push button.


## 8.6 STM32 T20Q100 parallel pin connections

The STM32C071 has a total of 17 parallel pin connections with the T20Q100. These pins can be input or output. See pin_toggle example. Note development is in progress to make the pin assignment more flexible.

## 8.7 Power consumption

The board has a 500mA 3.3volt and a 300mA 1.2 volt linear regulator. In passive mode waiting to be programmed the whole board consumes around 76mW, when the RISC-V core is running at 67MHz with 1 LED toggling the power increases to about 268mW. 

# 9. FAQ

## 9.1 Do you provide the source code for the STM32C071?
Not yet, however, using STM32CubeIDE it shouldn't be too difficult to write your own code.

## 9.2 Can you change the on-board controller to do XYZ?
Perhaps, just log an enhancement request on GitHub and I will have a look.

## 9.3 Do you know a reliable source for the PSRAM memory?
No, but I have used an [ESP-PSRAM64H ordered from AliExpress](https://www.aliexpress.com/item/1005006440914173.html?spm=a2g0o.order_detail.order_detail_item.3.7f72f19cpM4uCz) which worked fine (not tested at full 133MHz speed)

# 10. Errata

- Some of the decoupling capacitor labels are missing around U3, see correction in PCB\silkscreen.pdf
- Missing pull-up on SPI_CS_N, this is only minor as the pin is connected to GPIOL_46 which has a weak pull-up.


# 11. New Revision

If you are planning to make your own board based on this design I would recommend the following: 
- Fix the issue as described under the above errata section
- Add missing pin1 indicator to J5
- Add 2.54mm test pin to the USART RX (PB7) of the STM32C071
- The D2(SP0503BAHT) ESD protection diode might be redundant given the large number of exposed pins without protection
- Close J3 and remove GPIOL_45 connection as it is no longer required


## License

- **Software code** is licensed under the [MIT License](./MIT_License.txt).
- **Design files** (Board Design, schematics, etc.) is licensed under the [Creative Commons License](./CC_License.txt)



## Notice
All other trademarks are the property of their respective owners.
