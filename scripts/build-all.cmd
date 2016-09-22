@echo off

set name=%1
set version=%2

echo Building project with name: %name% and version %version%

set root=%~dp0\..
set project=%root%\%name%\%name%.csproj

if not exist "%project%" (
  echo Could not find csproj file here: "%project%"
  goto fail
)

set nuspec=%root%\%name%\%name%.nuspec

if not exist "%nuspec%" (
  echo Could not find nuspec file here: "%nuspec%"
  goto fail
)

set nuget=%root%\tools\nuget\nuget.exe

if not exist "%nuget%" (
  echo Could not find NuGet.exe here: %nuget%
  goto fail
)

set outputdir=%root%\deploy

if exist "%outputdir%" (
  rd "%outputdir%" /s/q
)

mkdir "%outputdir%"

echo Building...
msbuild "%project%" /t:rebuild /p:Configuration=Release
if %ERRORLEVEL% neq 0 (
  echo Error building
  goto fail
)

echo Packing...
"%nuget%" pack "%nuspec%" /OutputDirectory "%outputdir%" /Version %version%
if %ERRORLEVEL% neq 0 (
  echo Error packing
  goto fail
)

goto success


:fail

echo Failed.
exit /b -1


:success