//-------------------------------------------------------------------------------------------------
//
//  STM32C071 Efinix Serial to SPI Hex Loader 
//                                        
//  Copyright (C) 2025 HT-LAB                                                                                    
//
//  The frame format consist of 1 SYNC byte, 1 CMD/Sequence byte, 2^n databytes and 1 CRC8 byte
//  Sync is 0x7E 
//  CRC is CRC8 with Polynomial 0x07, Initial value 0x00, Final XOR 0x00
//
//  Compile using make under DOS (MingW64 gcc)
//
//-------------------------------------------------------------------------------------------------
//  Revision History:                                                        
//                                                                           
//  Date		Revision	Changes 
//  03-May-25   0.1         First version, upload to FPGA RAM
//-------------------------------------------------------------------------------------------------
#include "EfinixLoader.h"


//-------------------------------------------------------------------------------------------------
// Global Variables
//-------------------------------------------------------------------------------------------------				
int  	debug=0;                     								// debug display messages enabled
bool 	quiet=false;													
int     sequence=0;  


//-------------------------------------------------------------------------------------------------
// Main Entry 
//-------------------------------------------------------------------------------------------------
int main(int argc,char **argv)
{
    int      i=1; 													// Command line argument
	
	char     hexfilename[80]=""; 									// FPGA Hex filename
	uint16_t status=0;
	
	HANDLE   port;													// Serial Port handler
	int      baudrate=DEFAULT_BAUDRATE; 					   		// Default value
	char     comport[80]=DEFAULT_COMPORT;							// comport, default to com7
		
	int      fpgabaudrate=DEFAULT_BAUDRATE; 					   	// Baudrate between STM32 and FPGA	
		
	uint8_t  txframe[CMD_FRAME_LENGTH]={SYNC_CHAR,0,0};				// Command Frame send to node071
	
    if (argc < 2) usage_exit();
    
    
	//---------------------------------------------------------------------------------------------
	// Processing Command line argument(s) 
	//---------------------------------------------------------------------------------------------
	while((argc-1)>=i)	{		
		if (strcmp(argv[i],"-q")==0) {								// quiet mode
			quiet=true;												// Do not display headers and stuff
			i++;
		
		} else if (strcmp(argv[i],"-d")==0) {						// Debug Mode
			if ((argc-1)>i) debug=debug | (int)strtol(argv[++i], NULL, 16);	// debug in hex! 		
				else usage_exit();			  
			i++;
			
        } else if (strcmp(argv[i],"-com")==0) {                		// Specify comport, example -com 5
			if ((argc-1)>=i) {
				strcpy(comport,"\\\\.\\COM");						// Required for COMPORT>9
				strcat(comport,argv[++i]);							   
			} else usage_exit();            
            i++;
			
        } else if (strcmp(argv[i],"-baud")==0) {                	// Specify baudrate 
            if ((argc-1)>i) baudrate=(int)(atoi(argv[++i]));      
                else usage_exit();            
            i++;

        } else if (strcmp(argv[i],"-fpgabaudrate")==0) {            // Specify STM to FPGA_BR 
            if ((argc-1)>i) {
				fpgabaudrate=(int)(atoi(argv[++i]));      
				txframe[1]=TYPE_SET_BAUDRATE;				
			} else usage_exit();            
            i++;
			
		} else if (strcmp(argv[i],"-status")==0) {								
			txframe[1]=TYPE_DEBUG_STATUS;							// Read status byte
			i++;	
			
		} else if (strcmp(argv[i],"-reset")==0) {								
			txframe[1]=TYPE_TOGGLE_CRESET;							// Toggle FPGA CRESET pin
			i++;
			
        } else if (strcmp(argv[i],"-setpina")==0) {  				// PortA Number, 0/1              												
            if ((argc-2)>i) {
				txframe[1]=TYPE_WRITE_PIN;
				txframe[2]=(atoi(argv[i+1]))&0x0F;				
				if (atoi(argv[i+2])) txframe[2]|=0x80;				
				txframe[2]|=TYPE_PORTA;
				i+=2;
			} else usage_exit();            
            i++;	
        } else if (strcmp(argv[i],"-setpinb")==0) {  				// PortB Number, 0/1              												
            if ((argc-2)>i) {
				txframe[1]=TYPE_WRITE_PIN;
				txframe[2]=(atoi(argv[i+1]))&0x0F;				
				if (atoi(argv[i+2])) txframe[2]|=0x80;				
				txframe[2]|=TYPE_PORTB;
				i+=2;
			} else usage_exit();            
            i++;
        } else if (strcmp(argv[i],"-setpinc")==0) {  				// PortC Number, 0/1              												
            if ((argc-2)>i) {
				txframe[1]=TYPE_WRITE_PIN;
				txframe[2]=(atoi(argv[i+1]))&0x0F;				
				if (atoi(argv[i+2])) txframe[2]|=0x80;				
				txframe[2]|=TYPE_PORTC;
				i+=2;
			} else usage_exit();            
            i++;

        } else if (strcmp(argv[i],"-setdira")==0) {  				// Direction PortA Number, 0=out/1=in              												
            if ((argc-2)>i) {
				txframe[1]=TYPE_PIN_DIRECTION;
				txframe[2]=(atoi(argv[i+1]))&0x0F;				
				if (atoi(argv[i+2])) txframe[2]|=0x80;				
				txframe[2]|=TYPE_PORTA;
				i+=2;
			} else usage_exit();            
            i++;
        } else if (strcmp(argv[i],"-setdirb")==0) {  				// Direction PortB Number, 0=out/1=in              												
            if ((argc-2)>i) {
				txframe[1]=TYPE_PIN_DIRECTION;
				txframe[2]=(atoi(argv[i+1]))&0x0F;				
				if (atoi(argv[i+2])) txframe[2]|=0x80;				
				txframe[2]|=TYPE_PORTB;
				i+=2;
			} else usage_exit();            
            i++;
        } else if (strcmp(argv[i],"-setdirc")==0) {  				// Direction PortC Number, 0=out/1=in              												
            if ((argc-2)>i) {
				txframe[1]=TYPE_PIN_DIRECTION;
				txframe[2]=(atoi(argv[i+1]))&0x0F;				
				if (atoi(argv[i+2])) txframe[2]|=0x80;				
				txframe[2]|=TYPE_PORTC;
				i+=2;
			} else usage_exit();            
            i++;

        } else if (strcmp(argv[i],"-setpulla")==0) {  				// Resistor PortA Number, 0=down/1=up              												
            if ((argc-2)>i) {
				txframe[1]=TYPE_PIN_RESISTOR;
				txframe[2]=(atoi(argv[i+1]))&0x0F;				
				if (atoi(argv[i+2])) txframe[2]|=0x80;				
				txframe[2]|=TYPE_PORTA;
				i+=2;
			} else usage_exit();            
            i++;
        } else if (strcmp(argv[i],"-setpullb")==0) {  				// Resistor PortB Number, 0=down/1=up              												
            if ((argc-2)>i) {
				txframe[1]=TYPE_PIN_RESISTOR;
				txframe[2]=(atoi(argv[i+1]))&0x0F;				
				if (atoi(argv[i+2])) txframe[2]|=0x80;				
				txframe[2]|=TYPE_PORTB;
				i+=2;
			} else usage_exit();            
            i++;
        } else if (strcmp(argv[i],"-setpullc")==0) {  				// Resistor PortC Number, 0=down/1=up              												
            if ((argc-2)>i) {
				txframe[1]=TYPE_PIN_RESISTOR;
				txframe[2]=(atoi(argv[i+1]))&0x0F;				
				if (atoi(argv[i+2])) txframe[2]|=0x80;				
				txframe[2]|=TYPE_PORTC;
				i+=2;
			} else usage_exit();            
            i++;
			
		 } else if (strcmp(argv[i],"-setalta")==0) {  				// PortA Change pin to alt function              												
            if ((argc-1)>i) {
				txframe[1]=TYPE_ALT_FUNCTION;
				txframe[2]=(atoi(argv[i+1]))&0x0F;							
				txframe[2]|=TYPE_PORTA;
				i+=2;
			} else usage_exit();            
            i++;		
		 } else if (strcmp(argv[i],"-setaltb")==0) {  				// PortB Change pin to alt function              												
            if ((argc-1)>i) {
				txframe[1]=TYPE_ALT_FUNCTION;
				txframe[2]=(atoi(argv[i+1]))&0x0F;							
				txframe[2]|=TYPE_PORTB;
				i+=2;
			} else usage_exit();            
            i++;			
		 } else if (strcmp(argv[i],"-setaltc")==0) {  				// PortC Change pin to alt function              												
            if ((argc-1)>i) {
				txframe[1]=TYPE_ALT_FUNCTION;
				txframe[2]=(atoi(argv[i+1]))&0x0F;							
				txframe[2]|=TYPE_PORTC;
				i+=2;
			} else usage_exit();            
            i++;
			
		} else if (strcmp(argv[i],"-readporta")==0) {								
			txframe[1]=TYPE_READ_PORT;								// Read Port A
			txframe[2]|=TYPE_PORTA;
			i++;	
		} else if (strcmp(argv[i],"-readportb")==0) {								
			txframe[1]=TYPE_READ_PORT;								// Read Port B
			txframe[2]|=TYPE_PORTB;
			i++;	
		} else if (strcmp(argv[i],"-readportc")==0) {								
			txframe[1]=TYPE_READ_PORT;								// Read Port C
			txframe[2]|=TYPE_PORTC;
			i++;						
			
        } else {
            if ((argc-1)>=i && argv[i][0]!='-') {
				strcpy(hexfilename,argv[i]); 
				txframe[1]=TYPE_START_DATA;
			} else usage_exit();
			i++;
		}	
	} 
     
	qprintf("\n***  Efinix Serial FPGA Hex loader  ***\n");
	qprintf(  "***     Ver %d.%d (c)2025 HT-LAB      ***\n", MAJOR_VERSION,MINOR_VERSION);
	qprintf(  "***  https://github.com/htminuslab  ***\n");

	qprintf("\nComport            : %s %d,N,8,1\n",comport,baudrate);

	//---------------------------------------------------------------------------------------------
	// Open Comport if the users specified the -com argument
	//---------------------------------------------------------------------------------------------
	if ((port=open_comport(comport,baudrate,'N',8,1,0))==INVALID_HANDLE_VALUE) {
		fprintf(stderr, "\nFailed to open comport %s\n",comport);
		return 1;
	}
	flushcom(port);

	//---------------------------------------------------------------------------------------------
	// Execute command (located in txframe[1])
	//---------------------------------------------------------------------------------------------
	switch (txframe[1]) {
		case TYPE_DEBUG_STATUS :
			status=write_frame(port,txframe,CMD_FRAME_LENGTH,0,1000);// Request Status
			printf("%s\n",status2str(status>>8));
			break;
		case TYPE_TOGGLE_CRESET :
			sequence=0;
			status=write_frame(port,txframe,CMD_FRAME_LENGTH,0,1000);// Issue FPGA reset
			printf("Toggle Reset, %s\n",status2str(status>>8));
			break;				
		case TYPE_WRITE_PIN : 
		case TYPE_PIN_DIRECTION :
		case TYPE_PIN_RESISTOR :
		case TYPE_ALT_FUNCTION :
			status=write_frame(port,txframe,CMD_FRAME_LENGTH,0,1000);// Change Pin State	
			//printf("Set Pin %c%d to %d\n",(txframe[2]&0x30)==0x10?'A':(txframe[2]&0x30)==0x20?'B':'C',txframe[2]&0xF,txframe[2]>>7);
			break;
		case TYPE_READ_PORT : 
			status=write_frame(port,txframe,CMD_FRAME_LENGTH,0,1000);
			printf("Reading port %c\n",(txframe[2]&0x30)==0x10?'A':(txframe[2]&0x30)==0x20?'B':'C');
			break;			
		
		case TYPE_START_DATA :
			upload_bitstream(port,hexfilename);						// Default upload FPGA Hex file to node071
			break;	
		
		case TYPE_SET_BAUDRATE :									// Change baudrate between STM32 and FPGA uart2uart
			switch (fpgabaudrate) {
				case 9600:    txframe[2]=0;  break;
				case 19200:   txframe[2]=1;  break;
				case 38400:   txframe[2]=2;  break;
				case 57600:   txframe[2]=3;  break;
				case 115200:  txframe[2]=4;  break; 
				case 230400:  txframe[2]=5;  break; 
				case 460800:  txframe[2]=6;  break; 
				case 1000000: txframe[2]=7;  break;
				case 2000000: txframe[2]=8;  break;
				case 3000000: txframe[2]=9;  break;
				case 4000000: txframe[2]=10; break;
				case 5000000: txframe[2]=11; break;
				case 6000000: txframe[2]=12; break;
				default: printf("unsupported baudrate %d\n",fpgabaudrate);
			}
			write_frame(port,txframe,CMD_FRAME_LENGTH,0,1000);
			break;	
		
		default:
			printf("Unknown command %0x02\n",txframe[1]);			
	}

	close_comport(port);
	
	qprintf("\nDone.\n");
    return 0; 														// change later to return error
}

