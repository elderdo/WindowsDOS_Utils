@echo on
:: fixXml.bat
:: Author: Douglas Elder
:: Date 11/20/09
::
:: arg1 - the xml file to be changed by the sed script
:: arg2 - is optional sed script .. default is fixXml.txt
::
if (%1)==() goto HELP1

:: remove the path and just get the
:: filename
set THE_XML_FILE=%~nx1
set SED_SCRIPT=fixXml.txt

if not (%2)==() set SED_SCRIPT=%2

if (%SED_SCRIPTS_HOME%)==() set SED_SCRIPTS_HOME=C:\DOCUME~1\zf297a\MYDOCU~1\MYSED~1
 
:: do the transformations to a temp file
sed -f %SED_SCRIPTS_HOME%\%SED_SCRIPT% %1 > "%TEMP%\%THE_XML_FILE%"

if (%debug%)==(on) (
	comp "%1" %TEMP%\%THE_XML_FILE%
	goto EOF
)

:: replace the current file with the temp file
:: and send any copy message to msg.txt
copy /Y "%TEMP%\%THE_XML_FILE%" %1 > %TEMP%\msg.txt

:delete_tmp
del "%TEMP%\%THE_XML_FILE%"
goto EOF

:HELP1
echo you must specifiy an xml file to change

:EOF (end-of-file)
