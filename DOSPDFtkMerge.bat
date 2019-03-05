echo off
title DOSPDFtkMerge, Eric C. Weig 2019
echo Hello, would you like to merge some PDFs?
set /P ofn=Enter file name for merged PDF:
set /P ext=Enter file extension for source files: 
echo Using PDFtk for Windows to merge a directory of PDF files

for %%i in (*.%ext%) do echo %%i
echo processing files, please wait...
for %%i in (*.%ext%) do magick convert %%~ni.%ext% %%~ni.pdf
echo.

pdftk *.pdf cat output %ofn%.pdf

echo.
echo All done!  :)
pause