//-------------------------------------------------------------------------------------------------
// Open FPGA Hex file and transmit to node071 in frames
//-------------------------------------------------------------------------------------------------	
void upload_bitstream(HANDLE port,char * hexfilename)
{
	FILE     *fp=NULL;                      						// FilePointer	
	struct stat st;
	char     line[MAX_LINE]="";	
	uint8_t  txframe[DATA_FRAME_LENGTH]={0};						// Data send to node071
	int      bc=0;													// Byte count, after 4 bytes send frame
		
	uint16_t status=0;
	int 	 timeout=0;
	int 	 framecount=0;											// Count number of frames, used for flash prog
	float	 addpercent=0.0;										// Each Frame adds addpercent %
	float	 progress=0.0;
	
	//---------------------------------------------------------------------------------------------
	// Open FPGA Hex file and transmit to node071 in frames
	//---------------------------------------------------------------------------------------------	
    sequence=0;
	if((fp=fopen(hexfilename,"rt"))!=NULL) {
		qprintf("Reading Hex file   : %s\n",hexfilename);
		qprintf("Upload to          : FPGA RAM\n");	
		
		if (stat(hexfilename, &st) == 0) {
			qprintf("File size is       : %lld bytes\n\n",(long long)st.st_size);
			addpercent=((float)(DATA_LENGTH*100))/(((float)st.st_size)/3.0);
		} else {
			perror("Failed to obtain size");
			return;
		}

		txframe[0]=SYNC_CHAR;
		txframe[1]=TYPE_START_DATA;
		timeout=1000;

		while (fgets(line, MAX_LINE, fp)) {							// 2 hex characters per line
			sscanf(line,"%02hhx",&txframe[bc+2]);
			bc=(bc+1)%DATA_LENGTH;
			if (bc==0) {
				status=write_frame(port,txframe,DATA_FRAME_LENGTH,0,timeout);				
				if (status==STATUS_NACK) goto giveup;				
				sequence=(sequence+1)&0x3;
				
				framecount++;
				txframe[1]=(sequence<<6)|TYPE_FPGA_DATA;		// Next frame is fpga data
				progress+=addpercent;
				printf("Uploading(%d,%d) %3.1lf%%\r",(status>>9)&1,(status>>10)&1,progress);				
			}	
			
			if (kbhit()) {
				if (getch()==0x1B) {
					printf("\nESC pressed....programming aborted\n");
					goto giveup;				
				}
			}			
		}
		
		if (bc) {													// Remaining bytes in a frame
			for (int j=bc;j<DATA_LENGTH;j++) txframe[j+2]=0;		// Not necessary			
			txframe[1]=(sequence<<6)|TYPE_FPGA_DATA;			
						
			if (write_frame(port,txframe,DATA_FRAME_LENGTH,0,timeout)==STATUS_NACK) goto giveup;
			sequence=(sequence+1)&0x3;
			
			framecount++;
			
			for (int j=0;j<DATA_LENGTH;j++) txframe[j+2]=0xFF;		// Empty frame	


			//---------------------------------------------------------------------------------
			// For FPGA Send 1 extra frame to comply with the min 100 dummy bits end sequence
			//---------------------------------------------------------------------------------										
			txframe[1]=(sequence<<6)|TYPE_FPGA_DATA;			// Next frame is data					
			if (write_frame(port,txframe,DATA_FRAME_LENGTH,0,timeout)==STATUS_NACK) goto giveup;
			sequence=(sequence+1)&0x3;
		
		}
		txframe[1]=TYPE_END_PROGRAMMING;
		if (write_frame(port,txframe,CMD_FRAME_LENGTH,0,timeout)==STATUS_NACK) goto giveup;	
		
	} else {
        printf("\nFailed to open Hex file %s\n",hexfilename);
    }	
giveup:	
	fclose(fp);	
}

