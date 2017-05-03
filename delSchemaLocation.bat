::
:: get the files that are in the 
:: file %TEMP%\schemaLocation.txt
:: and apply the fixXml.bat script
:: to each file 
::
for /f "delims=" %%i in (%TEMP%\schemaLocation.txt) do fixXml.bat "%%i" fixXml2.txt
