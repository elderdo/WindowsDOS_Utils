@echo off
setlocal DisableDelayedExpansion
set "var=foo & bar;baz<>gak;"semi;colons;^&embedded";foo again!;throw (in) some (parentheses);"unmatched ;-)";(too"

set "var=%var:"=""%"
set "var=%var:^=^^%"
set "var=%var:&=^&%"
set "var=%var:|=^|%"
set "var=%var:<=^<%"
set "var=%var:>=^>%"

set "var=%var:;=^;^;%"
rem ** This is the key line, the missing quote is intention
set var=%var:""="%
set "var=%var:"=""%"

set "var=%var:;;="";""%"
set "var=%var:^;^;=;%"
set "var=%var:""="%"
set "var=%var:"=""%"
set "var=%var:"";""=";"%"
set "var=%var:"""="%"

setlocal EnableDelayedExpansion
for %%a in ("!var!") do (
    endlocal
    echo %%~a
    setlocal EnableDelayedExpansion
)

