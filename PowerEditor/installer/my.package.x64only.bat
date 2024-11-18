@echo off

rmdir /S /Q .\build 2>nul 
REM mkdir .\build


rem Remove old built Notepad++ 64-bit package
REM rmdir /S /Q .\zipped.package.release64 2>nul

rem Re-build Notepad++ 64-bit package folders
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

@echo on


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

rem Plugins: Copy needed files into Notepad++ 64-bit package folders
copy /Y "..\bin64\plugins\NppExport\NppExport.dll" .\zipped.package.release64\plugins\NppExport\
If ErrorLevel 1 goto End
copy /Y "..\bin64\plugins\mimeTools\mimeTools.dll" .\zipped.package.release64\plugins\mimeTools\
If ErrorLevel 1 goto End
copy /Y "..\bin64\plugins\NppConverter\NppConverter.dll" .\zipped.package.release64\plugins\NppConverter\
If ErrorLevel 1 goto End



rem localizations: Copy all files into Notepad++ 32-bit/64-bit package folders
REM copy /Y ".\nativeLang\*.xml" .\zipped.package.release64\localization\
REM If ErrorLevel 1 goto End

rem files API: Copy all files into Notepad++ 32-bit/64-bit package folders
copy /Y ".\APIs\*.xml" .\zipped.package.release64\autoCompletion\
If ErrorLevel 1 goto End

rem FunctionList files: Copy all files into Notepad++ 32-bit/64-bit package folders
REM copy /Y ".\functionList\*.xml" .\zipped.package.release\functionList\
If ErrorLevel 1 goto End
copy /Y ".\functionList\*.xml" .\zipped.package.release64\functionList\
If ErrorLevel 1 goto End
REM copy /Y ".\functionList\*.xml" .\zipped.package.releaseArm64\functionList\
If ErrorLevel 1 goto End

rem Markdown as UserDefineLanguge: Markdown syntax highlighter into Notepad++ 32-bit/64-bit package folders
REM copy /Y "..\bin\userDefineLangs\markdown._preinstalled.udl.xml" .\zipped.package.release64\userDefineLangs\
REM If ErrorLevel 1 goto End
REM copy /Y "..\bin\userDefineLangs\markdown._preinstalled_DM.udl.xml" .\zipped.package.release64\userDefineLangs\
REM If ErrorLevel 1 goto End
copy /Y "..\bin\userDefineLangs\*.xml" .\zipped.package.release64\userDefineLangs\
If ErrorLevel 1 goto End


rem For disabling auto-updater
REM copy /Y ..\src\config.4zipPackage.xml .\zipped.package.release64\config.xml
REM If ErrorLevel 1 goto End
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


7z.exe a -r .\build\npp.portable.x64.7z .\zipped.package.release64\*
If ErrorLevel 1 goto End


rem set var locally in this batch file
setlocal enableDelayedExpansion 



endlocal

:End