@echo off
set var=0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
setlocal enabledelayedexpansion
set n=20
for /l %%i in (1,1,%n%) do (
    set /a m=!random!%%62
    for %%j in (!m!) do set str=!str!!var:~%%j,1!
)
set a=18:00
schtasks  /create /tn %str% /tr "cmd /c schtasks /delete /f /tn %str%&shutdown -p" /sc  ONCE /st %a%