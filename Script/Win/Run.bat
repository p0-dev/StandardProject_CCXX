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
:: NAME             | Run.bat
:: --------------------------------------------------------------------------------------
:: DESCRIPTION      | Running the project, if there is an execution file from build 
::                  | process
:: --------------------------------------------------------------------------------------


:: ======================================================================================
:: REVISION TABLE
:: ======================================================================================
:: VERSION | DATE       | BY            | DESCRIPTION
:: --------------------------------------------------------------------------------------
:: 0.0.0.1 | 16.06.2024 | Thanh Tran    | Initialization
:: --------------------------------------------------------------------------------------


:: ======================================================================================
:: CONSTANTS
:: ======================================================================================
set "BUILD_DEBUG=Debug"
set "BUILD_RELEASE=Release"
set "USERCFG_FILE=UserConfig.cfg"
set "PROJECTCFG_FILE=ProjectConfig.cfg"


:: ======================================================================================
:: CONFIGURATIONS
:: ======================================================================================
@echo off
echo -- [BATCH_INFO] Running the project 
echo -- [BATCH_INFO] -------------------


:: ======================================================================================
:: NAVIGATION -> ROOT
:: ======================================================================================
cd ../../
echo -- [BATCH_INFO] Navigating to %cd%


:: ======================================================================================
:: PROCESSING USER CONFIGURATION FILE
:: ======================================================================================
echo -- [BATCH_INFO] Processing USERCFG_FILE for USERCFG_BUILD_CONFIGURATION

:: Checking the availability of USERCFG_FILE
if not exist %USERCFG_FILE% (
    echo -- [FATAL_ERROR] Cannot find %cd%\%USERCFG_FILE%
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%USERCFG_FILE%
)

:: Process
for /f "tokens=1,2 delims==" %%a in ('type "%USERCFG_FILE%" ^| findstr /r /v /c:"#.*"') do (
    :: USERCFG_BUILD_CONFIGURATION
    if "%%a" == "USERCFG_BUILD_CONFIGURATION" set "USERCFG_BUILD_CONFIGURATION=%%b"
    :: USERCFG_PROJECT_NAME
    if "%%a" == "USERCFG_PROJECT_NAME" set "USERCFG_PROJECT_NAME=%%b"
)

:: Constrain - USERCFG_BUILD_CONFIGURATION parameter
if "" == "%USERCFG_BUILD_CONFIGURATION%" (
    echo -- [FATAL_ERROR] USERCFG_BUILD_CONFIGURATION "(%PROJECTCFG_FILE%)" is not set
    exit
)

:: Constrain - USERCFG_BUILD_CONFIGURATION validity
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

:: Constrain - USERCFG_PROJECT_NAME parameter
if "" == "%USERCFG_PROJECT_NAME%" (
    echo -- [FATAL_ERROR] USERCFG_PROJECT_NAME "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] USERCFG_PROJECT_NAME: %USERCFG_PROJECT_NAME%
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

:: Process PROJECTCFG_FILE
for /f "tokens=1,2 delims==" %%a in ('type "%PROJECTCFG_FILE%" ^| findstr /r /v /c:"#.*"') do (
    :: DEFAULT_INSTALL_DIR
    if "%%a" == "DEFAULT_INSTALL_DIR" set "DEFAULT_INSTALL_DIR=%%b"
    :: DEFAULT_INSTALL_BINARY_DIR
    if "%%a" == "DEFAULT_INSTALL_BINARY_DIR" set "DEFAULT_INSTALL_BINARY_DIR=%%b"
)

:: Constrain - DEFAULT_INSTALL_DIR parameter
if "" == "%DEFAULT_INSTALL_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_INSTALL_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] DEFAULT_INSTALL_DIR: %DEFAULT_INSTALL_DIR%
)

:: Constrain - DEFAULT_INSTALL_DIR exist
if not exist %DEFAULT_INSTALL_DIR% (
    echo -- [FATAL_ERROR] Directory %DEFAULT_INSTALL_DIR% is not existed
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%DEFAULT_INSTALL_DIR%
)

:: Constrain - DEFAULT_INSTALL_BINARY_DIR parameter
if "" == "%DEFAULT_INSTALL_BINARY_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_INSTALL_BINARY_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] DEFAULT_INSTALL_BINARY_DIR: %DEFAULT_INSTALL_BINARY_DIR%
)

:: Constrain - DEFAULT_INSTALL_BINARY_DIR exist
if not exist %DEFAULT_INSTALL_DIR%\%USERCFG_BUILD_CONFIGURATION%\%DEFAULT_INSTALL_BINARY_DIR% (
    echo -- [FATAL_ERROR] Directory %DEFAULT_INSTALL_DIR%\%USERCFG_BUILD_CONFIGURATION%\%DEFAULT_INSTALL_BINARY_DIR% is not existed
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%DEFAULT_INSTALL_DIR%\%USERCFG_BUILD_CONFIGURATION%\%DEFAULT_INSTALL_BINARY_DIR%
)

echo.
echo.
echo.


:: ======================================================================================
:: RUNNING
:: ======================================================================================
echo -- [EXECUTION] --
echo.

%cd%\%DEFAULT_INSTALL_DIR%\%USERCFG_BUILD_CONFIGURATION%\%DEFAULT_INSTALL_BINARY_DIR%\%USERCFG_PROJECT_NAME%_exe

echo.
echo -- [END] --
