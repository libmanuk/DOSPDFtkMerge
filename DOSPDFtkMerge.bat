echo off
title DOSPDFtkMerge, Eric C. Weig 2019
echo Hello, would you like to merge some PDFs?
set /P ofn=Enter file name for merged PDF: 
echo Using PDFtk for Windows to merge a directory of PDF files

pdftk *.pdf cat output %ofn%.pdf
echo.
echo All done!  :)
pause
