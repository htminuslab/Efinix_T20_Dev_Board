@ECHO OFF

@ECHO Read PortC
EfinixLoader -readportc

@ECHO Set PINC%1 to Output
EfinixLoader -setdirc %1 0

@ECHO Set PINC%1 to %2
EfinixLoader -setpinc %1 %2

@ECHO Read PortC
EfinixLoader -readportc

@ECHO Upload Blink
EfinixLoader.exe ..\Examples\blink_led\blink_led.hex

Pause

@ECHO Set PINC%1 to Input
EfinixLoader -setdirc %1 1

@ECHO Read PortC
EfinixLoader -readportc

@ECHO Done