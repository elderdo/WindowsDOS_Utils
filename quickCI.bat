@echo off
setlocal enabledelayedexpansion
set src=c:\Users\zf297a\Documents\SLIC_TO_GOLD\src
for /f %%f in ('ct lsco -s') do (
  set Name=%%~nf
  notepad %src%\!Name!_comments.txt
  ct ci %%f
)
endlocal
