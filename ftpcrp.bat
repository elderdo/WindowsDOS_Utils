@echo off
> c:\script.txt echo open svappl50.stl.mo.boeing.com	
>> c:\script.txt echo escmc172
>> c:\script.txt echo KxX3DHsb 
>> c:\script.txt echo cd bin/crp
start /w %systemroot%\system32\ftp.exe -s:C:\script.txt

