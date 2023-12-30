@echo off
echo shutdown time?
set /p a=
schtasks  /create /tn 123 /tr "cmd /c schtasks /delete /f /tn 123&shutdown -p" /sc  ONCE /st %a%
pause