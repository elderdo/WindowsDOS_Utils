:: vim:ts=2:sw=2:sts=2:syn=dosbatch:
:: sm.bat
:: Author: Douglas S. Elder
:: Date: 01/07/2019
:: Desc: Setup the I share drive
:: and run Outlook
SET EXE="C:\Program Files (x86)\Microsoft Office\Office15\outlook.exe"

call setI.bat
if %ERRORLEVEL%==0 %EXE%