//-------------------------------------------------------------------------------------------------
// Transmit frame to node071
// return STATUS_NACK in case of TIMEOUT/too many retries
// For BUSY bit (Flash Programming) we issue "read busy bit" command until BUSY bit is cleared.
//-------------------------------------------------------------------------------------------------
uint16_t write_frame(HANDLE port, uint8_t  *txframe, int txlength, int chardelay, int ms_timeout)
{	
	uint8_t crc8=0x55;
	int retry=0;
	uint16_t status=0;
	clock_t start_time;
	
	for (int j=1;j<txlength-1;j++) crc8=updatecrc8(txframe[j],crc8);// Add CRC
	txframe[txlength-1]=crc8;

	write_comport_array(port,txframe,txlength); 				
	
	if (debug) {
		printf("Frame(%d%d):",(status>>9)&1,(status>>10)&1);
		for (int j=0;j<txlength;j++) printf("%02x ",txframe[j]);
		printf("\n");		
	}
	
	start_time = clock();											// Time-out	
	while (true) {
		status=receive_frame(port);
		//printf("\nStatus=%04x ",status);
		switch (status&0x30) {
			case STATUS_WAIT :
				if (clock() > start_time + ms_timeout) {			// 1000 ms
					printf(" *** Receiver Sync Time-Out ***");
					return STATUS_NACK;
				}
				break;
			case STATUS_NACK :	
				if (retry<MAX_TX_RETRY) {
					printf("Send again\n");
					write_comport_array(port,txframe,txlength); 	// Send again!
					retry++;
				} else {
					printf(" *** Too many retries ***");
					return STATUS_NACK;
				}
				break;	
			case STATUS_ACK	: 
				//printf(" status=0x%04x ",status);
				return status;
		}		
	}
}

