@echo off
cd %USERPROFILE%/Documents/.mytextdb
if "%1"=="-n" start /MIN notepad phoneinfo.txt
if "%1"=="" start /MIN gvim -R phoneinfo.txt
dos
shortcuts
