@echo off
:: make_slicgldsftp_script.bat
:: Author: Douglas S. Elder
:: Date: 06/17/2020
:: Desc: This script generates the
:: sftp command for the SLICWAVE-GOLD's
:: pc directory which contains sub-dir's for each
:: Pro*C app which contains a .pc file and a makefile

setlocal enabledelayedexpansion

SET HOME=C:\Users\zf297a\Documents\SLICWAVE-GOLD\src\pc
:: you can override the default of get with a put
SET CMD=%1
if "%CMD%"=="" SET CMD=get
cd %HOME%
echo sftp nwlsap05.cs.boeing.com:src/pc
for /f %%D in ('dir /b') do (
  echo cd %%D
  echo lcd %%D
  echo %CMD% makefile
  echo %CMD% %%D.pc
  echo cd ..
  echo lcd ..
)
echo quit 
