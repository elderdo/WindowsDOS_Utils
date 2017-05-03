@echo off
:: file = makenew.bat
::
:: description = this batch file uses current date and time to create a file with a unique filename

::
:: Date         Author    Change/Update
:: 04-Jun-2005  AGButler  Original
::
 
:: set variables
set tdtd=none
set ttrn=none

 
:: get the date and time and then into single variable
for /F "tokens=2-4 delims=/ " %%i in ('date /t') do set tdtd=%%k_%%i_%%j
for /F "tokens=1-4 delims=/ " %%i in ('date /t') do @echo i=%%i j=%%j k=%%k l=%%l m=%%m
@echo tdtd=%tdtd%
set PATH=C:\Windows\System32;%PATH%
for /F "tokens=5-8 delims=:. " %%i in ('echo.^| time ^| find "current" ') do set ttrn=%%i_%%j_%%k_%%l
for /F "tokens=5-8 delims=:. " %%i in ('echo.^| time ^| find "current" ') do @echo i=%%i j=%%j k=%%k
set tufn=%tdtd%_%ttrn%.txt
 
:: now create the file
@echo %tufn%
@echo type NUL>%tufn%
 
:EOF

