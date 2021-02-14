@echo on
setlocal enabledelayedexpansion
del %TEMP%\myPath.txt
for %%a in ("%PATH:;=";"%") do @echo %%~a >> %TEMP%\myPath.txt
for /F "usebackq delims=" %%A in (`where gvim.exe`) do SET GVIM="%%A"
if not %GVIM%=="" start %GVIM% -R %TEMP%\myPath.txt
if %GVIM%=="" start notepad %TEMP%\myPath.txt
endlocal 
