# DOSPDFtkMerge

## What does this batch script do?

This DOS batch script uses both ImageMagick (https://www.imagemagick.org/) for Windows and PDFtk (https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/) for Windows from the DOS commandline to convert individual image files to PDFs and then merge these PDFs into one multipage PDF.

The original image files will remain in the directory after the script has finished processing. 

This script only works with local Windows file paths.

## How to use this batch script.

First, 

1. Set up a working directory structure as outlined below.
2. Move directories of source files to be merged into the 'input' subdir.

If you want to merge a single set of files:

1. Double click on the DOSPDFtkMerge_s.bat file
2. Provide inputs for the questions you will be prompted to answer.

If you want to batch any number of file sets:

1. Use the directions below to 'Build a batch_processing.bat file'.
2. Double click on your completed batch_processing.bat file.

## Directory structure.

basedir<br/>
&nbsp;&nbsp;\`-output subdir<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--log_m.txt<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--merged1.pdf<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--merged2.pdf<br/>
&nbsp;&nbsp;\`-input subdir<br/>
&nbsp;&nbsp;&nbsp;&nbsp;\`-subdir<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--sourcefile1<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--sourcefile2<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--sourcefile3<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--sourcefile4<br/>
&nbsp;&nbsp;&nbsp;&nbsp;\`-secondsubdir<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--sourcefile1<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--sourcefile2<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--sourcefile3<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--sourcefile4<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--sourcefile5<br/>
-DOSPDFtkMerge_m.bat<br/>
-DOSPDFtkMerge_s.bat<br/>
-batch_process.bat<br/>

## Build a batch_processing.bat file.

Edit the batch_process.bat file between the following markers in the file.

rem   edit START

*add lines here

rem  edit STOP

An individual line to process a directory of source files should look like:

call DOSPDFtkMerge_m.bat merged_pdf_filename file_ext directory_to_process

Sample line with actual arguments added in:

call DOSPDFtkMerge_m.bat th7d68v83h8p3 tif 0010

### It is recommended that this script be run on a set of copied images, not on "sole" copies. 

### This script assumes that the computer being used for implementation has PDFtk for Windows installed and that it is working at the commandline.

## License
This software on this site is provided "as-is," without any express or implied warranty. In no event shall libmanuk be held liable for any damages arising from the use of the software.
