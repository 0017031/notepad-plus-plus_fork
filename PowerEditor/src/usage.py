aa ="""
Usage :\r
\r
notepad++ [--help] [-multiInst] [-noPlugin] [-lLanguage] [-udl=\"My UDL Name\"] [-LlangCode] [-nLineNumber] [-cColumnNumber] [-pPosition] [-xLeftPos] [-yTopPos] [-monitor] [-nosession] [-notabbar] [-ro] [-systemtray] [-loadingTime] [-alwaysOnTop] [-openSession] [-r] [-qn=\"Easter egg name\" | -qt=\"a text to display.\" | -qf=\"D:\\my quote.txt\"] [-qSpeed1|2|3] [-quickPrint] [-settingsDir=\"d:\\your settings dir\\\"] [-openFoldersAsWorkspace]  [-titleAdd=\"additional title bar text\"][filePath]\r
\r
--help : This help message\r
-multiInst : Launch another Notepad++ instance\r
-noPlugin : Launch Notepad++ without loading any plugin\r
-l : Open file or Ghost type with syntax highlighting of choice\r
-udl=\"My UDL Name\": Open file by applying User Defined Language\r
-L : Apply indicated localization, langCode is browser language code\r
-n : Scroll to indicated line on filePath\r
-c : Scroll to indicated column on filePath\r
-p : Scroll to indicated position on filePath\r
-x : Move Notepad++ to indicated left side position on the screen\r
-y : Move Notepad++ to indicated top position on the screen\r
-monitor: Open file with file monitoring enabled\r
-nosession : Launch Notepad++ without previous session\r
-notabbar : Launch Notepad++ without tabbar\r
-ro : Make the filePath read only\r
-systemtray : Launch Notepad++ directly in system tray\r
-loadingTime : Display Notepad++ loading time\r
-alwaysOnTop : Make Notepad++ always on top\r
-openSession : Open a session. filePath must be a session file\r
-r : Open files recursively. This argument will be ignored\r
     if filePath contain no wildcard character\r
-qn=\"Easter egg name\": Ghost type easter egg via its name\r
-qt=\"text to display.\": Ghost type the given text\r
-qf=\"D:\\my quote.txt\": Ghost type a file content via the file path\r
-qSpeed : Ghost typing speed. Value from 1 to 3 for slow, fast and fastest\r
-quickPrint : Print the file given as argument then quit Notepad++\r
-settingsDir=\"d:\\your settings dir\\\": Override the default settings dir\r
-openFoldersAsWorkspace: open filePath of folder(s) as workspace\r
-titleAdd=\"string\": add string to Notepad++ title bar\r
filePath : file or folder name to open (absolute or relative path name)\r
"""

print(aa)