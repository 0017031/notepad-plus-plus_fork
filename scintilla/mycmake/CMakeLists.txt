cmake_minimum_required(VERSION 3.20)
set(t libscintilla)

get_filename_component(scintilla_path ".." ABSOLUTE)
get_filename_component(boostregex_path "../../boostregex" ABSOLUTE)

message("${t}     : ${CMAKE_BUILD_TYPE},  ${CMAKE_CURRENT_SOURCE_DIR}")

if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR) # stand-alone
	message("project(${t} CXX),   ${CMAKE_SOURCE_DIR}\n")
	set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
	project(${t} CXX)

	message("scintilla_path:\t\t${scintilla_path}")
	message("boostregex_path:\t${boostregex_path}\n")

else()
	set(SCINTILLA_STATIC_LIBRARY ${t} PARENT_SCOPE)
endif()

set(CMAKE_RC_FLAGS "/l\"0x0409\"")

add_library(${t})

target_include_directories(${t} PUBLIC ${scintilla_path}/include)
target_include_directories(${t} PRIVATE ${scintilla_path}/src ${boostregex_path})

target_compile_definitions(${t} PRIVATE SCI_OWNREGEX BOOST_REGEX_STANDALONE _UNICODE UNICODE _CRT_SECURE_NO_DEPRECATE SCI_OWNREGEX) # _USRDLL

set_target_properties(${t} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ${scintilla_path}/bin)

target_compile_features(${t} PRIVATE cxx_std_17)
target_compile_options(${t} PRIVATE /W4 /WX /GS /EHsc /GL)

# target_compile_options(${t} PUBLIC $<$<CONFIG:Release>: /GL>)
set_target_properties(${t} PROPERTIES STATIC_LIBRARY_OPTIONS "/LTCG")

# scintilla\win32\Scintilla.vcxproj
# .  => win32\
# .. => scintilla\
    # <ClCompile Include="..\src\*.cxx" />
    # <ClCompile Include="..\..\boostregex\*.cxx" />
    # <ClCompile Include="..\win32\HanjaDic.cxx" />
    # <ClCompile Include="..\win32\PlatWin.cxx" />
    # <ClCompile Include="..\win32\ListBox.cxx" />
    # <ClCompile Include="..\win32\SurfaceGDI.cxx" />
    # <ClCompile Include="..\win32\SurfaceD2D.cxx" />
    # <ClCompile Include="..\win32\ScintillaWin.cxx" />
    # <ClCompile Include="..\win32\ScintillaDLL.cxx" />


file(GLOB scintilla_SRC_CXX_FILES 	"${scintilla_path}/src/*.cxx" )
file(GLOB boostregex_CXX_FILES 		"${boostregex_path}/*.cxx" )

target_sources(${t} PRIVATE
	${scintilla_SRC_CXX_FILES}
	${boostregex_CXX_FILES}
	${scintilla_path}/win32/HanjaDic.cxx
	${scintilla_path}/win32/PlatWin.cxx
	${scintilla_path}/win32/ListBox.cxx
	${scintilla_path}/win32/SurfaceGDI.cxx
	${scintilla_path}/win32/SurfaceD2D.cxx

	# ${scintilla_path}/win32/ScintillaBase.cxx

	${scintilla_path}/win32/ScintillaWin.cxx
	# ${scintilla_path}/win32/ScintillaDLL.cxx

	${scintilla_path}/win32/ScintRes.rc
	
)

# /MP
# /FS
# $<$<CONFIG:RELEASE>:/fsanitize=address> $<$<CONFIG:RELWITHDEBINFO>:/fsanitize=address>

# STRING(REGEX REPLACE "/W[0-9]" "/W4" CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS}) # override default warning level
# add_compile_definitions(_SILENCE_CXX17_STRSTREAM_DEPRECATION_WARNING "$<$<CONFIG:DEBUG>:_DEBUG>")

# edit-and-continue
# string(REPLACE "/Zi" "/ZI" CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}") # edit and continue
# string(REPLACE "/Zi" "/ZI" CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}") # edit and continue
# string(REPLACE "/Zi" "/ZI" CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO}") # edit and continue
# add_link_options(/SAFESEH:NO) # no /safeseh for edit-and-continue

# rc /nologo
# set(CMAKE_RC_FLAGS "/nologo")

# add_subdirectory(
# CommonTools/CommonLogFile/CommonEventLibrary/CEL/src)
# add_subdirectory(
# CommonTools/CommonLogFile/Heron/src)

