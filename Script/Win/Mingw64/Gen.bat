

:: --------------------------------------------------------------------------------------
:: COPY RIGHT / LEFT
:: --------------------------------------------------------------------------------------
:: (C) 2024 Hardware And Software Solution (HASS)
:: (C) 2024 Thanh Tran / Nhuan Tran
:: (C) 2024 Khai Tran / Vy Tran
::
:: Confidential Proprietary Information. Distribution Limited.
::
:: This source code is permitted to be used only in projects contracted
:: with HASS and Thanh Tran/Khai Tran/Vy Tran, and any other use is prohibited.
:: If you use it for other purposes or change the source code,
:: you may take legal responsibility and
:: 
:: FUCK YOU!.
:: 
:: In this case, there is no warranty and technical support.
:: --------------------------------------------------------------------------------------


:: ======================================================================================
:: INTENTIONAL LEAVE BLANK
:: ======================================================================================


:: --------------------------------------------------------------------------------------
:: FILE INFORMATION
:: --------------------------------------------------------------------------------------
:: NAME             | Gen.bat
:: --------------------------------------------------------------------------------------
:: DESCRIPTION      | Generating Makefile or Ninja.build from CMake's script
:: --------------------------------------------------------------------------------------


:: ======================================================================================
:: CONSTANTS
:: ======================================================================================
set PROJECT_ROOT="E:\Workspace\StandardProject"
set DIAGRAM_DOT="Diagram\Overview.dot"
set DIAGRAM_JPG="Diagram\Overview.jpg"
set BUILD_DEBUG="Debug"
set BUILD_RELEASE="Release"


:: ======================================================================================
:: CONTRAINS
:: ======================================================================================
echo "[INFO] Available CMAKE_BUILD_TYPE: Debug / Release"

:: ======================================================================================
:: NAVIGATION -> ROOT DIRECTORY
:: ======================================================================================
cd %PROJECT_ROOT%


:: ======================================================================================
:: GENERATION PROCESS
:: ======================================================================================
set "args=-S ."
set "args=%args% -B Build"
set "args=%args% -G Ninja"
set "args=%args% --toolchain Toolchain/Mingw64.cmake"
set "args=%args% -Wdev"
set "args=%args% -Werror=dev"
set "args=%args% --fresh"
set "args=%args% --graphviz=Diagram/Overview.dot"
set "args=%args% --check-system-vars"

if NOT "%~1" == "" (
    set "args=%args% -D CMAKE_BUILD_TYPE=%~1"
)

cmake %args%


:: ======================================================================================
:: CONVERT DIAGRAM -> JPG
:: ======================================================================================
dot -Tjpg %DIAGRAM_DOT% -o %DIAGRAM_JPG%