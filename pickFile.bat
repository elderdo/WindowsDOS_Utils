@ECHO OFF
SET index=1

SETLOCAL ENABLEDELAYEDEXPANSION
FOR %%f IN (*.*) DO (
   SET file!index!=%%f
   ECHO !index! - %%f
   SET /A index=!index!+1
)

SETLOCAL DISABLEDELAYEDEXPANSION

SET /P selection="select file by number:"

SET file%selection% >nul 2>&1

IF ERRORLEVEL 1 (
   ECHO invalid number selected   
   EXIT /B 1
)

CALL :RESOLVE %%file%selection%%%

ECHO selected file name: %file_name%

GOTO :EOF

:RESOLVE
SET file_name=%1
GOTO :EOF

