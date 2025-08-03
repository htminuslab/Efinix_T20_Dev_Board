---------------------------------------------------------------------------------------------------
--                                                                           
--  T20Q100 Sapphire port
--                                         
--  Copyright (C) 2025 HT-LAB                                           
--                                                                                                            
--  https://github.com/htminuslab    
--                                                                          
---------------------------------------------------------------------------------------------------        
--
--	Standard Sapphire core + SPI + UART + Timer		 
--
--  Revision History:                                                        
--                                                                           
--  Date:          Revision         Author         
--  14-jun-2025	   1.0				HABT
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity T20_TOP_RISCV is
   port( 
		CLK     	: in  std_logic;
		RESETN  	: in  std_logic;
		
		CCK			: out std_logic;					-- Flash SPI interface
		MISO        : inout std_logic;
		MOSI		: inout std_logic;
		WPN_N		: inout std_logic;					-- IO2 in QSPI
		HOLD_N		: inout std_logic;					-- IO3 in QSPI
		SPI_CS_N	: out std_logic;					-- Flash SS
		
		RX      	: in  std_logic;
		TX      	: out std_logic);
end T20_TOP_RISCV;


`protect begin_protected
`protect version = 1
`protect author = "author-a" , author_info = "author-a-details"
`protect encrypt_agent = "QuestaSim" , encrypt_agent_info = "2025.1"
`protect key_keyowner = "Efinix Inc." , key_keyname = "EFX_K01"
`protect key_method = "rsa"
`protect encoding = ( enctype = "base64" , line_length = 64 , bytes = 256 )
`protect key_block
MzQoSF1nvg7AoBdM/75mUW+4AI/21mBJH2CQYNnHNAPTnrp1SfXwtwGMmoLRm/IH
QN8PjmzEO0Qacj30FNw7WYvdHGa1X4yGjYVRX6Xwf4QC8DoiZoPpGIMAkbfr5pg0
NS6PF8/Ti0RExtVeY1ScG8mC5tvarnk1x4WHHVpHJsXqFAZg9ApSc7X6es8w4ZhJ
O1mB3kpK8EA7u0YqZYartCOFbVuTXhuO8Rwx03x+TQk17Yd9ew+4ZxZ1npuFqJaJ
+b31wUpIwEgk40ByvvHgcgFkAsu/mSBCuaptLdwmz5Ptuqx+Do1OB1FO+hJdle+j
9tvAaHOfRd1eXS0E973h/Q==
`protect key_keyowner = "Siemens" , key_keyname = "SIEMENS-VERIF-SIM-RSA-2"
`protect key_method = "rsa"
`protect encoding = ( enctype = "base64" , line_length = 64 , bytes = 256 )
`protect key_block
apR+uQD8AjlweCjFr0H6+4A+IbHIjYg09xF6fVBm7eDTJ4PHy/dUapS62P4G9JtL
WDTDM9XtZECO/TZo9ZZPfo0sZYi+eYDfcBOH3/bU56grZi6EZMVaLAwyDQrE7hGt
H/RuA7LlQGyRsTp5YDG0iJTxL/A4xQhV/tF7fo56We/KnAtlaEjbBy7wuPnfspdx
1ZEe5B5QCCaLRxzfPausfGdQxO2K/MDJotCl64g5931c33sjPAfgPB5iu2YH685G
yUZrwk+97vLl7xrHoMrFlMFqQ38jUUUY/w6ieII5TcptCKGF2n3Z7/Fvph2sm3Pd
bZBKgFl3XqWWKb5M10uxrg==
`protect data_method = "aes256-cbc"
`protect encoding = ( enctype = "base64" , line_length = 64 , bytes = 6384 )
`protect data_block
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
`protect end_protected	