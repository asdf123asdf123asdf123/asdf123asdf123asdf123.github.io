@echo off
set var=0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
setlocal enabledelayedexpansion
for /l %%i in (6,1,16) do set _!random!=%%i
for /f "tokens=2 delims==" %%i in ('set _') do set n=%%i
for /l %%i in (1,1,%n%) do (
    set /a m=!random!%%62
    for %%j in (!m!) do set str=!str!!var:~%%j,1!
)
echo shutdown time?
set /p a=
schtasks  /create /tn %str% /tr "cmd /c schtasks /delete /f /tn %str%&shutdown -p" /sc  ONCE /st %a%
