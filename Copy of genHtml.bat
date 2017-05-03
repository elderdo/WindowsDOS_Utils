@echo off
:: genHtml.bat
:: Author: Douglas Elder
:: Date 11/24/09
::
:: arg1 - the xml file to be converted to xsl
:: arg2 - is optional and if present turns on debug mode
::
if (%1)==() goto HELP1

:: remove the path and just get the
:: filename
set THE_XML_FILE=%~nx1
set noext=%THE_XML_FILE:~0,-4%

if (%2)==() set THE_XSL_FILE=X:\xml2TailoredSpec.xsl

if (%HTML_HOME%)==() set HTML_HOME=X:\HTML
 
:: do the transformations to a temp file
xalan -a -o %HTML_HOME%\%noext%.htm %1 %THE_XSL_FILE%
goto EOF

:HELP1
echo you must specifiy an xml file 

:EOF (end-of-file)
