@echo off
@echo wscript.quit wscript.stdin.readline> ~userin.vbs
@echo Please enter a number
cscript.exe //NoLogo //B ~userin.vbs
@echo You entered %errorlevel%
del ~userin.vbs

