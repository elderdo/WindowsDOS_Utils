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
for /F "tokens=2-4 delims=/ " %%i in ('date /t') do set tdtd=%%i%%j%%k
for /F "tokens=5-8 delims=:. " %%i in ('echo.^| time ^| find "current" ') do set ttrn=%%i%%j%%k%%l
set tufn=%tdtd%%ttrn%.txt
 
:: now create the file
type NUL>%tufn%
 
:EOF

