    @echo off
    setlocal enableextensions enabledelayedexpansion
    set full=/u01/users/pax
:loop1
    if not "!full:~-1!" == "/" (
        set full2=!full:~-1!!full2!
        set full=!full:~,-1!
        goto :loop1
    )
    echo !full!
    endlocal