//-------------------------------------------------------------------------------------------------
// Receive frame from node071 and return status word
// Frame fixed to 4 bytes
//-------------------------------------------------------------------------------------------------
uint16_t receive_frame(HANDLE port)
{
	unsigned char byte;
	static uint8_t crc8=0x55;
	
	enum RXFSM_TYPE { FSM_RXSYNC, FSM_RXDATA1, FSM_RXDATA2, FSM_RXCRC };
    static enum RXFSM_TYPE fsm = FSM_RXSYNC;  
	
	static uint16_t status=0;
	
	if (read_comport(port,&byte)==0) return STATUS_WAIT;			// Char pending?

	switch (fsm) {
		case FSM_RXSYNC:
			if (byte==SYNC_CHAR) {
				crc8=0x55;
				fsm=FSM_RXDATA1;
			}
			break;
		case FSM_RXDATA1: 
			status=byte;											// LS status
			crc8=updatecrc8(byte,crc8);
			fsm=FSM_RXDATA2;
			break;
		case FSM_RXDATA2: 
			status|=(((uint16_t)byte)<<8);							// MS status
			crc8=updatecrc8(byte,crc8);
			fsm=FSM_RXCRC;
			break;		
		case FSM_RXCRC:
			fsm=FSM_RXSYNC;		
			if (crc8==byte) return status;
			else return STATUS_NACK;								
	}

	return STATUS_WAIT;
}

