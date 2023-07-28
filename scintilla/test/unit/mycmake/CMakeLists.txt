cmake_minimum_required(VERSION 3.20)
set(t _scintilla_unit_test)
message("${t}     : ${CMAKE_BUILD_TYPE},  ${CMAKE_CURRENT_SOURCE_DIR}")

if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR) # stand-alone
	project(${t} CXX)
	message("project(${t} CXX), ${CMAKE_SOURCE_DIR}")
endif()

set(CMAKE_RC_FLAGS "/l\"0x0409\" /nologo")

# set(CMAKE_STATIC_LINKER_FLAGS "${CMAKE_STATIC_LINKER_FLAGS} /nologo /LTCG Intermediat") # You can also use STATIC_LIBRARY_OPTIONS target property.
add_executable(${t})
target_compile_features(${t} PRIVATE cxx_std_17)
target_include_directories(${t} PRIVATE ../../../include ../../../src ../../../lexlib)
target_compile_options(${t} PRIVATE /nologo /diagnostics:caret /GS)
target_compile_options(${t} PRIVATE $<$<CONFIG:Debug>: /JMC>)
target_compile_definitions(${t} PRIVATE CHECK_CORRECTNESS _CONSOLE)

target_sources(${t} PRIVATE

	../../../src/CaseConvert.cxx
	../../../src/CaseFolder.cxx
	../../../src/CellBuffer.cxx
	../../../src/ChangeHistory.cxx
	../../../src/CharacterCategoryMap.cxx
	../../../src/CharClassify.cxx
	../../../src/ContractionState.cxx
	../../../src/Decoration.cxx
	../../../src/Document.cxx
	../../../src/Geometry.cxx
	../../../src/PerLine.cxx
	../../../src/RESearch.cxx
	../../../src/RunStyles.cxx
	../../../src/UniConversion.cxx
	../../../src/UniqueString.cxx
	../testCellBuffer.cxx
	../testCharacterCategoryMap.cxx
	../testCharClassify.cxx
	../testContractionState.cxx
	../testDecoration.cxx
	../testDocument.cxx
	../testGeometry.cxx
	../testPartitioning.cxx
	../testPerLine.cxx
	../testRESearch.cxx
	../testRunStyles.cxx
	../testSparseVector.cxx
	../testSplitVector.cxx
	../testUniConversion.cxx
	../UnitTester.cxx)

