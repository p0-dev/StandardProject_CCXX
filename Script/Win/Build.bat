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
:: ======================================================================================


:: ======================================================================================
:: FILE INFORMATION
:: ======================================================================================
:: NAME             | Build.bat
:: --------------------------------------------------------------------------------------
:: DESCRIPTION      | Building the project with specified configuration of CMake's script
:: ======================================================================================


:: ======================================================================================
:: REVISION TABLE
:: ======================================================================================
:: VERSION | DATE       | BY            | DESCRIPTION
:: --------------------------------------------------------------------------------------
:: 0.0.0.1 | 16.06.2024 | Thanh Tran    | Initialization
:: ======================================================================================


:: ======================================================================================
:: BATCH SCRIPT CONFIGURATION
:: ======================================================================================
@echo off
echo "-- [INFO] BUILDING THE PROJECT ... "


:: ======================================================================================
:: NAVIGATION -> ROOT
:: ======================================================================================
cd ../../
echo "-- [INFO] Navigating to %cd%"


:: ======================================================================================
:: CONSTRAINS
:: ======================================================================================
:: Constrain 1 - Required - Checking for the root CMakeLists.txt
if not exist CMakeLists.txt (
    echo "-- [FATAL ERROR] Cannot found main CMakeLists.txt at project root!"
    echo "-- [FATAL ERROR] PROCESS TERMINATED!"
    exit
)

:: Constrain 2 - Required - Checking for the root UserConfig.cfg
if not exit UserConfig.cfg (
    echo "-- [FATAL ERROR] Cannot found main UserConfig.cfg at project root!"
    echo "-- [FATAL ERROR] PROCESS TERMINATED!"
    exit
)


:: ======================================================================================
:: PROCESSING USER CONFIG
:: ======================================================================================
set "TOOLCHAIN_CMAKE_FILE="
set "BUILD_CONFIGURATION="
