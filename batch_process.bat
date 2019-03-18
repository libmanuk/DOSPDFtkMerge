echo off
rem   ****************************************
title DOSPDFtkMerge, Eric C. Weig 2019
rem   ****************************************
rem   edit START

call DOSPDFtkMerge_m.bat merged_pdf_filename file_ext directory_to_process
call DOSPDFtkMerge_m.bat merged_pdf_filename file_ext directory_to_process

rem  edit STOP
echo.
echo All batch processes completed.
pause

