//-------------------------------------------------------------------------------------------------
//                                                                           
//  STM32C071 Efinix SPI Hex Loader
//                                          
//  Copyright (C) 2025 HT-LAB                                                                                 
//                                                                           
//-------------------------------------------------------------------------------------------------

#pragma once

#define  MAJOR_VERSION 	0
#define  MINOR_VERSION 	01

#include <stdio.h>	
#include <ctype.h>   
#include <stdlib.h> 
#include <malloc.h>
#include <stdbool.h>
#include <math.h>
#include <string.h>
#include <assert.h>
#include <stdint.h>

#include <fcntl.h>
#include <conio.h>

#include <comlib.h>
#include "frametypes.h"												// Shared with node071 code


#if defined(_MSC_VER)
	#include <time.h>
	#include <sys/types.h>
#else
	#include <stdint.h> 
	#include <unistd.h>	
	#include <sys/types.h>
	#include <sys/time.h>
	#include <sys/stat.h>
#endif

#if defined(_MSC_VER)
	#define qprintf(fmt, ...)  do { if (!quiet)  fprintf(stdout, fmt, __VA_ARGS__); } while (0)	
#else
	#define qprintf(fmt, ARGS...)  do { if (!quiet)  fprintf(stdout, fmt, ##ARGS); } while (0)
#endif

#define DEFAULT_BAUDRATE	921600 									// 115200
#define DEFAULT_COMPORT		"\\\\.\\COM7"
#define MAX_TX_RETRY				3								// Retry 3 times before giving up

#define DEBUG_ERROR		(debug&0x0001)								// Print Error Messages, like invalid peripheral access							//
#define DEBUG_UART      (debug&0x0002)
#define VERBOSE_DEBUG	(debug&0x8000)

// Maximum string length for Command Line argument.
#define MAXARGSTR					256
#define MAX_WORD					80
#define MAX_LINE    				80  
				

//-------------------------------------------------------------------------------------------------
// Prototypes
//-------------------------------------------------------------------------------------------------
void write_flash(HANDLE port,char * hexfilename);
void upload_bitstream(HANDLE port, char * hexfilename);
//uint16_t send_command(HANDLE port, uint8_t cmd);
uint16_t write_frame(HANDLE port, uint8_t  *txframe, int txlength, int chardelay, int ms_timeout);
uint8_t updatecrc8(uint8_t data, uint8_t oldcrc);
uint16_t receive_frame(HANDLE port);
char * status2str(uint8_t status);
size_t strlcat(char *dst,const char *src, size_t size);
void usage_exit(void);
