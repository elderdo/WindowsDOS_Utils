@echo off
setlocal
call seti.bat
if not "%ERRORLEVEL%" == "0" goto setIErr

start /B /MAX "C:\Program Files (x86)\Microsoft Office\Office15\outlook.exe"
goto:eof

:setIErr
@echo Unable to setup I data share for Outlook

endlocal
