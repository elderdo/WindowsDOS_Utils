:: createTocs.bat
:: Date: 12/2/2009
:: Author: Douglas S. Elder
:: This script creates an intermediate xml file called
:: titles.xml from all the xml files in the XML_HOME directory
:: and its subdirectories
:: It then uses titles.xml to create two htm files:
:: tocByTitle.htm
:: tocBySpecname.htm
:: It uses two subordinate scripts scan.bat and genHtml.bat
::
:: The scan.bat file iterates through all the xml files in the 
:: current directory and its subdirectories and executes a script
:: that takes the xml as its first parameter.  It can also 
:: pass two more parameters to the script
::
:: The genHtml.bat accepts the xml file name, the xsl file to be 
:: applied to that xml file,  and the name of the output file which it
:: appends data to using xalan.
:: xalan sets a filename parameter that is the xml file with a new htm
:: extension.  It then processes the xml / xsl and appends to the 
:: output file

@echo off

set DOC_HOME = "X:"
set HTML_HOME = %DOC_HOME%\HTML
set XML_HOME = %DOC_HOME%\Long Beach

:: Go to the directory to be scan for all xml files
cd "%XML_HOME%!"

del ..\html\titles.xml

:: start creating the titles.xml file
> ..\html\titles.xml echo ^<?xml version="1.0"?^>
>> ..\html\titles.xml echo ^<toc^>

:: append the htm filename, titles, and spec name to titles.xml
:: for every xml file
scan genHtml.bat ..\getTitles.xsl ..\html\titles.xml

:: finish the titles.xml file
>> ..\html\titles.xml echo ^</toc^>

cd %HTML_HOME%

:: create the htm toc files
xalan -o tocByTitle.htm titles.xml ..\tocByTitle.xsl
@echo %HTML_HOME%\tocyByTitle.htm created
xalan -o tocBySpecname.htm titles.xml ..\tocBySpecname.xsl
@echo %HTML_HOME%\tocyBySpecname.htm created

:EOF
