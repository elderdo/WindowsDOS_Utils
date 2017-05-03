:: testMoveToUNCdir.bat
:: Author: Douglas S. Elder
:: Date: 12/3/2015
:: Desc: Test creating a file
:: and then get the most recent file
:: from the directory and move it to
:: a UNC directory
@echo off

set TESTFILE=MYTESTFILE
set OUTPUT_DIR=\\sw.nos.boeing.com\c17data\data197\AMD\data
del %OUTPUT_DIR%\%TESTFILE%

:: create test file
> %TESTFILE% echo this is my test file
>> %TESTFILE% echo some more stuff for the test file
type %TESTFILE%
dir %TESTFILE%

:: get most recent file
for /f "delims=" %%x in ('dir /od /b *.*') do set recent=%%x
:: recent should be MYTESTFILE
:: so move it to a UNC directory
move %recent% %OUTPUT_DIR%\.
:: the following should fail and not show the file
dir %TESTFILE%
:: the following 2 commands should work and show the file
dir %OUTPUT_DIR%\%TESTFILE%
type %OUTPUT_DIR%\%TESTFILE%
