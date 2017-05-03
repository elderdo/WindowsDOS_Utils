:: startcc.bat
:: vim: set ts=2 sw=2 sts=2 et:
::
:: Author: Douglas S. Elder
:: Date: 4/8/2015
:: Desc: setup the environment for ClearCase
:: Rev 1.1
:: Rev 1.0 Nove 22, 2013 init release
:: Rev 1.1 7/17/2014 Added for loop's to simplify code
:: Rev 1.2 4/8/2015  Added added startview zf297a_c17pss_unix_view
::
@echo off
setlocal disabledelayedexpansion
for %%s in ("Atria Location Broker" "Rational Cred Manager" "Credential Manager" ^
	"IBM RATIONAL Lock Manager") do net start %%s

SET CLEARCASE_PRIMARY_GROUP=sw\c17pss

SET CLEARCASE_GROUPS=sw\c17pss

C:\PROGRA~2\IBM\RATION~2\CLEARC~1\etc\utils\NTLOGO~1.EXE -r


for %%v in (SDS-AMD SLICWAVE-GOLD SDS-RMADS IRVT KC46) do cmd /c ct mount \%%v

cmd /c ct startview zf297a_c17pss_unix_view
M:
dir %USERNAME%*
cd %USERNAME%*

for %%d in (SDS-AMD SLICWAVE-GOLD IRVT) do cd %%d & dir & cd ..

endlocal
