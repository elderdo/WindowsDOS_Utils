@echo off
tasklist /FI "IMAGENAME eq Outlook.exe" 2> NUL | wfind /I /N "outlook.exe" > NUL
if %ERRORLEVEL% == 0 EXIT /B 0
if not EXIST I: net use I: \\sw\c17data
start /MAX "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\Outlook 2013"
