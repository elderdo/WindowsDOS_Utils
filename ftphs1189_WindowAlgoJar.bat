> c:\script.txt echo open hs1189
>> c:\script.txt echo amduser
>> c:\script.txt echo amd444
>> c:\script.txt echo cd /apps/CRON/AMD/SUBMIT
>> c:\script.txt echo binary
>> c:\script.txt echo put WindowAlgo.jar
>> c:\script.txt echo quit
start "ftphs1189" /w %systemroot%\system32\ftp.exe -s:C:\script.txt

