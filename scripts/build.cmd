@echo off

call %~dp0\build-all.cmd %1 %2
if %ERRORLEVEL% neq 0 exit /b -1
