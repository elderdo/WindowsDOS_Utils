@echo off

if (%1)==() goto HELP
if dummy==dummy%2 (
	set TITLE=Table of Contents
) ELSE (
	set TITLE=%~2
)
@echo TITLE=%TITLE%

> %1.htm echo ^<html^>
>> %1.htm echo ^<title^>%TITLE%^</title^>
>> %1.htm echo ^<body^>
>> %1.htm echo ^<table^>

goto EOF

:HELP
echo You must enter htm file name

:EOF
