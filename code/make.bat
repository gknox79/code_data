@echo off 
set statapath="c:\Program Files (x86)\Stata14\StataSE-64.exe"
echo %statapath%

REM DELETE OUTPUT & TEMP FILES
RMDIR ..\output /S /Q
mkdir ..\output
RMDIR ..\temp /S /Q
mkdir ..\temp

REM PRE-CLEAN
%statapath% /e do preclean.do

REM RUN ANALYSIS
%statapath% /e do regression.do 

pause