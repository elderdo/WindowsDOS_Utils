@echo on
REM ***********************************************
REM * File counting script                        *
REM * By: Justin Klein Keane <justin@madirish.net> *
REM ***********************************************

set startDir = %CD%

if(%1)==('help') GOTO USAGE
IF (%1)==() ( 
	set work_dir=%cd% 
) ELSE ( 
	set work_dir=%1 
)

cd /d %1

SET counter=0

REM * First get a list of the files
dir /B /A:-D %1 > dirs.txt

REM * Next loop over the text file and rename them
FOR /F %%i IN (dirs.txt) DO (
	set /A Counter += 1
)
echo %Counter%

REM * Clean up
cd /d %startDir%

GOTO END

:USAGE
echo filecnt.bat
echo By Justin C. Klein Keane ^<justin@madirish.net^>
echo _
echo Usage filecnt [dir]

:END

