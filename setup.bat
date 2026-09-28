@echo off
setlocal EnableExtensions DisableDelayedExpansion
set "TOOLKIT_REF=main"
echo Preparing the Windows workstation setup tool...
echo Checking Windows Time before the bootstrap download...
sc.exe start w32time >nul 2>nul
w32tm /resync /rediscover
if errorlevel 1 echo [INFO] If HTTPS reports a certificate error, correct the Windows date/time and retry.
curl.exe --fail --location --retry 2 --connect-timeout 30 --max-time 180 -o "%TEMP%\toolkit-bootstrap.bat" https://raw.githubusercontent.com/iantolentino/Python-System-Utility-Toolkit/%TOOLKIT_REF%/bootstrap.bat
if errorlevel 1 (
    echo [ERROR] Bootstrap download failed after retries. Check internet access and Windows date/time, then rerun the command.
    pause
    exit /b 1
)
call "%TEMP%\toolkit-bootstrap.bat" "%TOOLKIT_REF%"
exit /b %errorlevel%
