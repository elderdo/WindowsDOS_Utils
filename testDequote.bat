@echo off
set stuff="this is some stuff"

call :DeQuote stuff
@echo.%stuff%,%result%
goto:eof

:DeQuote
for /f "delims=" %%A in ('echo %%%1%%') do set %1=%%~A
Goto :eof
