setlocal ENABLEDELAYEDEXPANSION 
setlocal

set drive=Q
 ((net use %drive%: | findstr /c:"Status            OK") >NUL 2>&1 && set QDRIVE=1) || set QDRIVE=0
 if "%QDRIVE%" == "0" (
	net use Q: \\app-amssc-01\commsys /persistent:no
)

endlocal