# message("lib_c2_XmlDocHandler")
# add_library(lib_c2_XmlDocHandler XmlDocHandler.cpp)
# target_link_directories(lib_c2_XmlDocHandler PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# add_subdirectory(catch2_test cel2_test)

# set_property(GLOBAL PROPERTY CTEST_TARGETS_ADDED 1)
# include(CTest)
# include(Catch)
# catch_discover_tests(app_test_XmDoclHandler)

# STRING(REGEX REPLACE "/W[0-9]" "/W4" CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS}) # override default warning level
# add_compile_definitions(_SILENCE_CXX17_STRSTREAM_DEPRECATION_WARNING "$<$<CONFIG:DEBUG>:_DEBUG>")

# edit-and-continue
# string(REPLACE "/Zi" "/ZI" CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}") # edit and continue
# string(REPLACE "/Zi" "/ZI" CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}") # edit and continue
# string(REPLACE "/Zi" "/ZI" CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO}") # edit and continue
# add_link_options(/SAFESEH:NO) # no /safeseh for edit-and-continue

# if(MSVC)
# set(MSVC_DISABLED_WARNINGS_LIST
# "C4068" # C4068: unknown pragma
# )
# string(REPLACE "C" " -wd" MSVC_DISABLED_WARNINGS_STR ${MSVC_DISABLED_WARNINGS_LIST}) # string(REPLACE <match-string> <replace-string> <out-var> <input>...)
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP /W3 ${MSVC_DISABLED_WARNINGS_STR}")
# else() # if (CMAKE_COMPILER_IS_GNUCC)
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
# endif()

# D:/vs2022/VC/Tools/MSVC/14.30.30528/bin/HostX64/x64/CL.exe
# /c
# ../include
# ../src
# ../../boostregex

# /Zi
# /nologo
# /W4
# /WX-
# /diagnostics:caret
# /MP6
# /O2
# /Oi
# /Ot
# /GL
# /D NDEBUG
# /D _CRT_SECURE_NO_DEPRECATE
# /D _USRDLL
# /D SCI_OWNREGEX
# /D SCI_NAMESPACE
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
# /Fo"Intermediates/x64/Release//"
# /Fd"d:/don_t_sync/notepad++_src/PowerEditor/visual.net/x64/Release/libScintilla.pdb"
# /external:W4
# /Gd
# /TP
# /FC
# /errorReport:queue
# ../src/AutoComplete.cxx
# ../src/CallTip.cxx
# ../src/CaseConvert.cxx
# ../src/CaseFolder.cxx
# ../src/CellBuffer.cxx
# ../src/ChangeHistory.cxx
# ../src/CharacterCategoryMap.cxx
# ../src/CharacterType.cxx
# ../src/CharClassify.cxx
# ../src/ContractionState.cxx
# ../src/DBCS.cxx
# ../src/Decoration.cxx
# ../src/Document.cxx
# ../src/EditModel.cxx
# ../src/Editor.cxx
# ../src/EditView.cxx
# ../src/Geometry.cxx
# ../src/Indicator.cxx
# ../src/KeyMap.cxx
# ../src/LineMarker.cxx
# ../src/MarginView.cxx
# ../src/PerLine.cxx
# ../src/PositionCache.cxx
# ../src/RESearch.cxx
# ../src/RunStyles.cxx
# ../src/ScintillaBase.cxx
# ../src/Selection.cxx
# ../src/Style.cxx
# ../src/UniConversion.cxx
# ../src/UniqueString.cxx
# ../src/ViewStyle.cxx
# ../src/XPM.cxx
# ../../boostregex/BoostRegExSearch.cxx
# ../../boostregex/UTF8DocumentIterator.cxx
# ../win32/HanjaDic.cxx
# ../win32/PlatWin.cxx
# ../win32/ScintillaWin.cxx
# ../win32/ScintillaDLL.cxx

# C:\Program Files (x86)\Windows Kits\10\bin\10.0.19041.0\x64\rc.exe /D _UNICODE /D UNICODE /l"0x0409" /nologo /fo"Intermediates\x64\Release\ScintRes.res" ..\win32\ScintRes.rc

# D:\vs2022\VC\Tools\MSVC\14.30.30528\bin\HostX64\x64\Lib.exe /OUT:"d:\don_t_sync\notepad++_src\PowerEditor\visual.net\x64\Release\libScintilla.lib" /NOLOGO /MACHINE:X64 /LTCG
