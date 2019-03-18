# DOSPDFtkMerge

## What does this batch script do?

This DOS batch script uses both ImageMagick (https://www.imagemagick.org/) for Windows and PDFtk (https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/) for Windows from the DOS commandline to convert individual image files to PDFs and then merge these PDFs into one multipage PDF.

The original image files will remain in the directory after the script has finished processing. 

This script only works with local Windows file paths.

## How to use this batch script.

1. Place a copy of the .bat file in a directory that has image files that need to be merged into a multipage PDF.
2. Move all other files out of the directory.
3. Double click on the .bat file.
4. Provide inputs for the questions you will be prompted to answer.

## Directory structure.

basedir<br/>
&nbsp;&nbsp;\`-output subdir<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-log_m.txt<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-merged1.pdf<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-merged2.pdf<br/>
&nbsp;&nbsp;\`-input subdir<br/>
&nbsp;&nbsp;&nbsp;&nbsp;\`-subdir<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-sourcefile1<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-sourcefile2<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-sourcefile3<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-sourcefile4<br/>
&nbsp;&nbsp;&nbsp;&nbsp;\`-secondsubdir<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-sourcefile1<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-sourcefile2<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-sourcefile3<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-sourcefile4<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-sourcefile5<br/>
|-DOSPDFtkMerge_m.bat<br/>
|-DOSPDFtkMerge_s.bat<br/>
|-batch_process.bat<br/>

### It is recommended that this script be run on a set of copied images, not on "sole" copies. 

### This script assumes that the computer being used for implementation has PDFtk for Windows installed and that it is working at the commandline.

## License
This software on this site is provided "as-is," without any express or implied warranty. In no event shall libmanuk be held liable for any damages arising from the use of the software.
