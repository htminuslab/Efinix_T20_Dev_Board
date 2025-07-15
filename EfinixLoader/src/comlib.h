//---------------------------------------------------------------------------
// ComLib
//                                             
//    Copyright (C) 2008-2009 HT-LAB                                           
//
//---------------------------------------------------------------------------
//  Revision History:                                                        
//                                                                           
//  Date		Revision	Changes 
//	02/05/09	0.1                              
//---------------------------------------------------------------------------
#pragma once

#include <stdio.h>	
#include <stdint.h>
#include <windows.h>

//#include "upload.h"

#define DEBUG_ERROR		(debug&0x0001)								// Print Error Messages, like invalid peripheral access							//
#define DEBUG_UART      (debug&0x0002)
#define VERBOSE_DEBUG	(debug&0x8000)

	
void flushcom(HANDLE port);
void close_comport(HANDLE port);
HANDLE open_comport(char *devicename,uint32_t baud,char parity,int databits,int stopbits,int options);
int write_comport(HANDLE port, unsigned char c, int txdelay);
int read_comport(HANDLE port, unsigned char *c);
int write_comport_array(HANDLE port, const unsigned char *buffer, int len);
uint8_t gencrc(uint8_t *data, size_t len);