//---------------------------------------------------------------------------
// ComLib
//                                             
//    Copyright (C) 2008-2020 HT-LAB                                           
//
//---------------------------------------------------------------------------
//  Revision History:                                                        
//                                                                           
//  Date		Revision	Changes 
//	02/05/09	0.1                            
//---------------------------------------------------------------------------
#include <comlib.h>

#define STATUS_CHECK_TIMEOUT      5000   				// Milliseconds

extern int debug;										// Set to 1 to enable debug messages
extern int quiet;										// Set to 1 to disable messages

int tohex(int n) 
{
	if (n<10) return (n+48); 
	     else return (n-10+65);
}


//---------------------------------------------------------------------------
// Win32 functions
//---------------------------------------------------------------------------

void set_up_serial_port(HANDLE h, uint32_t baud)
{
	DCB properties;										// Serial port properties 
	COMMTIMEOUTS CommTimeOuts;							// Timeout structure

	GetCommState(h, &properties);						// Get & modify them

	switch(baud) {										// Set the baudrate
		case 1200:
			properties.BaudRate = CBR_1200;
			break;
		case 2400:
			properties.BaudRate = CBR_2400;
			break;
		case 4800:
			properties.BaudRate = CBR_4800;
			break;
		case 9600:
			properties.BaudRate = CBR_9600;
			break;
		case 14400:
			properties.BaudRate = CBR_14400;
			break;
		case 19200:
			properties.BaudRate = CBR_19200;
			break;
		case 38400:
			properties.BaudRate = CBR_38400;
			break;
		case 57600:
			properties.BaudRate = CBR_57600;
			break;
		case 115200:
			properties.BaudRate = CBR_115200;
			break;
		case 128000:
			properties.BaudRate = CBR_128000;
			break;
		case 256000:
			properties.BaudRate = CBR_256000;
			break;
		case 230400:
			properties.BaudRate = 230400;
			break;			
		case 460800:
			properties.BaudRate = 460800;
			break;				
		case 921600:
			properties.BaudRate = 921600;
			break;				
		case 1000000:
			properties.BaudRate = 1000000;
			break;


		default:
			fprintf(stderr, "Invalid baud rate: %d", baud);
			exit(0);
			break;
	}
	
	properties.Parity = NOPARITY;
	properties.ByteSize = 8;
	properties.StopBits = TWOSTOPBITS; //ONESTOPBIT;

	properties.fBinary = TRUE;                    		// binary mode, no EOF check
	properties.fParity = FALSE;                   		// enable parity checking
	properties.fOutxCtsFlow = FALSE;              		// CTS output flow control
	properties.fOutxDsrFlow = FALSE;              		// DSR output flow control
//	properties.fDtrControl = DTR_CONTROL_ENABLE;  		// DTR flow control type
//	properties.fDsrSensitivity = FALSE;           		// DSR sensitivity
//	properties.fTXContinueOnXoff = TRUE;          		// XOFF continues Tx
	properties.fOutX = FALSE;                     		// XON/XOFF out flow control
	properties.fInX = FALSE;                      		// XON/XOFF in flow control
	properties.fErrorChar = FALSE;                		// enable error replacement
	properties.fNull = FALSE;                     		// enable null stripping
//	properties.fRtsControl = RTS_CONTROL_ENABLE;  		// RTS flow control
	properties.fAbortOnError = FALSE;             		// abort reads/writes on error
//	properties.XonLim = 0;                        		// transmit XON threshold
//	properties.XoffLim = 0;                       		// transmit XOFF threshold
//	properties.XonChar = 0;                       		// Tx and Rx XON character
//	properties.XoffChar = 1;                      		// Tx and Rx XOFF character
//	properties.ErrorChar = 0;                     		// error replacement character
//	properties.EofChar = 0;                       		// end of input character
//	properties.EvtChar = 0;                       		// received event character

	SetCommState(h, &properties);						// Write the new settings

				
	if (GetCommTimeouts(h, &CommTimeOuts)) { 			// Get & modify comport timeout properties 
		CommTimeOuts.ReadIntervalTimeout = 0;
		CommTimeOuts.ReadTotalTimeoutMultiplier = 20;
		CommTimeOuts.ReadTotalTimeoutConstant = 40;
		CommTimeOuts.WriteTotalTimeoutMultiplier = 20;
		CommTimeOuts.WriteTotalTimeoutConstant = 40;
	} else {
		fprintf(stderr, " Failed to get timeouts values\n");
	}

	if (!SetCommTimeouts(h, &CommTimeOuts)) {
		fprintf(stderr, " Failed to set timeouts values\n");
	}

}

