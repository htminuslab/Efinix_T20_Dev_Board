@REM Modify comport setting before executing this batchfile
pause
@REM PC15 is connected to CMD input signal
..\..\EfinixLoader\EfinixLoader -c com7 -setpinc 15 0
timeout /t 1 >nul
..\..\EfinixLoader\EfinixLoader -c com7 -setpinc 15 1
timeout /t 1 >nul
..\..\EfinixLoader\EfinixLoader -setpinc 15 0
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 1
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 0
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 1
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 0
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 1
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 0
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 1
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 0
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 1
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 0
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 1
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 0
timeout /t 1 >nul               
..\..\EfinixLoader\EfinixLoader -setpinc 15 1
timeout /t 1 >nul
@ECHO Done.....
