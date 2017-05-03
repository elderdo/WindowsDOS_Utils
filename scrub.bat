:: scrub.bat
:: Author: Douglas S. Elder
:: Date: 12/10/2013
:: Desc: This script executes sqlplus
:: and the scrub.sql script to update bssm_groupdefs,
:: and delete superfluous data from bssm_goupelms
:: bssm_parts, bssm_s_part_periods, and bssm_s_parts
@echo off
setlocal

if "%1"=="" goto pickEnv
Set choice=%1
shift

:continue
if "%choice%"=='1' Set LOCAL=db0093d1
if "%choice%"=='2' Set LOCAL=db0093t1
if "%choice%"=='3' Set LOCAL=db0093p1
if "%LOCAL%"=="" goto done

if "%1"=="" goto getUser
Set OracleUID=%1

:continue2
if "%OracleUID%"=="" goto done

Set ORACLE_HOME=c:\oracle\11gR2client64bit
Set PATH=c:\ oracle\11gR2client64bit\bin;%PATH%
Set TNS_ADMIN=%ORACLE_HOME%\bin\network\admin
Set SQLPATH=%USERPROFILE%\Documents\bssm

@echo quit | sqlplus  -s YourOracleUserId@OracleSid/YourOraclePassword @scrub
@echo

:pickEnv
@ehco.1. dev
@echo.2. integrated test
@echo.3. prod
Set /P choice=Type of number of the environment to use
goto continue

:getUser
Set /P OracleUID=Enter Oracle user id
goto continue2

:done

