@echo off
:: find_sqlplus.bat
:: Author: Douglas S. Elder
:: Date: 5/23/2012
:: Desc: find sqlplus.exe

setlocal
set CUR=%CD%
cd C:\
forfiles /p C: /s /m sqlplus.exe /c "cmd /c echo @path" 2> nul
cd %CUR%
