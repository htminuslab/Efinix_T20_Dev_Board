--------------------------------------------------------------------------------
-- Copyright (C) 2013-2025 Efinix Inc. All rights reserved.              
--
-- This   document  contains  proprietary information  which   is        
-- protected by  copyright. All rights  are reserved.  This notice       
-- refers to original work by Efinix, Inc. which may be derivitive       
-- of other work distributed under license of the authors.  In the       
-- case of derivative work, nothing in this notice overrides the         
-- original author's license agreement.  Where applicable, the           
-- original license agreement is included in it's original               
-- unmodified form immediately below this header.                        
--                                                                       
-- WARRANTY DISCLAIMER.                                                  
--     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND        
--     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH               
--     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES,  
--     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF          
--     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR    
--     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED       
--     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.           
--                                                                       
-- LIMITATION OF LIABILITY.                                              
--     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY       
--     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT    
--     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY   
--     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT,      
--     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY    
--     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF      
--     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR   
--     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN    
--     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER    
--     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
--     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
--     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR            
--     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT   
--     APPLY TO LICENSEE.                                                
--
--------------------------------------------------------------------------------
------------- Begin Cut here for COMPONENT Declaration ------
component T20_Sapphire is
port (
    io_systemClk : in std_logic;
    io_jtag_tms : in std_logic;
    io_jtag_tdi : in std_logic;
    io_jtag_tdo : out std_logic;
    io_jtag_tck : in std_logic;
    system_spi_0_io_data_0_read : in std_logic;
    system_spi_0_io_data_0_write : out std_logic;
    system_spi_0_io_data_0_writeEnable : out std_logic;
    system_spi_0_io_data_1_read : in std_logic;
    system_spi_0_io_data_1_write : out std_logic;
    system_spi_0_io_data_1_writeEnable : out std_logic;
    system_spi_0_io_data_2_read : in std_logic;
    system_spi_0_io_data_2_write : out std_logic;
    system_spi_0_io_data_2_writeEnable : out std_logic;
    system_spi_0_io_data_3_read : in std_logic;
    system_spi_0_io_data_3_write : out std_logic;
    system_spi_0_io_data_3_writeEnable : out std_logic;
    system_spi_0_io_sclk_write : out std_logic;
    io_asyncReset : in std_logic;
    io_systemReset : out std_logic;
    system_uart_0_io_txd : out std_logic;
    system_uart_0_io_rxd : in std_logic;
    system_gpio_0_io_writeEnable : out std_logic_vector(3 downto 0);
    system_gpio_0_io_write : out std_logic_vector(3 downto 0);
    system_gpio_0_io_read : in std_logic_vector(3 downto 0);
    system_spi_0_io_ss : out std_logic_vector(0 to 0)
);
end component T20_Sapphire;

---------------------- End COMPONENT Declaration ------------
------------- Begin Cut here for INSTANTIATION Template -----
u_T20_Sapphire : T20_Sapphire
port map (
    io_systemClk => io_systemClk,
    io_jtag_tms => io_jtag_tms,
    io_jtag_tdi => io_jtag_tdi,
    io_jtag_tdo => io_jtag_tdo,
    io_jtag_tck => io_jtag_tck,
    system_spi_0_io_data_0_read => system_spi_0_io_data_0_read,
    system_spi_0_io_data_0_write => system_spi_0_io_data_0_write,
    system_spi_0_io_data_0_writeEnable => system_spi_0_io_data_0_writeEnable,
    system_spi_0_io_data_1_read => system_spi_0_io_data_1_read,
    system_spi_0_io_data_1_write => system_spi_0_io_data_1_write,
    system_spi_0_io_data_1_writeEnable => system_spi_0_io_data_1_writeEnable,
    system_spi_0_io_data_2_read => system_spi_0_io_data_2_read,
    system_spi_0_io_data_2_write => system_spi_0_io_data_2_write,
    system_spi_0_io_data_2_writeEnable => system_spi_0_io_data_2_writeEnable,
    system_spi_0_io_data_3_read => system_spi_0_io_data_3_read,
    system_spi_0_io_data_3_write => system_spi_0_io_data_3_write,
    system_spi_0_io_data_3_writeEnable => system_spi_0_io_data_3_writeEnable,
    system_spi_0_io_sclk_write => system_spi_0_io_sclk_write,
    io_asyncReset => io_asyncReset,
    io_systemReset => io_systemReset,
    system_uart_0_io_txd => system_uart_0_io_txd,
    system_uart_0_io_rxd => system_uart_0_io_rxd,
    system_gpio_0_io_writeEnable => system_gpio_0_io_writeEnable,
    system_gpio_0_io_write => system_gpio_0_io_write,
    system_gpio_0_io_read => system_gpio_0_io_read,
    system_spi_0_io_ss => system_spi_0_io_ss
);

------------------------ End INSTANTIATION Template ---------
