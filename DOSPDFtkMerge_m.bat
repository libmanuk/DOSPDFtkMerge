echo off
rem   ****************************************
title DOSPDFtkMerge, Eric C. Weig 2019
rem   ****************************************
:start
color 0a
cls
set ofn=%1
set ext=%2
set sub=%3
echo.
set fout=output
set fcount=0
set pcount=0
rem   for %%x in (*.%ext%) do set /a fcount+=1
for %%x in (%~dp0\%sub%\*.%ext%) do set /a fcount+=1
echo %fcount% %ext% images were found
rem for %%i in (%~dp0\%sub%\*.%ext%) do echo %%i
echo.
IF %fcount% EQU 0 (
    echo.
    echo Please try again.
    echo.
    pause
    goto start
) ELSE (
    echo.
)
set STARTTIME=%Time%
cls
echo Performing Automated Processing . . .
echo.
IF %ext% == pdf (
    echo.
    echo creating multipage PDF %ofn%.pdf . . .
    pdftk *.pdf cat output %ofn%.pdf
    ) ELSE (
    echo converting %fcount% %ext% source files to PDF . . . . . . 
    echo.
    color 7
    for %%i in (%~dp0\%sub%\*.%ext%) do magick convert %~dp0\%sub%\%%~ni.%ext% -print %~dp0\%sub%\processing--%%~ni.%ext%\n %~dp0\%sub%\%%~ni.pdf
    echo.
    echo creating multipage PDF %ofn%.pdf . . .
    pdftk %~dp0\%sub%\*.pdf cat output %~dp0%sub%\%ofn%.pdf
    for %%x in (%~dp0\%sub%\*.pdf) do set /a pcount+=1
    echo making a copy of the multipage PDF %ofn%.pdf . . .
    xcopy /F "%~dp0%sub%\%ofn%.pdf" "%~dp0%fout%\%ofn%.pdf*"
    move "%~dp0%sub%" "%~dp0%sub%_done"
    )

set /a final=%pcount%-1
IF %fcount% EQU %final% (
    set crate="Thumbs up!"
) ELSE (
    set crate="Error!"
)
color 0a
echo.
echo All done!  
set ENDTIME=%Time%

FOR /F "tokens=1-4 delims=:.," %%a IN ("%STARTTIME%") DO (
   SET /A "start=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)

FOR /F "tokens=1-4 delims=:.," %%a IN ("%ENDTIME%") DO (
   SET /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)

REM Calculate the elapsed time by subtracting values
SET /A elapsed=end-start

REM Format the results for output
SET /A hh=elapsed/(60*60*100), rest=elapsed%%(60*60*100), mm=rest/(60*100), rest%%=60*100, ss=rest/100, cc=rest%%100
IF %hh% lss 10 SET hh=0%hh%
IF %mm% lss 10 SET mm=0%mm%
IF %ss% lss 10 SET ss=0%ss%
IF %cc% lss 10 SET cc=0%cc%
SET DURATION=%hh%:%mm%:%ss%.%cc%

ECHO Start    : %STARTTIME%
ECHO Finish   : %ENDTIME%
ECHO          ---------------
ECHO Duration : %DURATION%

ECHO %crate% - %date% Source Files Count: %fcount% Duration : %DURATION% PDF Files Created: %final% PDF File: %~dp0%sub%\%ofn%.pdf>> %~dp0%fout%\test_m.txt
echo.
rem Processing time code based on https://gist.github.com/jcefoli/57881d79aa4c7548324e
