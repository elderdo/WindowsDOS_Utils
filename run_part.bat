setlocal
set ORACLE_HOME=C:\Oracle\11gR202Client32bit
set TNS_ADMIN=%ORACLE_HOME%\network\admin
set PATH=C:\Oracle\11gR202Client32bit\bin;.
set TWO_TASK=STL_PRODSUP01
tnsping %TWO_TASK%
echo %PATH%
"C:\Users\zf297a\Documents\Visual Studio 2015\Projects\HMWIS\Debug\HMWIS.exe"
endlocal
