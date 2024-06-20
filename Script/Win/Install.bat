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
echo -- [BATCH_INFO] INSTALLING THE PROJECT ...
echo -- [BATCH_INFO] --------------------------
cd ../../
echo -- [BATCH_INFO] Navigating to %cd%
echo.


:: ======================================================================================
:: CONSTANTS / MACROS
:: ======================================================================================
set "USERCFG_FILE=UserConfig.cfg"
set "PROJECTCFG_FILE=ProjectConfig.cfg"
set "BUILD_DEBUG=Debug"
set "BUILD_RELEASE=Release"


:: ======================================================================================
:: PROCESSING PROJECT CONFIGURATION FILE
:: ======================================================================================
echo -- [BATCH_INFO] Processing PROJECTCFG_FILE
echo -- [BATCH_INFO] --------------------------

:: Constrain - Required - PROJECTCFG_FILE
if not exist %PROJECTCFG_FILE% (
    echo -- [FATAL_ERROR] Cannot find %cd%\%PROJECTCFG_FILE%
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%PROJECTCFG_FILE%
)

:: Process PROJECTCFG_FILE
for /f "tokens=1,2 delims==" %%a in ('type "%PROJECTCFG_FILE%" ^| findstr /r /v /c:"#.*"') do (
    :: DEFAULT_BUILD_DIR
    if "%%a" == "DEFAULT_BUILD_DIR" set "DEFAULT_BUILD_DIR=%%b"
)

:: Constrain - DEFAULT_BUILD_DIR parameter
if "" == "%DEFAULT_BUILD_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_BUILD_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] DEFAULT_BUILD_DIR: %DEFAULT_BUILD_DIR%
)

:: Constrain - DEFAULT_BUILD_DIR exist
if not exist %DEFAULT_BUILD_DIR% (
    echo -- [FATAL_ERROR] Directory %DEFAULT_BUILD_DIR% is not existed
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%DEFAULT_BUILD_DIR%
)

echo.


:: ======================================================================================
:: PROCESSING USER CONFIGURATION FILE
:: ======================================================================================
echo -- [BATCH_INFO] Processing USERCFG_FILE
echo -- [BATCH_INFO] -----------------------

:: Constrain - Required - USERCFG_FILE
if not exist %USERCFG_FILE% (
    echo -- [FATAL_ERROR] Cannot find %cd%\%USERCFG_FILE%
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%USERCFG_FILE%
)

:: Process USERCFG_FILE
for /f "tokens=1,2 delims==" %%a in ('type "%USERCFG_FILE%" ^| findstr /r /v /c:"#.*"') do (
    :: USERCFG_INSTALL_DIR
    if "%%a" == "USERCFG_INSTALL_DIR" set "USERCFG_INSTALL_DIR=%%b"
)

:: Constrain - USERCFG_INSTALL_DIR parameter
if "" == "%USERCFG_INSTALL_DIR%" (
    echo -- [FATAL_ERROR] USERCFG_INSTALL_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
) else (
    echo -- [BATCH_INFO] USERCFG_INSTALL_DIR: %USERCFG_INSTALL_DIR%
)

:: Constrain - USERCFG_INSTALL_DIR exist
if not exist %USERCFG_INSTALL_DIR% (
    echo -- [FATAL_ERROR] Directory for installation: %USERCFG_INSTALL_DIR% is not existed
    exit
) else (
    echo -- [BATCH_INFO] Found %USERCFG_INSTALL_DIR%
)

echo.


:: ======================================================================================
:: INSTALLATION PROCESS
:: ======================================================================================
echo -- [BATCH_INFO] Invoking CMake's installation ...
echo -- [BATCH_INFO] ---------------------------------

set "DINS_ARGS=--install %DEFAULT_BUILD_DIR%"
set "DINS_ARGS=%DINS_ARGS% --prefix %USERCFG_INSTALL_DIR%"
set "DINS_ARGS=%DINS_ARGS% --verbose"
set "DINS_ARGS=%DINS_ARGS% --strip"

echo -- [BATCH_INFO] Default Installation Args: %DINS_ARGS%

cmake %DINS_ARGS%

echo.