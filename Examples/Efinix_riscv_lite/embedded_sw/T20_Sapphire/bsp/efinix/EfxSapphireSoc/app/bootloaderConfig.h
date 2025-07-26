//*------------------------------------------------------------------------------------------
//  MIT License
//  
//  Copyright (c) 2023 SaxonSoc contributors
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//*-----------------------------------------------------------------------------------------
#pragma once

#include "bsp.h"
#include "io.h"
#include "spiFlash.h"
#include "start.h"

#define SPI SYSTEM_SPI_0_IO_CTRL
#define SPI_CS 0

#define USER_SOFTWARE_MEMORY 0xF9000000
#define USER_SOFTWARE_FLASH  0x00380000
#define USER_SOFTWARE_SIZE   0xfc00

#define SINGLE_SPI 1 //define DUAL_SPI for dual data SPI or QUAD_SPI for quad data SPI

void bspMain() {
#ifndef SIM
	spiFlash_init(SPI, SPI_CS);
	spiFlash_wake(SPI, SPI_CS);
	spiFlash_exit4ByteAddr(SPI, SPI_CS);
#ifdef SINGLE_SPI
	spiFlash_f2m(SPI, SPI_CS, USER_SOFTWARE_FLASH, USER_SOFTWARE_MEMORY, USER_SOFTWARE_SIZE);
#elif DUAL_SPI 
    spiFlash_f2m_dual(SPI, SPI_CS, USER_SOFTWARE_FLASH, USER_SOFTWARE_MEMORY, USER_SOFTWARE_SIZE); // dual data line half duplex
#elif QUAD_SPI
    spiFlash_f2m_quad(SPI, SPI_CS, USER_SOFTWARE_FLASH, USER_SOFTWARE_MEMORY, USER_SOFTWARE_SIZE); // quad data line full duplex
#else 
    	#error "You must either define SINGLE_SPI to use single data line SPI, DUAL_SPI to use dual data line SPI or QUAD_SPI to use quad data line SPI."
#endif
#endif

	asm("fence.i; nop; nop; nop; nop; nop; nop"); 
	void (*userMain)() = (void (*)())USER_SOFTWARE_MEMORY;
    #ifdef SMP
        smp_unlock(userMain);
    #endif
	userMain();
}
