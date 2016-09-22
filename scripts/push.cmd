@echo off

set root=%~dp0\..
set nuget=%root%\tools\nuget\nuget.exe

if not exist "%nuget%" (
  echo Could not find NuGet.exe here: %nuget%
  goto fail
)

set outputdir=%root%\deploy

if not exist "%outputdir%" (
  echo Output directory %outputdir% did not exist
  exit /b -1
)

"%nuget%" push "%outputdir%\*.nupkg" -Source https://www.nuget.org/api/v2/package
if %ERRORLEVEL% neq 0 (
  echo Error pushing
  exit /b -1
)
