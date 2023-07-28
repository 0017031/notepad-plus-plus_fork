cmake_minimum_required(VERSION 3.20)
set(t liblexilla)
get_filename_component(lexilla_path ".." ABSOLUTE)
get_filename_component(scintilla_path "../../scintilla" ABSOLUTE)
get_filename_component(lexlib_path "../lexlib" ABSOLUTE)
message("${t}       : ${CMAKE_BUILD_TYPE},  ${CMAKE_CURRENT_SOURCE_DIR}")

if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR) # stand-alone
	set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
	message("project(${t} CXX),     ${CMAKE_SOURCE_DIR}")

	project(${t} CXX)

	message("lexilla_path:\t${lexilla_path}")
	message("scintilla_path:\t${scintilla_path}")
	message("lexlib_path:\t${lexlib_path}\n")

else()
	set(LEXILLA_STATIC_LIBRARY ${t} PARENT_SCOPE)
endif()

add_library(${t})

target_include_directories(${t} PUBLIC ${lexilla_path}/include)
target_include_directories(${t} PRIVATE ${scintilla_path}/include ${lexlib_path})
target_compile_definitions(${t} PRIVATE _UNICODE UNICODE _CRT_SECURE_NO_DEPRECATE) # _USRDLL
set_target_properties(${t} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${lexilla_path}/bin")

target_compile_features(${t} PRIVATE cxx_std_17)
target_compile_options(${t} PRIVATE /W4 /WX /GS /EHsc /GL)

# target_compile_options(${t} PUBLIC $<$<CONFIG:Release>: /GL>)
set_target_properties(${t} PROPERTIES STATIC_LIBRARY_OPTIONS "/LTCG")


# D:\don_t_sync\notepad++_src\lexilla\src\Lexilla.vcxproj
    # <ClCompile Include="..\lexers\*.cxx" />           lexilla_path/lexers/*.cxx
    # <ClCompile Include="..\lexlib\*.cxx" />
    # <ClCompile Include="..\src\Lexilla.cxx" />
    # <ResourceCompile Include="..\src\LexillaVersion.rc" />

file(GLOB Lexilla_lexers_SRC_CXX_FILES 	"${lexilla_path}/lexers/*.cxx" )
file(GLOB Lexilla_lexlib_SRC_CXX_FILES 	"${lexilla_path}/lexlib/*.cxx" )
target_sources(${t} PRIVATE
	${Lexilla_lexers_SRC_CXX_FILES}
	${Lexilla_lexlib_SRC_CXX_FILES}
    ${lexilla_path}/src/Lexilla.cxx
    ${lexilla_path}/src/LexillaVersion.rc
)

# #
# > MSBuild src\Lexilla.vcxproj -p:configuration="Release" -p:platform="x64"

# ClCompile:
# D:\vs2022\VC\Tools\MSVC\14.30.30528\bin\HostX64\x64\CL.exe /c /I..\include /I..\..\scintilla\include /I..\lexlib /Zi /nologo /W4 /WX- /diagnostics:column /MP6 /O2 /Oi /Ot /GL /D NDEBUG
# /D WIN32 /D _CRT_SECURE_NO_DEPRECATE /D _WINDOWS /D _USRDLL /D _UNICODE /D UNICODE /Gm- /EHsc /MT /GS /Gy /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /std:c++17 /Fo"x64\Release\\" /
# Fd"d:\don_t_sync\notepad++_src\lexilla\src\x64\Release\libLexilla.pdb" /external:W4 /Gd /TP /FC /errorReport:queue ..\lexers\LexA68k.cxx ..\lexers\LexAbaqus.cxx ..\lexers\LexAda.cxx ..\
# lexers\LexAPDL.cxx ..\lexers\LexAsciidoc.cxx ..\lexers\LexAsm.cxx ..\lexers\LexAsn1.cxx ..\lexers\LexASY.cxx ..\lexers\LexAU3.cxx ..\lexers\LexAVE.cxx ..\lexers\LexAVS.cxx ..\lexers\Lex
# Baan.cxx ..\lexers\LexBash.cxx ..\lexers\LexBasic.cxx ..\lexers\LexBatch.cxx ..\lexers\LexBibTeX.cxx ..\lexers\LexBullant.cxx ..\lexers\LexCaml.cxx ..\lexers\LexCIL.cxx ..\lexers\LexCLW
# .cxx ..\lexers\LexCmake.cxx ..\lexers\LexCOBOL.cxx ..\lexers\LexCoffeeScript.cxx ..\lexers\LexConf.cxx ..\lexers\LexCPP.cxx ..\lexers\LexCrontab.cxx ..\lexers\LexCsound.cxx ..\lexers\Le
# xCSS.cxx ..\lexers\LexD.cxx ..\lexers\LexDataflex.cxx ..\lexers\LexDiff.cxx ..\lexers\LexDMAP.cxx ..\lexers\LexDMIS.cxx ..\lexers\LexECL.cxx ..\lexers\LexEDIFACT.cxx ..\lexers\LexEiffel
# .cxx ..\lexers\LexErlang.cxx ..\lexers\LexErrorList.cxx ..\lexers\LexEScript.cxx ..\lexers\LexFlagship.cxx ..\lexers\LexForth.cxx ..\lexers\LexFortran.cxx ..\lexers\LexFSharp.cxx ..\lex
# ers\LexGAP.cxx ..\lexers\LexGDScript.cxx ..\lexers\LexGui4Cli.cxx ..\lexers\LexHaskell.cxx ..\lexers\LexHex.cxx ..\lexers\LexHollywood.cxx ..\lexers\LexHTML.cxx ..\lexers\LexIndent.cxx
# ..\lexers\LexInno.cxx ..\lexers\LexJSON.cxx ..\lexers\LexJulia.cxx ..\lexers\LexKix.cxx ..\lexers\LexKVIrc.cxx ..\lexers\LexLaTeX.cxx ..\lexers\LexLisp.cxx ..\lexers\LexLout.cxx ..\lexe
# rs\LexLua.cxx ..\lexers\LexMagik.cxx ..\lexers\LexMake.cxx ..\lexers\LexMarkdown.cxx ..\lexers\LexMatlab.cxx ..\lexers\LexMaxima.cxx ..\lexers\LexMetapost.cxx ..\lexers\LexMMIXAL.cxx ..
# \lexers\LexModula.cxx ..\lexers\LexMPT.cxx ..\lexers\LexMSSQL.cxx ..\lexers\LexMySQL.cxx ..\lexers\LexNim.cxx ..\lexers\LexNimrod.cxx ..\lexers\LexNsis.cxx ..\lexers\LexNull.cxx ..\lexe
# rs\LexObjC.cxx ..\lexers\LexOpal.cxx ..\lexers\LexOScript.cxx ..\lexers\LexPascal.cxx ..\lexers\LexPB.cxx ..\lexers\LexPerl.cxx ..\lexers\LexPLM.cxx ..\lexers\LexPO.cxx ..\lexers\LexPOV
# .cxx ..\lexers\LexPowerPro.cxx ..\lexers\LexPowerShell.cxx ..\lexers\LexProgress.cxx ..\lexers\LexProps.cxx ..\lexers\LexPS.cxx ..\lexers\LexPython.cxx ..\lexers\LexR.cxx ..\lexers\LexR
# aku.cxx ..\lexers\LexRebol.cxx ..\lexers\LexRegistry.cxx ..\lexers\LexRuby.cxx ..\lexers\LexRust.cxx ..\lexers\LexSAS.cxx ..\lexers\LexScriptol.cxx ..\lexers\LexSearchResult.cxx ..\lexe
# rs\LexSmalltalk.cxx ..\lexers\LexSML.cxx ..\lexers\LexSorcus.cxx ..\lexers\LexSpecman.cxx ..\lexers\LexSpice.cxx ..\lexers\LexSQL.cxx ..\lexers\LexStata.cxx ..\lexers\LexSTTXT.cxx ..\le
# xers\LexTACL.cxx ..\lexers\LexTADS3.cxx ..\lexers\LexTAL.cxx ..\lexers\LexTCL.cxx ..\lexers\LexTCMD.cxx ..\lexers\LexTeX.cxx ..\lexers\LexTxt2tags.cxx ..\lexers\LexUser.cxx ..\lexers\Le
# xVB.cxx ..\lexers\LexVerilog.cxx ..\lexers\LexVHDL.cxx ..\lexers\LexVisualProlog.cxx ..\lexers\LexX12.cxx ..\lexers\LexYAML.cxx ..\lexlib\Accessor.cxx ..\lexlib\CharacterCategory.cxx ..
# \lexlib\CharacterSet.cxx ..\lexlib\DefaultLexer.cxx ..\lexlib\LexAccessor.cxx ..\lexlib\LexerBase.cxx ..\lexlib\LexerModule.cxx ..\lexlib\LexerNoExceptions.cxx ..\lexlib\LexerSimple.cxx
# ..\lexlib\PropSetSimple.cxx ..\lexlib\StyleContext.cxx ..\lexlib\WordList.cxx ..\src\Lexilla.cxx

# D:\vs2022\VC\Tools\MSVC\14.30.30528\bin\HostX64\x64\CL.exe
# /c
# /I..\include
# /I..\..\scintilla\include
# /I..\lexlib
# /Zi
# /nologo
# /W4
# /WX-
# /diagnostics:column
# /MP6
# /O2
# /Oi
# /Ot
# /GL
# /D NDEBUG
# /D WIN32
# /D _CRT_SECURE_NO_DEPRECATE
# /D _WINDOWS
# /D _USRDLL
# /D _UNICODE
# /D UNICODE
# /Gm-
# /EHsc
# /MT
# /GS
# /Gy
# /fp:precise
# /Zc:wchar_t
# /Zc:forScope
# /Zc:inline
# /std:c++17
# /Fo"x64\Release\\"
# /Fd"d:\don_t_sync\notepad++_src\lexilla\src\x64\Release\libLexilla.pdb"
# /external:W4
# /Gd
# /TP
# /FC
# /errorReport:queue
# ..\lexers\LexA68k.cxx
# ..\lexers\LexAbaqus.cxx
# ..\lexers\LexAda.cxx
# ..\lexers\LexAPDL.cxx
# ..\lexers\LexAsciidoc.cxx
# ..\lexers\LexAsm.cxx
# ..\lexers\LexAsn1.cxx
# ..\lexers\LexASY.cxx
# ..\lexers\LexAU3.cxx
# ..\lexers\LexAVE.cxx
# ..\lexers\LexAVS.cxx
# ..\lexers\LexBaan.cxx
# ..\lexers\LexBash.cxx
# ..\lexers\LexBasic.cxx
# ..\lexers\LexBatch.cxx
# ..\lexers\LexBibTeX.cxx
# ..\lexers\LexBullant.cxx
# ..\lexers\LexCaml.cxx
# ..\lexers\LexCIL.cxx
# ..\lexers\LexCLW.cxx
# ..\lexers\LexCmake.cxx
# ..\lexers\LexCOBOL.cxx
# ..\lexers\LexCoffeeScript.cxx
# ..\lexers\LexConf.cxx
# ..\lexers\LexCPP.cxx
# ..\lexers\LexCrontab.cxx
# ..\lexers\LexCsound.cxx
# ..\lexers\LexCSS.cxx
# ..\lexers\LexD.cxx
# ..\lexers\LexDataflex.cxx
# ..\lexers\LexDiff.cxx
# ..\lexers\LexDMAP.cxx
# ..\lexers\LexDMIS.cxx
# ..\lexers\LexECL.cxx
# ..\lexers\LexEDIFACT.cxx
# ..\lexers\LexEiffel.cxx
# ..\lexers\LexErlang.cxx
# ..\lexers\LexErrorList.cxx
# ..\lexers\LexEScript.cxx
# ..\lexers\LexFlagship.cxx
# ..\lexers\LexForth.cxx
# ..\lexers\LexFortran.cxx
# ..\lexers\LexFSharp.cxx
# ..\lexers\LexGAP.cxx
# ..\lexers\LexGDScript.cxx
# ..\lexers\LexGui4Cli.cxx
# ..\lexers\LexHaskell.cxx
# ..\lexers\LexHex.cxx
# ..\lexers\LexHollywood.cxx
# ..\lexers\LexHTML.cxx
# ..\lexers\LexIndent.cxx..\lexers\LexInno.cxx
# ..\lexers\LexJSON.cxx
# ..\lexers\LexJulia.cxx
# ..\lexers\LexKix.cxx
# ..\lexers\LexKVIrc.cxx
# ..\lexers\LexLaTeX.cxx
# ..\lexers\LexLisp.cxx
# ..\lexers\LexLout.cxx
# ..\lexers\LexLua.cxx
# ..\lexers\LexMagik.cxx
# ..\lexers\LexMake.cxx
# ..\lexers\LexMarkdown.cxx
# ..\lexers\LexMatlab.cxx
# ..\lexers\LexMaxima.cxx
# ..\lexers\LexMetapost.cxx
# ..\lexers\LexMMIXAL.cxx
# ..\lexers\LexModula.cxx
# ..\lexers\LexMPT.cxx
# ..\lexers\LexMSSQL.cxx
# ..\lexers\LexMySQL.cxx
# ..\lexers\LexNim.cxx
# ..\lexers\LexNimrod.cxx
# ..\lexers\LexNsis.cxx
# ..\lexers\LexNull.cxx
# ..\lexers\LexObjC.cxx
# ..\lexers\LexOpal.cxx
# ..\lexers\LexOScript.cxx
# ..\lexers\LexPascal.cxx
# ..\lexers\LexPB.cxx
# ..\lexers\LexPerl.cxx
# ..\lexers\LexPLM.cxx
# ..\lexers\LexPO.cxx
# ..\lexers\LexPOV.cxx
# ..\lexers\LexPowerPro.cxx
# ..\lexers\LexPowerShell.cxx
# ..\lexers\LexProgress.cxx
# ..\lexers\LexProps.cxx
# ..\lexers\LexPS.cxx
# ..\lexers\LexPython.cxx
# ..\lexers\LexR.cxx
# ..\lexers\LexRaku.cxx
# ..\lexers\LexRebol.cxx
# ..\lexers\LexRegistry.cxx
# ..\lexers\LexRuby.cxx
# ..\lexers\LexRust.cxx
# ..\lexers\LexSAS.cxx
# ..\lexers\LexScriptol.cxx
# ..\lexers\LexSearchResult.cxx
# ..\lexers\LexSmalltalk.cxx
# ..\lexers\LexSML.cxx
# ..\lexers\LexSorcus.cxx
# ..\lexers\LexSpecman.cxx
# ..\lexers\LexSpice.cxx
# ..\lexers\LexSQL.cxx
# ..\lexers\LexStata.cxx
# ..\lexers\LexSTTXT.cxx
# ..\lexers\LexTACL.cxx
# ..\lexers\LexTADS3.cxx
# ..\lexers\LexTAL.cxx
# ..\lexers\LexTCL.cxx
# ..\lexers\LexTCMD.cxx
# ..\lexers\LexTeX.cxx
# ..\lexers\LexTxt2tags.cxx
# ..\lexers\LexUser.cxx
# ..\lexers\LexVB.cxx
# ..\lexers\LexVerilog.cxx
# ..\lexers\LexVHDL.cxx
# ..\lexers\LexVisualProlog.cxx
# ..\lexers\LexX12.cxx
# ..\lexers\LexYAML.cxx
# ..\lexlib\Accessor.cxx
# ..\lexlib\CharacterCategory.cxx
# ..\lexlib\CharacterSet.cxx
# ..\lexlib\DefaultLexer.cxx
# ..\lexlib\LexAccessor.cxx
# ..\lexlib\LexerBase.cxx
# ..\lexlib\LexerModule.cxx
# ..\lexlib\LexerNoExceptions.cxx
# ..\lexlib\LexerSimple.cxx..\lexlib\PropSetSimple.cxx
# ..\lexlib\StyleContext.cxx
# ..\lexlib\WordList.cxx
# ..\src\Lexilla.cxx

# ResourceCompile:
# C:\Program Files (x86)\Windows Kits\10\bin\10.0.19041.0\x64\rc.exe /D _UNICODE /D UNICODE /l"0x0409" /nologo /fo"x64\Release\LexillaVersion.res" ..\src\LexillaVersion.rc
# Lib:
# D:\vs2022\VC\Tools\MSVC\14.30.30528\bin\HostX64\x64\Lib.exe /OUT:"d:\don_t_sync\notepad++_src\lexilla\src\x64\Release\libLexilla.lib" /NOLOGO /MACHINE:X64 /LTCG x64\Release\LexillaVersion.res
