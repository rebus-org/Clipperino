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






:fail

exit /b -1