void flushcom(HANDLE port)											// purge any information in the buffer
{
	PurgeComm(port, PURGE_TXCLEAR | PURGE_RXCLEAR );
}


void close_comport(HANDLE port)
{
	flushcom(port);
	CloseHandle(port);
}

HANDLE open_comport(char *devicename,uint32_t baud,char parity,int databits,int stopbits,int options)
{
	HANDLE port;													// Handle to the serial port 
	BOOL status;
	
   	//port = CreateFile(devicename, GENERIC_READ | GENERIC_WRITE, 0,NULL,OPEN_EXISTING,FILE_FLAG_OVERLAPPED,NULL);	 // works
	port = CreateFile(devicename, GENERIC_READ | GENERIC_WRITE, 0,NULL,OPEN_EXISTING,0,NULL);	 


    if (port == INVALID_HANDLE_VALUE) {
		fprintf(stderr, "Error opening comport port %s error=%ld\n",devicename,GetLastError());
		fflush(stdout);
		CloseHandle(port);											// Required?
		exit(1);
	} else {		
	   	
      	// get any early notifications
       	status=SetCommMask(port, EV_RXCHAR | EV_TXEMPTY | EV_ERR | EV_BREAK); 	
		if (!status) {
			printf("\nSetCommMask(0 returned an error");
		}
		
	   	set_up_serial_port(port, baud);								// Set up comport 
		 
		 
		// osStatus.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
		// if (osStatus.hEvent == NULL) {
			// printf("\nCreateEvent returned an error\n");
		// }
		
		// osRXStatus.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
		// if (osRXStatus.hEvent == NULL) {
			// printf("\nRX CreateEvent returned an error\n");
		// }
		
		// osTXStatus.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
		// if (osTXStatus.hEvent == NULL) {
			// printf("\nTX CreateEvent returned an error\n");
		// }
				 		 
		flushcom(port);												// purge any information in the buffer
   	
		if (debug) printf("%s Initialised OK\n",devicename);
	}
	return port;													// Return Handle or INVALID_HANDLE_VALUE
}


// //---------------------------------------------------------------------------
// // Return WaitCommEvent mask  
// //---------------------------------------------------------------------------
// DWORD get_comstatus(HANDLE port)
// {
	// DWORD retmask=0;

	// if (!fWaitingOnStat) {
        // if (!WaitCommEvent(port, &dwCommEvent, &osStatus)) {
			// if (GetLastError() == ERROR_IO_PENDING) {
               // fWaitingOnStat = TRUE;
			// } else {
               // printf("\nError in WaitCommEvent\n");
			// }
		// } else retmask=dwCommEvent;           						// WaitCommEvent returned mask status		
	// }

    // // Check on overlapped operation.
	// if (fWaitingOnStat) {
         // // Wait a little while for an event to occur.
		// dwRes = WaitForSingleObject(osStatus.hEvent, STATUS_CHECK_TIMEOUT);
		// switch(dwRes) {           									// Event occurred.
			// case WAIT_OBJECT_0: 
				// if (!GetOverlappedResult(port, &osStatus, &dwOvRes, FALSE))
                    // // An error occurred in the overlapped operation;
                    // // call GetLastError to find out what it was
                    // // and abort if it is fatal.
					// printf("\nGetOverlappedResult returned an error\n");
                 // else
                    // // Status event is stored in the event flag
                    // // specified in the original WaitCommEvent call.
                    // // Deal with the status event as appropriate.
                    // retmask=dwCommEvent;           					// WaitCommEvent returned mask status

                 // // Set fWaitingOnStat flag to indicate that a new
                 // // WaitCommEvent is to be issued.
                 // fWaitingOnStat = FALSE;
                 // break;

             // case WAIT_TIMEOUT:
                 // // Operation isn't complete yet. fWaitingOnStatusHandle flag 
                 // // isn't changed since I'll loop back around and I don't want
                 // // to issue another WaitCommEvent until the first one finishes.
                 // //
                 // // This is a good time to do some background work.
                // //DoBackgroundWork();
                 // break;                       

             // default:
                 // // Error in the WaitForSingleObject; abort
                 // // This indicates a problem with the OVERLAPPED structure's
                 // // event handle.
				// printf("\nproblem with the OVERLAPPED structure event handle\n");
                // CloseHandle(osStatus.hEvent);
         // }
      // }
	// return retmask;
