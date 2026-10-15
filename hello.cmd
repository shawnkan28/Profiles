@echo off
@REM  points to file in current folder with the same basename but .ps1 extension.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0%~n0.ps1" %*
exit /b %ERRORLEVEL%