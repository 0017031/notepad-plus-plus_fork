@echo on
rmdir /S /Q .\zipped.package.release64

mkdir .\zipped.package.release64
mkdir .\zipped.package.release64\updater
REM mkdir .\zipped.package.release64\localization
REM mkdir .\zipped.package.release64\themes
mkdir .\zipped.package.release64\autoCompletion
mkdir .\zipped.package.release64\functionList
mkdir .\zipped.package.release64\userDefineLangs
mkdir .\zipped.package.release64\plugins
mkdir .\zipped.package.release64\plugins\NppExport
mkdir .\zipped.package.release64\plugins\mimeTools
mkdir .\zipped.package.release64\plugins\NppConverter
mkdir .\zipped.package.release64\plugins\Config
mkdir .\zipped.package.release64\plugins\doc


rem Basic Copy needed files into Notepad++ 64-bit package folders
copy /Y ..\..\LICENSE .\zipped.package.release64\license.txt
If ErrorLevel 1 goto End
copy /Y ..\bin\readme.txt .\zipped.package.release64\
If ErrorLevel 1 goto End
copy /Y ..\bin\change.log .\zipped.package.release64\
If ErrorLevel 1 goto End
copy /Y ..\src\langs.model.xml .\zipped.package.release64\
If ErrorLevel 1 goto End
copy /Y ..\src\stylers.model.xml .\zipped.package.release64\
If ErrorLevel 1 goto End
copy /Y ..\src\contextMenu.xml .\zipped.package.release64\
If ErrorLevel 1 goto End
copy /Y ..\src\tabContextMenu_example.xml .\zipped.package.release64\
If ErrorLevel 1 goto End
copy /Y ..\src\shortcuts.xml .\zipped.package.release64\
If ErrorLevel 1 goto End
copy /Y ..\bin\doLocalConf.xml .\zipped.package.release64\
If ErrorLevel 1 goto End
copy /Y ..\bin\nppLogNulContentCorruptionIssue.xml .\zipped.package.release64\
If ErrorLevel 1 goto End
copy /Y ..\bin64\"notepad++.exe" .\zipped.package.release64\
If ErrorLevel 1 goto End
copy /Y ..\src\toolbarIcons.xml .\zipped.package.release64\
If ErrorLevel 1 goto End

copy /Y "..\bin64\plugins\NppExport\NppExport.dll" .\zipped.package.release64\plugins\NppExport\
If ErrorLevel 1 goto End
copy /Y "..\bin64\plugins\mimeTools\mimeTools.dll" .\zipped.package.release64\plugins\mimeTools\
If ErrorLevel 1 goto End
copy /Y "..\bin64\plugins\NppConverter\NppConverter.dll" .\zipped.package.release64\plugins\NppConverter\
If ErrorLevel 1 goto End


copy /Y ".\APIs\*.xml" .\zipped.package.release64\autoCompletion\
If ErrorLevel 1 goto End

copy /Y ".\functionList\*.xml" .\zipped.package.release64\functionList\
If ErrorLevel 1 goto End

copy /Y "..\bin\userDefineLangs\markdown._preinstalled.udl.xml" .\zipped.package.release64\userDefineLangs\
If ErrorLevel 1 goto End
copy /Y "..\bin\userDefineLangs\markdown._preinstalled_DM.udl.xml" .\zipped.package.release64\userDefineLangs\
If ErrorLevel 1 goto End

copy /Y ..\src\config.4zipPackage.xml .\zipped.package.release64\config.xml
If ErrorLevel 1 goto End
copy /Y ..\bin64\plugins\Config\nppPluginList.dll .\zipped.package.release64\plugins\Config\
If ErrorLevel 1 goto End
copy /Y ..\bin64\updater\GUP.exe .\zipped.package.release64\updater\
If ErrorLevel 1 goto End
copy /Y ..\bin64\updater\libcurl.dll .\zipped.package.release64\updater\
If ErrorLevel 1 goto End
copy /Y ..\bin64\updater\gup.xml .\zipped.package.release64\updater\
If ErrorLevel 1 goto End
copy /Y ..\bin64\updater\LICENSE .\zipped.package.release64\updater\
If ErrorLevel 1 goto End
copy /Y ..\bin64\updater\README.md .\zipped.package.release64\updater\
If ErrorLevel 1 goto End
copy /Y ..\bin64\updater\updater.ico .\zipped.package.release64\updater\
If ErrorLevel 1 goto End


"C:\Program Files\7-Zip\7z.exe" -mx9 -mmt=12 a -r .\npp.portable.x64.7z .\zipped.package.release64\*
If ErrorLevel 1 goto End