# Build started 2023-07-24 15:35:49.
# Project "d:\don_t_sync\notepad++_src\scintilla\test\unit\UnitTester.vcxproj" on node 1 (default targets).
# PrepareForBuild:
# Creating directory "Debug\".
# Creating directory "Debug\UnitTester.tlog\".
# InitializeBuildStatus:
# Creating "Debug\UnitTester.tlog\unsuccessfulbuild" because "AlwaysCreate" was specified.
# ClCompile:
# D:\vs2022\VC\Tools\MSVC\14.30.30528\bin\HostX86\x86\CL.exe /c /I..\..\include /I..\..\src /I..\..\lexlib /ZI /JMC /nologo /W3 /WX- /diagnostics:column /Od /Oy- /D CHECK_CORRECTNESS /D _
# DEBUG /D _CONSOLE /D _UNICODE /D UNICODE /Gm- /EHsc /RTC1 /MDd /GS /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /std:c++17 /Fo"Debug\\" /Fd"Debug\vc142.pdb" /external:W3 /Gd /TP /ana
# lyze- /FC /errorReport:queue ..\..\src\CaseConvert.cxx ..\..\src\CaseFolder.cxx ..\..\src\CellBuffer.cxx ..\..\src\ChangeHistory.cxx ..\..\src\CharacterCategoryMap.cxx ..\..\src\CharCla
# ssify.cxx ..\..\src\ContractionState.cxx ..\..\src\Decoration.cxx ..\..\src\Document.cxx ..\..\src\Geometry.cxx ..\..\src\PerLine.cxx ..\..\src\RESearch.cxx ..\..\src\RunStyles.cxx ..\.
# .\src\UniConversion.cxx ..\..\src\UniqueString.cxx testCellBuffer.cxx testCharacterCategoryMap.cxx testCharClassify.cxx testContractionState.cxx testDecoration.cxx testDocument.cxx test
# Geometry.cxx testPartitioning.cxx testPerLine.cxx testRESearch.cxx testRunStyles.cxx testSparseVector.cxx testSplitVector.cxx testUniConversion.cxx UnitTester.cxx
# CaseConvert.cxx
# CaseFolder.cxx
# CellBuffer.cxx
# ChangeHistory.cxx
# CharacterCategoryMap.cxx
# CharClassify.cxx
# ContractionState.cxx
# Decoration.cxx
# Document.cxx
# Geometry.cxx
# PerLine.cxx
# RESearch.cxx
# RunStyles.cxx
# UniConversion.cxx
# UniqueString.cxx
# testCellBuffer.cxx
# testCharacterCategoryMap.cxx
# testCharClassify.cxx
# testContractionState.cxx
# testDecoration.cxx
# Generating Code...
# Compiling...
# testDocument.cxx
# testGeometry.cxx
# testPartitioning.cxx
# testPerLine.cxx
# testRESearch.cxx
# testRunStyles.cxx
# testSparseVector.cxx
# testSplitVector.cxx
# testUniConversion.cxx
# UnitTester.cxx
# Generating Code...
# Link:
# D:\vs2022\VC\Tools\MSVC\14.30.30528\bin\HostX86\x86\link.exe /ERRORREPORT:QUEUE /OUT:"d:\don_t_sync\notepad++_src\scintilla\test\unit\Debug\UnitTester.exe" /INCREMENTAL /ILK:"Debug\Unit
# Tester.ilk" /NOLOGO /NATVIS:Sci.natvis kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /MANI
# FEST /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG /PDB:"d:\don_t_sync\notepad++_src\scintilla\test\unit\Debug\UnitTester.pdb" /SUBSYSTEM:CONSOLE /TLBID:1 /DY
# NAMICBASE /NXCOMPAT /IMPLIB:"d:\don_t_sync\notepad++_src\scintilla\test\unit\Debug\UnitTester.lib" /MACHINE:X86 /pdbthreads:6 Debug\CaseConvert.obj
# Debug\CaseFolder.obj
# Debug\CellBuffer.obj
# Debug\ChangeHistory.obj
# Debug\CharacterCategoryMap.obj
# Debug\CharClassify.obj
# Debug\ContractionState.obj
# Debug\Decoration.obj
# Debug\Document.obj
# Debug\Geometry.obj
# Debug\PerLine.obj
# Debug\RESearch.obj
# Debug\RunStyles.obj
# Debug\UniConversion.obj
# Debug\UniqueString.obj
# Debug\testCellBuffer.obj
# Debug\testCharacterCategoryMap.obj
# Debug\testCharClassify.obj
# Debug\testContractionState.obj
# Debug\testDecoration.obj
# Debug\testDocument.obj
# Debug\testGeometry.obj
# Debug\testPartitioning.obj
# Debug\testPerLine.obj
# Debug\testRESearch.obj
# Debug\testRunStyles.obj
# Debug\testSparseVector.obj
# Debug\testSplitVector.obj
# Debug\testUniConversion.obj
# Debug\UnitTester.obj
# UnitTester.vcxproj -> d:\don_t_sync\notepad++_src\scintilla\test\unit\Debug\UnitTester.exe
# FinalizeBuildStatus:
# Deleting file "Debug\UnitTester.tlog\unsuccessfulbuild".
# Touching "Debug\UnitTester.tlog\UnitTester.lastbuildstate".
# Done Building Project "d:\don_t_sync\notepad++_src\scintilla\test\unit\UnitTester.vcxproj" (default targets).

# Build succeeded.
# 0 Warning(s)
# 0 Error(s)

# Time Elapsed 00:00:35.50
