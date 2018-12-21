@echo off

FOR /F "tokens=1,2,3 delims=/ " %%a in ("%DATE%") do (
set DIA=%%a
set MES=%%b
set ANO=%%c
)

FOR /F "tokens=1,2,3 delims=:, " %%a in ("%TIME%") do (
set H=%%a
set M=%%b
set S=%%c
)

set STRDATE=%ANO%%MES%%DIA%-%H%%M%%S%
set PACKAGE=electron-basic-build


git add .
git status
git commit -am "@lfcontato %PACKAGE% %COMPUTERNAME% V%STRDATE%"

PAUSE