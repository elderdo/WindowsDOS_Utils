@echo off

set DOCS=C:\Users\zf297a\Documents
set APPENV=app-ehs-p3001a

if "%1"=="-p" set APPENV=app-ehs-p3001a
if "%1"=="-t" set APPENV=app-ehs-t3001a
if "%1"=="-d" set APPENV=app-ehs-d3001a

cd %DOCS%\SPO\web\%APPENV%\websites\escmapps\control\sh\common_sh

