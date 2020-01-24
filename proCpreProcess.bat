@echo off
setlocal enabledelayedexpansion
set ORACLE_HOME=D:\Oracle\product\12.2.0\client32bit_1
set BIN=%ORACLE_HOME%\bin
set PATH=%BIN%;%PATH%
if "%1"=="" goto usage
set SRC=%1
set PGM=%SRC:~0,-3%
proc INAME=%SRC% 
set RC=%ERRORLEVEL%
if "%RC%"=="0" echo %PGM% successfullly compiled 
goto:eof

:usage
echo.
echo Usage: proCpreProcess.bat PRO*C_file.pc
echo.
goto:eof

endlocal

