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
:: CONFIGURATIONS
:: ======================================================================================
@echo off
echo -- [BATCH_INFO] BUILDING THE PROJECT ... 


:: ======================================================================================
:: CONSTANTS / MACROS
:: ======================================================================================
set "USERCFG_FILE=UserConfig.cfg"
set "PROJECTCFG_FILE=ProjectConfig.cfg"
set "BUILD_DEBUG=Debug"
set "BUILD_RELEASE=Release"


:: ======================================================================================
:: NAVIGATION -> ROOT
:: ======================================================================================
cd ../../
echo -- [BATCH_INFO] Navigating to %cd%


:: ======================================================================================
:: PROCESSING USER CONFIGURATION FILE
:: ======================================================================================

:: Constrain - Required - USERCFG_FILE
if not exist %USERCFG_FILE% (
    echo -- [FATAL_ERROR] Cannot find %cd%\%USERCFG_FILE%
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%USERCFG_FILE%
)

:: Process PROJECTCFG_FILE
for /f "tokens=1,2 delims==" %%a in ('type "%PROJECTCFG_FILE%" ^| findstr /r /v /c:"#.*"') do (
    :: DEFAULT_BUILD_DIR
    if "%%a" == "DEFAULT_BUILD_DIR" set "DEFAULT_BUILD_DIR=%%b"
    :: DEFAULT_DIAGRAM_DIR
    if "%%a" == "DEFAULT_DIAGRAM_DIR" set "DEFAULT_DIAGRAM_DIR=%%b"
    :: DEFAULT_INSTALL_DIR
    if "%%a" == "DEFAULT_INSTALL_DIR" set "DEFAULT_INSTALL_DIR=%%b"
    :: DEFAULT_TOOLCHAIN_DIR
    if "%%a" == "DEFAULT_TOOLCHAIN_DIR" set "DEFAULT_TOOLCHAIN_DIR=%%b"
    :: DEFAULT_INSTALL_BINARY_DIR
    if "%%a" == "DEFAULT_INSTALL_BINARY_DIR" set "DEFAULT_INSTALL_BINARY_DIR=%%b"
    :: DEFAULT_INSTALL_LIBRARY_DIR
    if "%%a" == "DEFAULT_INSTALL_LIBRARY_DIR" set "DEFAULT_INSTALL_LIBRARY_DIR=%%b"
    :: DEFAULT_INSTALL_INCLUDE_DIR
    if "%%a" == "DEFAULT_INSTALL_INCLUDE_DIR" set "DEFAULT_INSTALL_INCLUDE_DIR=%%b"
)

:: Constrain - DEFAULT_BUILD_DIR
if "" == "%DEFAULT_BUILD_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_BUILD_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] DEFAULT_BUILD_DIR: %DEFAULT_BUILD_DIR%
)

if not exist %DEFAULT_BUILD_DIR% (
    echo -- [FATAL_ERROR] Directory %DEFAULT_BUILD_DIR% is not existed
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%DEFAULT_BUILD_DIR%
)

:: Constrain - DEFAULT_DIAGRAM_DIR
if "" == "%DEFAULT_DIAGRAM_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_DIAGRAM_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] DEFAULT_DIAGRAM_DIR: %DEFAULT_DIAGRAM_DIR%
)

if not exist %DEFAULT_DIAGRAM_DIR% (
    echo -- [FATAL_ERROR] Directory %DEFAULT_DIAGRAM_DIR% is not existed
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%DEFAULT_DIAGRAM_DIR%
)

:: Constrain - DEFAULT_INSTALL_DIR
if "" == "%DEFAULT_INSTALL_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_INSTALL_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] DEFAULT_INSTALL_DIR: %DEFAULT_INSTALL_DIR%
)

if not exist %DEFAULT_INSTALL_DIR% (
    echo -- [FATAL_ERROR] DEFAULT_INSTALL_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%DEFAULT_INSTALL_DIR%
)

:: Constrain - DEFAULT_TOOLCHAIN_DIR
if "" == "%DEFAULT_TOOLCHAIN_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_TOOLCHAIN_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] DEFAULT_TOOLCHAIN_DIR: %DEFAULT_TOOLCHAIN_DIR%
)

if not exist %DEFAULT_TOOLCHAIN_DIR% (
    echo -- [FATAL_ERROR] DEFAULT_TOOLCHAIN_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%DEFAULT_TOOLCHAIN_DIR%
)

:: Constrain - DEFAULT_INSTALL_BINARY_DIR
if "" == "%DEFAULT_INSTALL_BINARY_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_INSTALL_BINARY_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] DEFAULT_INSTALL_BINARY_DIR: %DEFAULT_INSTALL_BINARY_DIR%
)

:: Constrain - DEFAULT_INSTALL_LIBRARY_DIR
if "" == "%DEFAULT_INSTALL_LIBRARY_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_INSTALL_LIBRARY_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] DEFAULT_INSTALL_LIBRARY_DIR: %DEFAULT_INSTALL_LIBRARY_DIR%
)

:: Constrain - DEFAULT_INSTALL_INCLUDE_DIR
if "" == "%DEFAULT_INSTALL_INCLUDE_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_INSTALL_INCLUDE_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] DEFAULT_INSTALL_INCLUDE_DIR: %DEFAULT_INSTALL_INCLUDE_DIR%
)


:: ======================================================================================
:: PROCESSING PROJECT CONFIGURATION FILE
:: ======================================================================================

:: Constrain - Required - PROJECTCFG_FILE
if not exist %PROJECTCFG_FILE% (
    echo -- [FATAL_ERROR] Cannot find %cd%\%PROJECTCFG_FILE%
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%PROJECTCFG_FILE%
)

