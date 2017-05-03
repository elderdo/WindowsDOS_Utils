@echo off
for /f "delims=] tokens=1,* " %%a in (%TEMP%\xmlFileList.txt) do echo "%%~nxa" >> %TEMP%\xmlFileList2.txt
sort %TEMP%\xmlFileList2.txt > %TEMP%xmlFileList3.txt

