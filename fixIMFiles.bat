:: fixIMFiles.bat
:: Author: Douglas S. Elder
:: Date 7/20/15
:: Desc: go through all the files in the
:: IM_SESSIONS directory and prefix the
:: files with a timestamp
@echo off
setlocal
cd c:\Users\zf297a\Documents\IM_SESSIONS
fixNames -n -s
endlocal
