@echo off
:: scan.bat
:: Author: Douglas Elder
:: Date: 11/20/09
::
:: this script scans all xml files starting
:: in the current directory and going down through
:: all subdirectories.  It executes a subordinate
:: batch script and pass the complete path 
:: for the file
::
:: It takes an optional bat file that overrides
:: the default subordinate file
::

:: set default subordinate bat file
:: (the directory containing this script must be in 
:: the PATH environment variable so the full path is not
:: necessary)
::
set THE_SCRIPT=fixXml.bat
:: save the current directory
set START_DIR=%CD%

if not (%1)==() set THE_SCRIPT=%1 

:: /r causes the for command to drill down to all subdirectories
for /r %%F in (*.xml) do call %THE_SCRIPT% "%%F" %2 %3 %4 %5 %6 %7 %8 %9

:: restore current directory
cd %START_DIR%
