@echo off
set var=0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
setlocal enabledelayedexpansion
set n=20
for /l %%i in (1,1,%n%) do (
    set /a m=!random!%%62
    for %%j in (!m!) do set str=!str!!var:~%%j,1!
)
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
echo shutdown time?
set /p a=
schtasks  /create /tn %str% /tr "cmd /c schtasks /delete /f /tn %str%&taskkill -f -fi "imagename ne cmd.exe"" /sc  ONCE /st %a%  /rl HIGHEST
