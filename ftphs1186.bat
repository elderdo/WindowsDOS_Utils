rem server for AMDI
@echo off
:: set defaults
set AMD_HOME=/apps/CRON/AMD
set FTP_DIR=SUBMIT
set UID=amduser
set SCRIPT_HOME=C:\Users\zf297a\Documents\DOS

for /f %%A in (%SCRIPT_HOME%\integrated.txt) do (
	set %%A
)

> %TEMP%\script.txt echo open %HOST%
>> %TEMP%\script.txt echo %UID%
>> %TEMP%\script.txt echo %PWD%
>> %TEMP%\script.txt echo cd %AMD_HOME%/%FTP_DIR%
start /w %systemroot%\system32\ftp.exe -s:%TEMP%\script.txt

