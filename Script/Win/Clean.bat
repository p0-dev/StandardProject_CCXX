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
:: NAME             | Clean.bat
:: --------------------------------------------------------------------------------------
:: DESCRIPTION      | - Remove all contents inside Root/Build directory
::                  | - Remove all contents inside Root/Diagram directory
::                  | - Remove all contents inside Root/Install directory
:: --------------------------------------------------------------------------------------


:: ======================================================================================
:: CONFIGURATIONS
:: ======================================================================================
@echo off
echo -- [BATCH_INFO] CLEANING PROJECT RESULT FILES ... 


:: ======================================================================================
:: CONSTANTS / MACROS
:: ======================================================================================
set "USERCFG_FILE=UserConfig.cfg"
set "PROJECTCFG_FILE=ProjectConfig.cfg"


:: ======================================================================================
:: NAVIGATION -> ROOT
:: ======================================================================================
cd ../../
echo -- [BATCH_INFO] Navigating to %cd%


:: ======================================================================================
:: PROCESSING CFG FILES
:: ======================================================================================

:: Constrain - Required - USERCFG_FILE
if not exist %USERCFG_FILE% (
    echo -- [FATAL_ERROR] Cannot find %cd%\%USERCFG_FILE%
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%USERCFG_FILE%
)

:: Constrain - Required - PROJECTCFG_FILE
if not exist %PROJECTCFG_FILE% (
    echo -- [FATAL_ERROR] Cannot find %cd%\%PROJECTCFG_FILE%
    exit
) else (
    echo -- [BATCH_INFO] Found %cd%\%PROJECTCFG_FILE%
)

:: Process
for /f "tokens=1,2 delims==" %%a in ('type "%PROJECTCFG_FILE%" ^| findstr /r /v /c:"#.*"') do (
    :: DEFAULT_BUILD_DIR
    if "%%a" == "DEFAULT_BUILD_DIR" set "DEFAULT_BUILD_DIR=%%b"
    :: DEFAULT_DIAGRAM_DIR
    if "%%a" == "DEFAULT_DIAGRAM_DIR" set "DEFAULT_DIAGRAM_DIR=%%b"
    :: DEFAULT_INSTALL_DIR
    if "%%a" == "DEFAULT_INSTALL_DIR" set "DEFAULT_INSTALL_DIR=%%b"
)

:: Constrain - Checking parameters
if "" == "%DEFAULT_BUILD_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_BUILD_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
)
if "" == "%DEFAULT_DIAGRAM_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_DIAGRAM_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
)
if "" == "%DEFAULT_INSTALL_DIR%" (
    echo -- [FATAL_ERROR] DEFAULT_INSTALL_DIR "(%PROJECTCFG_FILE%)" is not set
    exit
)

:: Debug - Parameters
echo -- [BATCH_INFO] DEFAULT_BUILD_DIR: %DEFAULT_BUILD_DIR%
echo -- [BATCH_INFO] DEFAULT_DIAGRAM_DIR: %DEFAULT_DIAGRAM_DIR%
echo -- [BATCH_INFO] DEFAULT_INSTALL_DIR: %DEFAULT_INSTALL_DIR%


:: ======================================================================================
:: CLEANING
:: ======================================================================================

:: Cleaning: DEFAULT_BUILD_DIR
if exist %DEFAULT_BUILD_DIR% (
    rmdir /s /q %DEFAULT_BUILD_DIR%
    echo -- [BATCH_INFO] Cleaned directory %DEFAULT_BUILD_DIR%
)
:: Cleaning: DEFAULT_DIAGRAM_DIR
if exist %DEFAULT_DIAGRAM_DIR% (
    rmdir /s /q %DEFAULT_DIAGRAM_DIR%
    echo -- [BATCH_INFO] Cleaned directory %DEFAULT_DIAGRAM_DIR%
)

:: Cleaning: DEFAULT_INSTALL_DIR
if exist %DEFAULT_INSTALL_DIR% (
    rmdir /s /q %DEFAULT_INSTALL_DIR%
    echo -- [BATCH_INFO] Cleaned directory %DEFAULT_INSTALL_DIR%
)

:: Create: required directory
mkdir %DEFAULT_BUILD_DIR%
mkdir %DEFAULT_DIAGRAM_DIR%
mkdir %DEFAULT_INSTALL_DIR%