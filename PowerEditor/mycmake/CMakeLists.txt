cmake_minimum_required(VERSION 3.20)
set(t notepad++)
project(${t})
include(CMakePrintHelpers)

set(CMAKE_SHARED_LINKER_FLAGS /MANIFEST:NO)

# cmake -G Ninja -S PowerEditor\mycmake\ -B build_release -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreadedDLL -DCMAKE_BUILD_TYPE=Release -D-DCMAKE_EXPORT_COMPILE_COMMANDS=1

# set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
string(REPLACE "/EHsc" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
set(CMAKE_RC_FLAGS "/l\"0x0409\" /nologo")

get_filename_component(PowerEditor_path .. ABSOLUTE)
get_filename_component(npp_root ../.. ABSOLUTE)
message("${t}        : ${CMAKE_BUILD_TYPE},  ${CMAKE_CURRENT_SOURCE_DIR}")

add_subdirectory(${npp_root}/scintilla/mycmake scintilla)
add_subdirectory(${npp_root}/lexilla/mycmake lexilla)

add_library(eha OBJECT "${PowerEditor_path}/src/MISC/Exception/Win32Exception.cpp")
target_compile_options(eha PRIVATE /EHa /W4 /WX /GL /GS)

add_executable(${t} WIN32)
# set_target_properties(${t} PROPERTIES RUNTIME_OUTPUT_DIRECTORY D:/app/notepad++/current)

target_compile_features(${t} PRIVATE cxx_std_20)
target_compile_options(${t} PRIVATE
	/EHsc /GL /GS
	/W4 /WX
	/wd4456 /wd4459 #  /wd4457 /wd4535
)

target_compile_definitions(${t} PRIVATE
	TIXML_USE_STL TIXMLA_USE_STL
	UNICODE _UNICODE NOMINMAX OEMRESOURCE # _USE_64BIT_TIME_T
	_CRT_NONSTDC_NO_DEPRECATE _CRT_SECURE_NO_WARNINGS _SILENCE_CXX17_CODECVT_HEADER_DEPRECATION_WARNING
)

target_link_options(${t} PRIVATE /LTCG)
target_link_libraries(${t} PRIVATE
	eha
	libscintilla liblexilla
	comctl32 crypt32 dbghelp dwmapi imm32 sensapi shlwapi uxtheme version wininet wintrust
)

# ## target_include_directories
set(_include_dirs1
	${PowerEditor_path}/src/

	${PowerEditor_path}/src/json/
	${PowerEditor_path}/src/TinyXml/
	${PowerEditor_path}/src/TinyXml/tinyXmlA/

	${PowerEditor_path}/src/uchardet/
	${PowerEditor_path}/src/Win32Explr/

	${PowerEditor_path}/src/ScintillaComponent/
	${PowerEditor_path}/src/MISC/
	${PowerEditor_path}/src/WinControls/
)
set(_include_dirs2 "")
file(GLOB_RECURSE _xs1 LIST_DIRECTORIES true ${PowerEditor_path}/src/MISC/*)
file(GLOB_RECURSE _xs2 LIST_DIRECTORIES true ${PowerEditor_path}/src/WinControls/*)
set(_xs ${_xs1} ${_xs2})
foreach(x ${_xs})
	if(IS_DIRECTORY ${x})
		list(APPEND _include_dirs2 ${x})
	endif()
endforeach()
target_include_directories(${t} PRIVATE ${_include_dirs1} ${_include_dirs2})

# ## target_sources
file(GLOB_RECURSE rc_files CONFIGURE_DEPENDS ${PowerEditor_path}/src/*.rc)
list(FILTER rc_files EXCLUDE REGEX "build")

file(GLOB_RECURSE cpp_files CONFIGURE_DEPENDS ${PowerEditor_path}/src/*.cpp)
list(FILTER cpp_files EXCLUDE REGEX "build|Win32Exception")

target_sources(${t} PRIVATE
	${rc_files} ${cpp_files}
	${PowerEditor_path}/src/dpiAware.manifest
	${PowerEditor_path}/src/notepad++.exe.manifest
)

# list(JOIN cpp_files "\n" _ssout)
# cmake_print_variables(_ssout)
