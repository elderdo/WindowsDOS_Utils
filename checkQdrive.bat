@echo off

set drive=Q
((net use %drive%: | findstr /c:"Status            OK") >NUL 2>&1 && set QDRIVE=1) || set QDRIVE=0
if "%QDRIVE%" == "1" (
	@echo Q Drive status good
) else (
	@echo Q drive status bad
)
