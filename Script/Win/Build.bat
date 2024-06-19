:: ======================================================================================
:: COPY RIGHT / LEFT
:: ======================================================================================
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
:: FILE INFORMATION
:: ======================================================================================
:: NAME             | Build.bat
:: --------------------------------------------------------------------------------------
:: DESCRIPTION      | Building the project with specified configuration of CMake's script
:: --------------------------------------------------------------------------------------


:: ======================================================================================
:: REVISION TABLE
:: ======================================================================================
:: VERSION | DATE       | BY            | DESCRIPTION
:: --------------------------------------------------------------------------------------
:: 0.0.0.1 | 16.06.2024 | Thanh Tran    | Initialization
:: --------------------------------------------------------------------------------------


:: ======================================================================================
:: BATCH SCRIPT CONFIGURATION
:: ======================================================================================
@echo off
setlocal enabledelayedexpansion
echo "-- [INFO] BUILDING THE PROJECT ... "


:: ======================================================================================
:: BATCH SCRIPT CONSTANTS / MACROS
:: ======================================================================================
set "CMAKE_LIST_FILE=CMakeLists.txt"
set "USERCFG_FILE=UserConfig.cfg"
set "BUILD_DEBUG=Debug"
set "BUILD_RELEASE=Release"
set "BUILD_DIR=Build"
set "BUILD_TOOL=Ninja"
set "DIAGRAM_FILE=Overview.dot"
set "DIAGRAM_FILE_URI=Diagram\Overview.dot"


:: ======================================================================================
:: NAVIGATION -> ROOT
:: ======================================================================================
cd ../../
echo "-- [INFO] Navigating to %cd%"


:: ======================================================================================
:: CONSTRAINS
:: ======================================================================================
:: Constrain 1 - Required - Checking for the root CMakeLists.txt
if not exist %CMAKE_LIST_FILE% (
    echo "-- [FATAL ERROR] Cannot found main CMakeLists.txt at project root!"
    echo "-- [FATAL ERROR] PROCESS TERMINATED!"
    exit
) else (
    echo "-- [INFO] Found %cd%\%CMAKE_LIST_FILE%"
)

:: Constrain 2 - Required - Checking for the root UserConfig.cfg
if not exist %USERCFG_FILE% (
    echo "-- [FATAL ERROR] Cannot found main UserConfig.cfg at project root!"
    echo "-- [FATAL ERROR] PROCESS TERMINATED!"
    exit
) else (
    echo "-- [INFO] Found %cd%\%USERCFG_FILE%"
)


:: ======================================================================================
:: PROCESSING USER CONFIG
:: ======================================================================================
echo "-- [INFO] Processing UserConfig.cfg ... "

:: Process
for /f "tokens=1,2 delims==" %%a in ('type "%USERCFG_FILE%" ^| findstr /r /v /c:"#.*"') do (
    set "key=%%a"
    set "value=%%b"
    
    rem Remove spaces from the key
    set "key=!key: =!"
    
    rem Remove spaces from the value
    set "value=!value: =!"
    
    rem Store the key-value pairs in local variables
    if "!key!" == "BUILD_CONFIGURATION" set "BUILD_CONFIGURATION=!value!"
    if "!key!" == "TOOLCHAIN_CMAKE_FILE" set "TOOLCHAIN_CMAKE_FILE=!value!"
)

:: Debug
:: echo "-- [INFO] BUILD_CONFIGURATION: %BUILD_CONFIGURATION%"
echo "-- [INFO] TOOLCHAIN_CMAKE_FILE: %TOOLCHAIN_CMAKE_FILE%"

:: Constrain - Build Configuration
if "%BUILD_CONFIGURATION%" == "%BUILD_DEBUG%" (
    echo "-- [INFO] BUILD_CONFIGURATION: %BUILD_CONFIGURATION%"
) else (
    if "%BUILD_CONFIGURATION%" == "%BUILD_RELEASE%" (
        echo "-- [INFO] BUILD_CONFIGURATION: %BUILD_CONFIGURATION%"
    ) else (
        echo "-- [FATAL_ERROR] BUILD_CONFIGURATION is not %BUILD_DEBUG% nor %BUILD_RELEASE%"
    )
)

:: Constrain - Toolchain Cmake File availability
if not exist %cd%\%TOOLCHAIN_CMAKE_FILE% (
    echo "-- [FATAL_ERROR] PROCESS TERMINATED!"
    echo "-- [FATAL_ERROR] %TOOLCHAIN_CMAKE_FILE% does not existed."
    exit
) else (
    echo "-- [INFO] Found %cd%\%TOOLCHAIN_CMAKE_FILE%"
)


:: ======================================================================================
:: GENERATING PROCESS WITH CMAKE
:: ======================================================================================
set "GEN_ARGS=-S ."
set "GEN_ARGS=%GEN_ARGS% -B %BUILD_DIR%"
set "GEN_ARGS=%GEN_ARGS% -G %BUILD_TOOL%"
set "GEN_ARGS=%GEN_ARGS% --toolchain %TOOLCHAIN_CMAKE_FILE%"
set "GEN_ARGS=%GEN_ARGS% -Wdev"
set "GEN_ARGS=%GEN_ARGS% -Werror=dev"
set "GEN_ARGS=%GEN_ARGS% -Wdeprecated"
set "GEN_ARGS=%GEN_ARGS% -Werror=deprecated"
set "GEN_ARGS=%GEN_ARGS% --fresh"
set "GEN_ARGS=%GEN_ARGS% --graphviz=%DIAGRAM_FILE_URI%"
set "GEN_ARGS=%GEN_ARGS% -D CMAKE_BUILD_TYPE=%BUILD_CONFIGURATION%"

cmake %GEN_ARGS%


:: ======================================================================================
:: BUILDING PROCESS WITH CMAKE
:: ======================================================================================
set "BUILD_ARGS=--build %BUILD_DIR%"
set "BUILD_ARGS=%BUILD_ARGS% --parallel"
set "BUILD_ARGS=%BUILD_ARGS% --clean-first"
set "BUILD_ARGS=%BUILD_ARGS% --verbose"

cmake %BUILD_ARGS%


:: ======================================================================================
:: CONVERT .DOT -> .JPG
:: ======================================================================================
dot -Tjpg %DIAGRAM_FILE_URI% -O