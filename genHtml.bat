@echo off
:: genHtml.bat
:: Author: Douglas Elder
:: Date 11/24/09
::
:: Usage: genHtml.bat xml_source_file options
:: -n create a new file using the -o option.  The default is to append to the output file.
:: -o set output file.  The default is %HTML_HOME%\%noext%.htm where noext is the xml file 
:: 	without its extension.  This param can be made up using env variables: 
:: 	- %HTML_HOME%\toc.htm would work and would be expanded correctly
:: -x set xsl file.  The default is %DOC_HOME%\getTitles.xsl
:: -a Use the PI instruction to get the xsl file  
:: -p param_name param_value or -p by itself gets rid of the default value.  The default is 
:: 	-p filename %noext%.htm where %noext% is the xml filename minus the file extension

setlocal enabledelayedexpansion

if (%1)==() goto HELP1

:: set defaults
if not defined DOC_HOME set DOC_HOME=X:
if not defined HTML_HOME set HTML_HOME=%DOC_HOME%\HTML
if not defined THE_XSL_FILE set THE_XSL_FILE=%DOC_HOME%\xml2TailoredSpec.xsl


set THE_FULL_XML_FILE=%1
:: remove the path and just get the
:: filename
set THE_XML_FILE=%~nx1
set noext=%THE_XML_FILE:~0,-4%
set THE_PARAM=-p filename '%noext%.htm'
if not defined THE_OUTPUT_FILE set THE_OUTPUT_FILE=%HTML_HOME%\%noext%.htm



shift

:testSwitches
if "%1" == "-n" goto SET_NEW_FILE
if "%1" == "-o" goto GET_OUTPUT_FILE
if "%1" == "-a" goto USE_PI_INSTRUC
if "%1" == "-x" goto SET_XSL_FILE
if "%1" == "-p" goto SET_PARAM
if "%1" == "-g" goto SET_GEN_HTM


if "%NEW_FILE%"=="Y" (
	xalan %USING_PI_INSTRUC% -o %THE_OUTPUT_FILE% %THE_FULL_XML_FILE% %THE_XSL_FILE%
) else (
	xalan %USING_PI_INSTRUC% %THE_PARAM%  %THE_FULL_XML_FILE% %THE_XSL_FILE% >> %THE_OUTPUT_FILE%
)
goto EOF


:GET_OUTPUT_FILE
set THE_OUTPUT_FILE=%~2
:: use the for command to since the file could contain env variables
for /f "delims=" %%a in ('call echo "%%THE_OUTPUT_FILE%%"') do set THE_OUTPUT_FILE=%%~a
shift
shift
goto testSwitches


:SET_XSL_FILE
if not "%2"=="" (
	if EXIST %2 (
		set THE_XSL_FILE=%~2
		shift
		shift
		goto testSwitches
	) else (
		echo %2 does not exist
		goto EOF
	)
) else (
	goto HELP2
)
goto testSwitches

:USE_PI_INSTRUC
set USING_PI_INSTRUC=-a
set THE_XSL_FILE=
shift
goto testSwitches

:SET_NEW_FILE
set NEW_FILE=Y
shift
goto testSwitches

:SET_PARAM
if "%2"=="" (
	set THE_PARAM=
	shift
	goto testSwitches
)
if  "%3"=="" goto HELP2
set THE_PARAM=-p %2 '%3'
shift
shift
shift
goto testSwitches


:HELP1
echo you must specifiy an xml file 
goto EOF

:HELP2
@echo Usage: getHtml.bat xml_file [-x xsl_file -o output_file -a]

:EOF (end-of-file)
