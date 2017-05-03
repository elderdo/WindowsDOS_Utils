@echo on
set str=15 Trailing Spaces to truncate               &rem
echo."%str%"
set str=%str%##
set str=%str:                ##=##%
set str=%str:        ##=##%
set str=%str:    ##=##%
set str=%str:  ##=##%
set str=%str: ##=##%
set str=%str:##=%
echo."%str%"
