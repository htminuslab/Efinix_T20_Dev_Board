@REM Modify comport setting before executing this batchfile
@REM pause
@REM PA15 is connected to RESETN signal
..\..\EfinixLoader\EfinixLoader -setpina 15 0
..\..\EfinixLoader\EfinixLoader -setpina 15 1