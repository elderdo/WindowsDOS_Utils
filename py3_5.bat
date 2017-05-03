::  py3_5.bat
::  Date: 6/26/2016
::  Author: Douglas Elder
::  Desc: setup env for Python 3.5
@echo off
setlocal

set PYTHONHOME=C:\Users\zf297a\AppData\Local\Programs\Python\Python35-32

set PATH=.;%PYTHONHOME%;%PATH%

set PYTHONPATH=%PYTHONHOME%\Lib\idlelib
set PYTHONPATH=%PYTHONPATH%;%PYTHONHOME%\python35.zip
set PYTHONPATH=%PYTHONPATH%;%PYTHONHOME%\DLLS
set PYTHONPATH=%PYTHONPATH%;%PYTHONHOME%\lib
set PYTHONPATH=%PYTHONPATH%;%PYTHONHOME%
set PYTHONPATH=%PYTHONPATH%;%PYTHONHOME%\lib\site-packages

python %1 %2 %3 %4 %5 %6 %7 %8 %9

endlocal
