/*
 * frametypes.h
 *
 *  Created on: Apr 8, 2025
 *      Author: hans6
 */

#ifndef INC_FRAMETYPES_H_
#define INC_FRAMETYPES_H_

#define SYNC_CHAR					0x7E
#define STUFF_CHAR  				0x3E

#define DATA_LENGTH					16								// Data received from Efinixloader, do not lower than 16bytes and use power(2)
#define DATA_FRAME_LENGTH			(1+1+DATA_LENGTH+1)				// Frame is 11 bytes long without stuffing, SYNC-CMD-DWORD(8)-CRC

#define STATUS_LENGTH				1								// Send back to Efinixloader
#define STATUS_FRAME_LENGTH         (1+1+STATUS_LENGTH+1)			// Do not change, hardcoded length in receive_frame

#define CMD_DATA_LENGTH				1								// Optional Byte
#define CMD_FRAME_LENGTH            (1+1+CMD_DATA_LENGTH+1)			// SYNC-CMD-CRC

#define DUMP_LENGTH					256								// FLASH/PSRAM Dump data length
#define DUMP_FRAME_LENGTH           (1+1+DUMP_LENGTH+1)				// SYNC-STATUS-DUMP_DATA-CRC

//--------------------------------------------------------------------------------------------------
// Flash defines
//--------------------------------------------------------------------------------------------------
#define T20_FLASH_SIZE              (1024 * 1024 * 2)        		// 2Mbyte
#define T20_FLASH_PAGE_SIZE         256								// Assume compatible with Winbond W25Qxx 256 Page program
#define T20_FLASH_SECTOR_SIZE       4096							// Assume compatible with Winbond W25Qxx minimum erase size
#define MAX_BUSY_RETRY				5								// Max 5ms for 1 page write, if busy=1 send NACK


#if T20_FLASH_PAGE_SIZE != DUMP_LENGTH
	#error "T20_FLASH_PAGE_SIZE and DUMP_LENGTH must be equal!"
#endif


//--------------------------------------------------------------------------------------------------
// Flash defines
//--------------------------------------------------------------------------------------------------
#define T20_FLASH_SIZE              (1024 * 1024 * 2)        		// 2Mbyte
#define T20_FLASH_PAGE_SIZE         256								// Assume compatible with Winbond W25Qxx 256 Page program
#define T20_FLASH_SECTOR_SIZE       4096							// Assume compatible with Winbond W25Qxx minimum erase size
#define MAX_BUSY_RETRY				5								// Max 5ms for 1 page write, if busy=1 send NACK


//--------------------------------------------------------------------------------------------------
// Command Field Types first 6 bits
//--------------------------------------------------------------------------------------------------
#define	TYPE_START_DATA 			0x00            				// Start upload bitstream image to FPGA
#define	TYPE_START_FLASH 			0x01            				// Start upload bitstream image to Flash
#define	TYPE_FPGA_DATA 				0x02 							// bitstream data
#define	TYPE_FLASH_DATA 			0x03 							// flash data
#define TYPE_END_PROGRAMMING		0x04							// Restore I/O pins

#define	TYPE_TOGGLE_CRESET 			0x05							// FPGA Reset
#define TYPE_WRITE_PIN              0x06							// Write 0/1 to pin
#define TYPE_READ_PORT              0x07							// Read port A/B/C
#define TYPE_PIN_DIRECTION			0x08
#define TYPE_PIN_RESISTOR			0x09							// Enable Pull-up/Pull-down
#define TYPE_ALT_FUNCTION           0x0A							

#define TYPE_FLASH_CLEAR_ADDR		0x0B						    // Clear 24bits address
#define TYPE_FLASH_INC_PAGE			0x0C							// Increase address by 256
#define TYPE_FLASH_INC_SECTOR		0x0D							// Increase address by 4096
#define TYPE_FLASH_INC_64K			0x0E							// Increase address by 65536
#define TYPE_CHECK_BUSY             0x17							// Read Flash Busy bit
#define TYPE_FLASH_CHIP_ERASE		0x18							// Issue Chip erase, command 0xC7
#define TYPE_FLASH_SECTOR_ERASE		0x19							// Issue sector erase, command 0x20

#define TYPE_ENABLE_UART			0x20							// Connect STM32 UART_TX to GPIO40
#define TYPE_DISABLE_UART			0x21							// Change STM32 UART_TX to input so that GPIO40 is free
#define TYPE_SET_BAUDRATE			0x22							// Set UART Baudrate between STM32 to FPGA

#define	TYPE_DEBUG_STATUS 			0x30
#define TYPE_DUMP_FLASH             0x35							// Dump 256 bytes from FLASH
#define TYPE_DUMP_PSRAM             0x36							// Dump 256 bytes from PSRAM
//#define TYPE_SET_BAUDRATE			0x80							// TBC

#define TYPE_PORTA                  0x10							// 0001000
#define TYPE_PORTB                  0x20							// 0001000
#define TYPE_PORTC                  0x30							// 0001000




//--------------------------------------------------------------------------------------------------
// TXFRAME type wait bit 0
//--------------------------------------------------------------------------------------------------
#define STATUS_BUSY					0x01							// xxxx-xxx1

//--------------------------------------------------------------------------------------------------
// TXFRAME dump bits bit 2:1
//--------------------------------------------------------------------------------------------------
#define STATUS_DUMP_FLASH			0x02							// xxxx-x01x
#define STATUS_DUMP_PSRAM			0x04							// xxxx-x10x

//--------------------------------------------------------------------------------------------------
// TXFRAME type bit 5:4 send back to EfinixLoader
//--------------------------------------------------------------------------------------------------
#define STATUS_NACK					0x10							// xx01-xxxx
#define STATUS_ACK					0x20							// xx10-xxxx
#define STATUS_WAIT					0x30							// xx11-xxxx


//-------------------------------------------------------------------------------------------------
// Status bit positions in second status byte
//-------------------------------------------------------------------------------------------------
#define NSTATUS_POS					0x01
#define CDONE_POS					0x02
#define CDI3_POS					0x04
#define SS_N_POS                    0x08

#endif /* INC_FRAMETYPES_H_ */
