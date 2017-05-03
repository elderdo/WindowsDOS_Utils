@echo off
del %TEMP%\myPath.txt
for %%a in ("%PATH:;=";"%") do @echo %%~a >> %TEMP%\myPath.txt
if exist C:\PROGRA~2\Vim\vim74\gvim.exe start C:\PROGRA~2\Vim\vim74\gvim.exe %TEMP%\myPath.txt
if not exist C:\PROGRA~2\Vim\vim74\gvim.exe start notepad %TEMP%\myPath.txt
