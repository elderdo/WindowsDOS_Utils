@echo off
:: set defaults
set UID=zf297a
set SLIC_HOME=/mcair/dev/appl/scm/work/c
set SCRIPT_HOME=C:\Users\zf297a\Documents\DOS

for /f %%A in (%SCRIPT_HOME%\svappl04.txt) do (
	set %%A
)

> %TEMP%\script.txt echo open %HOST%
>> %TEMP%\script.txt echo %UID%
>> %TEMP%\script.txt echo %PWD%
>> %TEMP%\script.txt echo cd %SLIC_HOMD%
::start /w %systemroot%\system32\ftp.exe -s:%TEMP%\script.txt
sftp svappl04:%SLIC_HOME%

