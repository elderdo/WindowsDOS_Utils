@echo off
:: set defaults
set UID=c17gold
set HOME_DIR=/home/c17gold
set FTP_DIR=apps/EBOMDaily/
set SCRIPT_HOME=C:\Users\zf297a\Documents\DOS

for /f %%A in (%SCRIPT_HOME%\primsa.txt) do (
	set %%A
)
del %TEMP%\script.txt
> %TEMP%\script.txt echo open %HOST%
>> %TEMP%\script.txt echo %UID%
>> %TEMP%\script.txt echo %PWD%
:: just go to the home dir>> %TEMP%\script.txt echo cd %HOME_DIR%/%FTP_DIR%
start "ftpprimsa" /w %systemroot%\system32\ftp.exe -s:%TEMP%\script.txt

