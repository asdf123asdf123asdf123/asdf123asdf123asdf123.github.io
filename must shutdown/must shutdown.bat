@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
start timeout 10000
:start
choice /t 1 /d y /n >nul
tasklist|find /i "timeout.exe"
if %errorlevel%==1 start shutdown -p
goto start