char * status2str(uint8_t status)									
{
	static char ret[MAX_WORD]="";
	
	strcpy(ret,"");
		
	if (status&CDONE_POS) strlcat(ret,"CDONE=1 ",MAX_WORD); else strlcat(ret,"cdone=0 ",MAX_WORD);	
	if (status&NSTATUS_POS) strlcat(ret,"NSTATUS=1 ",MAX_WORD); else strlcat(ret,"nstatus=0 ",MAX_WORD);	
	
	if ((status&CDONE_POS)==0 && (status&NSTATUS_POS)==0) strlcat(ret," >> Failed to Configure <<",MAX_WORD);
	if ((status&CDONE_POS)==0 && (status&NSTATUS_POS)) strlcat(ret," >> Ready for Programming... <<",MAX_WORD);
	if ((status&CDONE_POS) && (status&NSTATUS_POS)==0) strlcat(ret," >> Failure <<",MAX_WORD);
	if ((status&CDONE_POS) && (status&NSTATUS_POS)) strlcat(ret," >> FPGA in User Mode <<",MAX_WORD);
	
	return ret;
}



//-------------------------------------------------------------------------------------------------
// Update CRC8
//-------------------------------------------------------------------------------------------------
uint8_t updatecrc8(uint8_t data, uint8_t oldcrc) 
{
	uint8_t crc = oldcrc;

	crc ^= data;
	for (int j = 0; j < 8; j++) {
		if ((crc & 0x80) != 0) 
			crc = (uint8_t)((crc << 1) ^ 0x07); // standard 
		else 
			crc <<= 1;
	}
	return crc;
}


