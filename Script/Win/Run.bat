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
:: CONSTANTS
:: ======================================================================================
set "BUILD_DEBUG=Debug"
set "BUILD_RELEASE=Release"
set "INSTALL_DIR=Install"
set "USERCFG_FILE=UserConfig.cfg"
set "EXE_FILE_URI=Bin\StandardProject_exe.exe"


:: ======================================================================================
:: CONFIGURATIONS
:: ======================================================================================
@echo off
setlocal enabledelayedexpansion
echo "-- [INFO] RUNNING THE PROJECT RESULT FILES ... "


:: ======================================================================================
:: NAVIGATION -> ROOT
:: ======================================================================================
cd ../../
:: echo "-- [INFO] Navigating to %cd%"


:: ======================================================================================
:: PROCESSING USER CONFIGURATION FILE
:: ======================================================================================
echo "-- [INFO] Processing Use"

:: Checking the availability of USERCFG_FILE
if not exist %USERCFG_FILE% (
    echo "-- [FATAL_ERROR] Cannot found %cd%\%USERCFG_FILE%"
    echo "-- [FATAL_ERROR] Process terminated."
    exit
)

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
)

:: Checking validity of BUILD_CONFIGURATION
if "%BUILD_CONFIGURATION%" == "%BUILD_DEBUG%" (
    echo "-- [INFO] BUILD_CONFIGURATION: %BUILD_CONFIGURATION%"
) else (
    if "%BUILD_CONFIGURATION%" == "%BUILD_RELEASE%" (
        echo "-- [INFO] BUILD_CONFIGURATION: %BUILD_CONFIGURATION%"
    ) else (
        echo "-- [FATAL_ERROR] BUILD_CONFIGURATION is not %BUILD_DEBUG% nor %BUILD_RELEASE%"
        echo "-- [FATAL ERROR] PROCESS TERMINATED!"
        exit
    )
)


:: ======================================================================================
:: RUNNING
:: ======================================================================================
echo "-- [RUNNING] ... "
echo --
echo --
echo --

%cd%\%INSTALL_DIR%\%BUILD_CONFIGURATION%\%EXE_FILE_URI%

echo --
echo --
echo --
echo "-- [END] ... "
