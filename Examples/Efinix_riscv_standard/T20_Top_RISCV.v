module T20_TOP_RISCV_VER (
    input  wire CLK,
    input  wire RESETN,
    output wire CCK,
    inout  wire MISO,
    inout  wire MOSI,
    inout  wire WPN_N,
    inout  wire HOLD_N,
    output wire SPI_CS_N,
    input  wire RX,
    output wire TX
);

`pragma protect version=1
`pragma protect author="author-a", author_info="author-a-details"
`pragma protect data_method="aes256-cbc"

`protect key_keyowner="Siemens"
`protect key_keyname="SIEMENS-VERIF-SIM-RSA-1"
`protect key_method="rsa"
`protect rights_digest_method = "sha256"
`protect key_public_key
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1PiOZztKubrEWF7LoPly
26t+dcRxa9eY3hY+9bJa7kbYCr12J8ChCO/gCtEgf8u0+GtiXbQ+7mYPOSWupa+R
mLYPhZQUxxgoVw4r/kL0UVpURaPSSa+E38wTsB9BkS6M/GXCosW341N1sqclVe7k
ppvsfFYuqFOoEjZYERek1EpadfJsbykBS2HeAll+WtRKKuDWnX9AOrYD4EbMUEN/
gTi3We8l6dCwCz6c7YvdA3EWexGIeYGKSc58NZ309jgxypRvA6j+zjdtSsnepD04
hgHbQZK0796cKaH1kNnV7OZQRss4l5Y7/Mo2jjMZCN81CZjmsB7U6/b5RLTI2mcS
vwIDAQAB


`pragma protect key_keyowner="Efinix Inc."
`pragma protect key_keyname="EFX_K01"
`pragma protect key_method="rsa"
`pragma protect key_public_key
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoLsMSomQjYVrWnI0lp/z
O8PoZQ5GUgaeEBwUItHNjMoz6JFJU5/T0pSf637SwrmQyeCcO8wHKglG5LrxiwOZ
/8c0l0AsjycSVhhLnzR4UUQg34s/BHX6uf1eKtAYXhSmuWzH3bks2sqpARAJIG4P
Lo2xjUAOKem8f/cDA/EGEAxPXadUVh/pcT0c4Cg7lbd3kembQBgvqewUCY5AOlE8
QKsqMVzZNZQCd1CJfRYLo4cQgz8ezVjz4Bc6kJ05P9ekQ+lyX89RvcSpW9NUS4a7
6nUaM/znmSw8BKbvpJtzA2SNC6LBUQDWRbvDhwdtq4zd2cCzsWdZQCDq97MvcpKQ
3wIDAQAB

`pragma protect begin


    T20_TOP_RISCV inst (			// Instantiate VHDL top level
        .CLK(CLK),
        .RESETN(RESETN),
        .CCK(CCK),
        .MISO(MISO),
        .MOSI(MOSI),
        .WPN_N(WPN_N),
        .HOLD_N(HOLD_N),
        .SPI_CS_N(SPI_CS_N),
        .RX(RX),
        .TX(TX)
    );

endmodule

`pragma protect end