// }


//---------------------------------------------------------------------------
// Write single char to comport, txdelay in ms
// return chars written  
//---------------------------------------------------------------------------
int write_comport(HANDLE port, unsigned char c, int txdelay)
{
	DWORD dwBytesWritten = 0;
	
    if (WriteFile(port,&c,1,&dwBytesWritten,NULL)) {
	//if (WriteFile(port,&c,1,&dwBytesWritten,&osTXStatus)) {		
		if (dwBytesWritten && (DEBUG_UART)) {
			printf("%02X",c);	
		}			
	} else {
		printf("WriteFile failed error=%ld\n",GetLastError());
	}
	Sleep(txdelay);							// Delay in ms after TX
	//CloseHandle(osTXStatus.hEvent);
	return (int)dwBytesWritten; 								
}

//---------------------------------------------------------------------------
// Write array to comport
// return chars written  
//---------------------------------------------------------------------------
int write_comport_array(HANDLE port, const unsigned char *buffer, int len)
{
	DWORD dwBytesWritten = 0;
	int n;

	if (len==0) {
		printf("\nTrying to transmit zero bytes??");
		return 0;
	}

    if (WriteFile(port,buffer,len,&dwBytesWritten,NULL)) {
	//if (WriteFile(port,buffer,len,&dwBytesWritten,&osTXStatus)) {
		if ((dwBytesWritten==(DWORD)len) && (DEBUG_UART)) {
			for (n=0;n<len;n++) printf("%02X",buffer[n]);	
		}			
	} else {
	   printf(" >>> WriteFile failed, %ld bytes written, error=%ld\n",dwBytesWritten,GetLastError());
	}
	
	//CloseHandle(osTXStatus.hEvent);
	return (int)dwBytesWritten; 								
}

// bool get_comstatus(void)
// {
	// return WaitCommEvent(hComm, &dwEventMask, NULL); 
// }

//---------------------------------------------------------------------------
// get character from comport
// return 0 if timeout, !=0 if OK  
//---------------------------------------------------------------------------
int read_comport(HANDLE port, unsigned char *c)
{
	DWORD dwBytesRead=0;
	unsigned char szRxChar=0;

	if (ReadFile(port, &szRxChar, 1, &dwBytesRead, NULL) != 0) {
		if (dwBytesRead) {
			if (DEBUG_UART) printf("{rx:%02x}",szRxChar);
			*c=szRxChar; // clean up
		}		
	} else {
   		printf(" >>> ReadFile failed with error=%ld\n",GetLastError());
	}
    
   	return dwBytesRead;
}

//---------------------------------------------------------------------------
// fill array from comport
// return 0 if timeout, rx buffer length if OK  
//---------------------------------------------------------------------------
int read_comport_array(HANDLE port, unsigned char *buffer, int buflen)
{
	DWORD dwBytesRead=0;
	int n=0;

	do {
		if (ReadFile(port, &buffer[n++], 1, &dwBytesRead, NULL) != 0) {
		//if (ReadFile(port, &buffer[n++], 1, &dwBytesRead, &osRXStatus) != 0) {
			if (dwBytesRead) {
				if (DEBUG_UART) printf("%02x",buffer[n-1]);
			}		
		} else {
	   		printf("ReadFile failed with error=%ld\n",GetLastError());
		}
	} while (dwBytesRead!=0 && n<buflen);
	
	//CloseHandle(osRXStatus.hEvent);
   	return n-1;
}


// uint8_t gencrc(uint8_t *data, size_t len)
// {
    // //uint8_t crc = 0xff;
	// uint8_t crc = 0;
    // size_t i, j;
	
    // for (i = 0; i < len; i++) {
		// //printf("\ndata=%02x crc=%02x",data[i],crc);
        // crc ^= data[i];
        // for (j = 0; j < 8; j++) {
            // if ((crc & 0x80) != 0)
                // //crc = (uint8_t)((crc << 1) ^ 0x31);
				// crc = (uint8_t)((crc << 1) ^ 0x07); // standard 
            // else
                // crc <<= 1;
        // }
		// //printf(" -> crc=%02x\n",crc);
    // }
    // return crc;
// }