#ifndef HAVE_STRLCAT
//-------------------------------------------------------------------------------------------------
// strlcat CRC8 - Safely concatenate two strings, copied from 
// https://stackoverflow.com/users/2193455/kangear
//-------------------------------------------------------------------------------------------------
size_t strlcat(char *dst,const char *src, size_t size) 
{
  size_t    srclen;         										// Length of source string 
  size_t    dstlen;         										// Length of destination string

  dstlen = strlen(dst);
  size   -= dstlen + 1;

  if (!size) return (dstlen);        								// No room, return immediately...

  srclen = strlen(src);
  if (srclen > size) srclen = size;

  memcpy(dst + dstlen, src, srclen);
  dst[dstlen + srclen] = '\0';

  return (dstlen + srclen);
}
#endif


void usage_exit(void)
{
    printf("\n***  Efinix SPI FPGA Hex loader   ***\n");
    printf(  "***   Ver %d.%d (c)2025 HT-LAB      ***\n", MAJOR_VERSION,MINOR_VERSION);
    printf(  "*** https://github.com/htminuslab ***\n");
    printf("\nUsage                : EfinixLoader <options> fpgafile.hex\n");
    printf("\nOptions:\n");
    printf("-q                   : quiet, must be specified first in the options list\n");  
    printf("-com portnumber      : Comport, 1.. default to \"%s\"\n",DEFAULT_COMPORT);
    printf("-baud int            : Baudrate, default is %d\n",DEFAULT_BAUDRATE);
	printf("-fpgabaudrate        : Set the baudrate between STM32 and FPGA, default is 115200\n");
    printf("-status              : Read Status byte\n");
    printf("-reset               : Toggle FPGA CRESET line\n");
    printf("-setpina n 0/1       : Set PortA pin n to 0 or 1\n");
    printf("-setpinb n 0/1       : Set PortB pin n to 0 or 1\n");
    printf("-setpinc n 0/1       : Set PortC pin n to 0 or 1\n");
	printf("-setdira n 0/1       : Set PortA pin n to direction 0=output or 1=input, no pull-up or down\n");
    printf("-setdirb n 0/1       : Set PortB pin n to direction 0=output or 1=input, no pull-up or down\n");
    printf("-setdirc n 0/1       : Set PortC pin n to direction 0=output or 1=input, no pull-up or down\n");
	printf("-setpulla n 0/1      : Set PortA pin n resistor to 0=pull-down or 1=pull-up\n");
    printf("-setpullb n 0/1      : Set PortB pin n resistor to 0=pull-down or 1=pull-up\n");
    printf("-setpullc n 0/1      : Set PortC pin n resistor to 0=pull-down or 1=pull-up\n");
	printf("-setalta n           : Set PortA pin n to alternate(peripheral) function\n");
    printf("-setaltb n           : Set PortB pin n to alternate(peripheral) function\n");
    printf("-setaltc n           : Set PortC pin n to alternate(peripheral) function\n");		
    printf("-readporta           : Read PortA\n");
    printf("-readportb           : Read PortB\n");
    printf("-readportc           : Read PortC\n");
    printf("\n                     : press ESC to quit\n");
    exit(1);
}