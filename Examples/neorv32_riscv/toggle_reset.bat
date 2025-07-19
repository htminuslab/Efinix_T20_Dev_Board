@REM Modify comport setting before executing this batchfile
@REM pause
@REM PA15 is connected to RESETN signal
EfinixLoader -q -setdira 15 0
EfinixLoader -q -setpina 15 0
EfinixLoader -q -setpina 15 1