:: Process USERCFG_FILE
for /f "tokens=1,2 delims==" %%a in ('type "%USERCFG_FILE%" ^| findstr /r /v /c:"#.*"') do (
    :: USERCFG_TOOLCHAIN_CMAKE_FILE
    if "%%a" == "USERCFG_TOOLCHAIN_CMAKE_FILE" set "USERCFG_TOOLCHAIN_CMAKE_FILE=%%b"
    :: USERCFG_PROJECT_NAME
    if "%%a" == "USERCFG_PROJECT_NAME" set "USERCFG_PROJECT_NAME=%%b"
    :: USERCFG_BUILD_CONFIGURATION
    if "%%a" == "USERCFG_BUILD_CONFIGURATION" set "USERCFG_BUILD_CONFIGURATION=%%b"
    :: USERCFG_TOOLCHAIN_BUILD_TOOL
    if "%%a" == "USERCFG_TOOLCHAIN_BUILD_TOOL" set "USERCFG_TOOLCHAIN_BUILD_TOOL=%%b"
)

:: Constrain - USERCFG_TOOLCHAIN_CMAKE_FILE
if "" == "%USERCFG_TOOLCHAIN_CMAKE_FILE%" (
    echo -- [FATAL_ERROR] USERCFG_TOOLCHAIN_CMAKE_FILE "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] USERCFG_TOOLCHAIN_CMAKE_FILE: %USERCFG_TOOLCHAIN_CMAKE_FILE%
)

set "USERCFG_TOOLCHAIN_CMAKE_FILE_PATH=%DEFAULT_TOOLCHAIN_DIR%\%USERCFG_TOOLCHAIN_CMAKE_FILE%"
if not exist %DEFAULT_TOOLCHAIN_DIR%\%USERCFG_TOOLCHAIN_CMAKE_FILE% (
    echo -- [FATAL_ERROR] Cannot find %cd%\%USERCFG_TOOLCHAIN_CMAKE_FILE_PATH%
) else (
    echo -- [BATCH_INFO] Found %cd%\%USERCFG_TOOLCHAIN_CMAKE_FILE_PATH%
)

:: Constrain - USERCFG_PROJECT_NAME
if "" == "%USERCFG_PROJECT_NAME%" (
    echo -- [FATAL_ERROR] USERCFG_PROJECT_NAME "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] USERCFG_PROJECT_NAME: %USERCFG_PROJECT_NAME%
)

:: Constrain - USERCFG_BUILD_CONFIGURATION
if "" == "%USERCFG_BUILD_CONFIGURATION%" (
    echo -- [FATAL_ERROR] USERCFG_BUILD_CONFIGURATION "(%PROJECTCFG_FILE%)" is not set
    exit
)

if not "%BUILD_DEBUG%" == "%USERCFG_BUILD_CONFIGURATION%" (
    if not "%BUILD_RELEASE%" == "%USERCFG_BUILD_CONFIGURATION%" ( 
        echo -- [FATAL_ERROR] USERCFG_BUILD_CONFIGURATION "(%PROJECTCFG_FILE%)" is incorrected
        exit
    ) else (
        echo -- [BATCH_INFO] USERCFG_BUILD_CONFIGURATION: %USERCFG_BUILD_CONFIGURATION%
    )
) else (
    echo -- [BATCH_INFO] USERCFG_BUILD_CONFIGURATION: %USERCFG_BUILD_CONFIGURATION%
)

:: Constrain - USERCFG_TOOLCHAIN_BUILD_TOOL
if "" == "%USERCFG_TOOLCHAIN_BUILD_TOOL%" (
    echo -- [FATAL_ERROR] USERCFG_TOOLCHAIN_BUILD_TOOL "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] USERCFG_TOOLCHAIN_BUILD_TOOL: %USERCFG_TOOLCHAIN_BUILD_TOOL%
)


:: ======================================================================================
:: GENERATING PROCESS WITH CMAKE
:: ======================================================================================
set "GEN_ARGS=-S ."
set "GEN_ARGS=%GEN_ARGS% -B %DEFAULT_BUILD_DIR%"
set "GEN_ARGS=%GEN_ARGS% -G %USERCFG_TOOLCHAIN_BUILD_TOOL%"
set "GEN_ARGS=%GEN_ARGS% -D CMAKE_BUILD_TYPE=%USERCFG_BUILD_CONFIGURATION%"
set "GEN_ARGS=%GEN_ARGS% -D PROJECT_NAME=%USERCFG_PROJECT_NAME%"
set "GEN_ARGS=%GEN_ARGS% -D DEFAULT_INSTALL_BINARY_DIR=%DEFAULT_INSTALL_BINARY_DIR%"
set "GEN_ARGS=%GEN_ARGS% -D DEFAULT_INSTALL_LIBRARY_DIR=%DEFAULT_INSTALL_LIBRARY_DIR%"
set "GEN_ARGS=%GEN_ARGS% -D DEFAULT_INSTALL_INCLUDE_DIR=%DEFAULT_INSTALL_INCLUDE_DIR%"
set "GEN_ARGS=%GEN_ARGS% --toolchain %USERCFG_TOOLCHAIN_CMAKE_FILE_PATH%"
set "GEN_ARGS=%GEN_ARGS% --graphviz=%DEFAULT_DIAGRAM_DIR%/%USERCFG_PROJECT_NAME%_dia.dot"
set "GEN_ARGS=%GEN_ARGS% -Wdev"
set "GEN_ARGS=%GEN_ARGS% -Werror=dev"
set "GEN_ARGS=%GEN_ARGS% -Wdeprecated"
set "GEN_ARGS=%GEN_ARGS% -Werror=deprecated"
set "GEN_ARGS=%GEN_ARGS% --fresh"

echo -- [BATCH_INFO] CMake Generation Flags: %GEN_ARGS%

cmake %GEN_ARGS%