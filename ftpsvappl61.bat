@echo off
> c:\script.txt echo open svappl61.stl.mo.boeing.com	
>> c:\script.txt echo escmc172
>> c:\script.txt echo KxX3DHsb 
>> c:\script.txt echo cd bin/prd
start /w %systemroot%\system32\ftp.exe -s:C:\script.txt

