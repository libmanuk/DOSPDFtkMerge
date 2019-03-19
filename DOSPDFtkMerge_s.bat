echo off
rem   ****************************************
title DOSPDFtkMerge, Eric C. Weig 2019
rem   ****************************************
:start
color 0a
cls
echo Step One: Input File Info.
echo.
set /P ofn=Enter file name for multipage PDF: 
echo.
echo Valid input file formats: pdf, tif, jpg, png
echo.
set /P ext=Enter file extension for source files: 
echo.
set /P sub=Enter the subdirectory name for source files: 
echo.
set fout=output
set finput=input
set fcount=0
set pcount=0
rem   for %%x in (*.%ext%) do set /a fcount+=1
for %%x in (%~dp0\%finput%\%sub%\*.%ext%) do set /a fcount+=1
echo %fcount% %ext% images were found
rem for %%i in (%~dp0\%finput%\%sub%\*.%ext%) do echo %%i
echo.
IF %fcount% EQU 0 (
    echo.
    echo Please try again.
    echo.
    pause
    goto start
) ELSE (
    pause
)
set STARTTIME=%Time%
cls
echo Step Two: Automated Processing
echo.
IF %ext% == pdf (
    echo.
    echo creating multipage PDF %ofn%.pdf . . .
    pdftk *.pdf cat output %ofn%.pdf
    ) ELSE (
    echo converting %fcount% %ext% source files to PDF . . . . . . 
    echo.
    color 7
    for %%i in (%~dp0\%finput%\%sub%\*.%ext%) do magick convert %~dp0\%finput%\%sub%\%%~ni.%ext% -print %~dp0\%finput%\%sub%\processing--%%~ni.%ext%\n %~dp0\%finput%\%sub%\%%~ni.pdf
    echo.
    echo creating multipage PDF %ofn%.pdf . . .
    pdftk %~dp0\%finput%\%sub%\*.pdf cat output %~dp0\%finput%\%sub%\%ofn%.pdf
    for %%x in (%~dp0\%finput%\%sub%\*.pdf) do set /a pcount+=1
    echo making a copy of the multipage PDF %ofn%.pdf . . .
    xcopy /F "%~dp0%finput%\%sub%\%ofn%.pdf" "%~dp0%fout%\%ofn%.pdf*"
    move "%~dp0%finput%\%sub%" "%~dp0%finput%\%sub%_done"
    )
set /a final=%pcount%-1
IF %fcount% EQU %final% (
    set crate="Thumbs up!  Looks like all the files processed."
) ELSE (
    set crate="Error!  Looks like some files were not processed."
)
color 0a
echo.
echo %crate%
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

echo.
pause
rem Processing time code based on https://gist.github.com/jcefoli/57881d79aa4c7548324e
