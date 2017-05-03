:: myPath.bat
:: Author: Douglas S. Elder
:: Date: 9/20/2012
:: Desc: This script extracts the directories from
:: the PATH environment variable and puts them into
:: a text file which is then displayed using Notepad
:: This makes it easy to see what directories are used
:: to find any executable file: exe, bat, com, or cpl.

@echo off
setlocal EnableDelayedExpansion
::del %TEMP%\path.txt
::for %%a in ("%path:;=";"%") do @echo %%~a >> %TEMP%\path.txt
::for /F "eol=; delims=," %%i in (%TEMP%\path.txt) do @echo %%i 
for /F "delims=" %%A in (renaPath.txt) do @echo %%~sA

::notepad %TEMP%\path.txt
endlocal

