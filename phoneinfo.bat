@echo off
if "%1"=="-n" start notepad %HOMEPATH%/Documents/phoneinfo.txt
if "%1"=="" start gvim -R %HOMEPATH%/Documents/phoneinfo.txt
