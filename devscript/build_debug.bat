:: ======================================================================================
:: BATCH SCRIPT CONF
:: ======================================================================================
@echo off
echo -- [BUILD] Starting ...
call clean.bat
echo -- [BUILD] Change directory to %cd%

:: ======================================================================================
:: GENERATION
:: ======================================================================================
echo -- [BUILD] CMake generation ...
set "gen_args=-S ."
set "gen_args=%gen_args% -B build"
set "gen_args=%gen_args% -G Ninja"
set "gen_args=%gen_args% --fresh"
set "gen_args=%gen_args% --graphviz=dia/dia.dot"
set "gen_args=%gen_args% --toolchain Toolchain/Mingw64.cmake"
set "gen_args=%gen_args% -D CMAKE_BUILD_TYPE=Debug"
echo -- [BUILD] Generating parameters: %gen_args%

cmake %gen_args%

:: ======================================================================================
:: BUILDING
:: ======================================================================================
echo -- [BUILD] Ninja building ...
set "build_args=--verbose"
set "build_args=%build_args% -C build"
echo -- [BUILD] Building parameters: %build_args%

ninja %build_args%

:: ======================================================================================
:: DEFAULT INSTALL
:: ======================================================================================
echo -- [BUILD] CMake default install ...
set "ins1_args=--install build"
set "ins1_args=%ins1_args% --prefix install"
echo -- [BUILD] Install parameters: %ins1_args%

cmake %ins1_args%

:: ======================================================================================
:: RUN
:: ======================================================================================
echo -- [RESULT] --
echo.
echo.

install\bin\main

echo.
echo.
echo -- [END] --

:: ======================================================================================
:: CONVERT DIAGRAM
:: ======================================================================================
set "convert_args=-Tjpg"
set "convert_args=%convert_args% dia/dia.dot"
set "convert_args=%convert_args% -o Diagram/DependancyOverview.jpg"

dot %convert_args%