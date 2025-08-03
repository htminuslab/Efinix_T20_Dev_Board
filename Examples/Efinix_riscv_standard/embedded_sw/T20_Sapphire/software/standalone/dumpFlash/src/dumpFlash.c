///////////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 2025 SaxonSoc contributors
//  SPDX license identifier: MIT
//  Full license header bsp/efinix/EfxSapphireSoc/include/LICENSE.MD
///////////////////////////////////////////////////////////////////////////////////

/******************************************************************************
*
* @file main.c: spiDemo
*
* @brief This demo provides example code for reading the device ID and JEDEC ID of the SPI flash
*        device on the development board. The application displays the results on a UART terminal.
*        It continues to print to the terminal until you suspend or stop the application.
*
* @note
*   The default base address map of the SPI flash master is 0xF801_4000.
*   The default SCK frequency is half of the SoC system clock frequency.
*   The default base address of the UART is 0xF801_0000 with a default baud rate of 115200.
*
******************************************************************************/
#include <stdint.h>
#include "bsp.h"
#include "userDef.h"
#include "spi.h"
#include "gpio.h"

/******************************************************************************
*
* @brief This function waits until the SPI flash is not busy.
*
******************************************************************************/
void WaitBusy(void)
{
    u8 out;
    u16 timeout=0;

    while(1)
    {
        bsp_uDelay(1*1000);
        spi_select(SPI, 0);
        //Write Enable
        spi_write(SPI, 0x05);
        out = spi_read(SPI);
        spi_diselect(SPI, 0);
        if((out & 0x01) ==0x00)
            return;
        timeout++;
        //sector erase max=400ms
        if(timeout >=400)
        {
            bsp_printf("Time out .. \r\n");
            return;
        }
    }
}

/******************************************************************************
*
* @brief This function enables the write latch of the SPI flash.
*
******************************************************************************/
void WriteEnableLatch(void)
{
    spi_select(SPI, 0);
    //Write Enable latch
    spi_write(SPI, 0x06);
    spi_diselect(SPI, 0);
}

/******************************************************************************
*
* @brief This function globally locks the SPI flash.
*
******************************************************************************/
void GlobalLock(void)
{
    WriteEnableLatch();
    spi_select(SPI, 0);
    //Global lock
    spi_write(SPI, 0x7E);
    spi_diselect(SPI, 0);
}

/******************************************************************************
*
* @brief This function globally unlocks the SPI flash.
*
******************************************************************************/
void GlobalUnlock(void)
{
    WriteEnableLatch();
    spi_select(SPI, 0);
    //Global unlock
    spi_write(SPI, 0x98);
    spi_diselect(SPI, 0);
}

/******************************************************************************
*
* @brief This function erases a sector of the SPI flash given an address.
*
******************************************************************************/
void SectorErase(u32 Addr)
{
    WriteEnableLatch();
    spi_select(SPI, 0);
    //Erase Sector
    spi_write(SPI, 0x20);
    spi_write(SPI, (Addr>>16)&0xFF);
    spi_write(SPI, (Addr>>8)&0xFF);
    spi_write(SPI, Addr&0xFF);
    spi_diselect(SPI, 0);
    WaitBusy();
}

/*******************************************************************************
*
* @brief This function initialize the spi configuration setting based on the following
*        parameters.
*
* @param
* - cpol: Clock polarity (0 or 1).
* - cpha: Clock phase (0 or 1).
* - mode: SPI mode
*      0: Full-duplex dual line
*      1: Half-duplex dual line
*          (Available only when data width is configured as 8 or 16)
*      2: Half-duplex quad line
*          (Available only when data width is configured as 8 or 16)
*
* - clkDivider: Clock divider value. SPI frequency = FCLK/((clockDivider+1)*2)
*               FCLK is the system clock (io_systemClk) to the SoC. If
*               you enable the peripheral clock, then FCLK is driven by
*               the peripheral clock (io_peripheralClk) instead.
*
* - ssSetup: Slave select setup time. Clock cycle between activated chip-select and first
*            rising-edge of SCLK. Clock cycle refers to FCLK.
*
* - ssHold: Slave select hold time. Clock cycle between last falling-edge and deactivated
*           chip-select is activated. Clock cycle refers to FCLK.
*
* - ssDisable: Slave select disable time.
*
******************************************************************************/
void spiInit(){
    //SPI init
    Spi_Config spiA;
    spiA.cpol       = 1;
    spiA.cpha       = 1;
    spiA.mode       = 0;
    spiA.clkDivider = 19;
    spiA.ssSetup    = 5;
    spiA.ssHold     = 5;
    spiA.ssDisable  = 5;
    spi_applyConfig(SPI, &spiA);
}


void spiReadSector(uint32_t address, uint8_t *buffer)
{
    spi_select(SPI, 0);
    spi_write(SPI, 0x03);
    spi_write(SPI, (address>>16) & 0xFF);
    spi_write(SPI, (address>>8) & 0xFF);
    spi_write(SPI, address & 0xFF);
    for (int i=0;i<256;i++) buffer[i]=spi_read(SPI);
    spi_diselect(SPI, 0);
}

static void uart_writeHex2(u32 reg, uint8_t value){
    for(int i = 1; i >= 0; i--){
        int hex = (value >> i*4) & 0xF;
        uart_write(reg, hex > 9 ? 'A' + hex - 10 : '0' + hex);
    }
}


/******************************************************************************
*
*
******************************************************************************/

void main() {
    uint8_t id;
    int i,len;
    uint8_t buffer[256]={0xFF};

    bsp_init();

    gpio_setOutputEnable(GPIO0, 0xf);			// All 4 pins as output
    gpio_setOutput(GPIO0, 0x0);					// All leds on?


    spiInit();

    spi_select(SPI, 0);							// Wake up flash
    spi_write(SPI, 0xAB);
    spi_write(SPI, 0x00);
    spi_write(SPI, 0x00);
    spi_write(SPI, 0x00);
    id = spi_read(SPI);
    spi_diselect(SPI, 0);

    //bsp_uDelay(100);							// Wait 100usec

    bsp_printf("\n\n\r*** Device ID : %x\r\n", id);
    bsp_printf("\n\n\r*** Dump First Page of FLASH:\r\n");

    gpio_setOutputEnable(GPIO0, 0x1);			// Select PIO(0)
    gpio_setOutput(GPIO0, 0x0);					// PIO(0)=0 select FLASH

	spiReadSector(FLASH_START_ADDR,buffer);
	for (int i=0;i<256;i++) {
		if (i%16==0) {
			bsp_printf("\n%06lx: ",FLASH_START_ADDR+i);
		}
		//bsp_printf("%02x ",buffer[i]); // ignores the 02 specifier
		uart_writeHex2(BSP_UART_TERMINAL, buffer[i]);
		uart_write(BSP_UART_TERMINAL, ' ');
	}

	bsp_printf("\n\n\r*** Dump First Page of PSRAM:\r\n");

    gpio_setOutputEnable(GPIO0, 0x1);			// Select PIO(0)
    gpio_setOutput(GPIO0, 0x1);					// PIO(0)=1 select PSRAM

	spiReadSector(PSRAM_START_ADDR,buffer);
	for (int i=0;i<256;i++) {
		if (i%16==0) {
			bsp_printf("\n%06lx: ",PSRAM_START_ADDR+i);
		}
		uart_writeHex2(BSP_UART_TERMINAL, buffer[i]);
		uart_write(BSP_UART_TERMINAL, ' ');
	}


	bsp_printf("\n\n\rDone\r\n");

}

