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
:: BATCH SCRIPT CONFIGURATION
:: ======================================================================================
@echo off
echo "-- [CLEANING] Cleaning results from last build process, include: "
echo "-- [CLEANING] The directory <Build>"
echo "-- [CLEANING] The directory <Diagram>"
echo "-- [CLEANING] The directory <Install>"


:: ======================================================================================
:: NAVIGATION -> ROOT DIRECTORY
:: ======================================================================================
cd ../../
echo "-- [INFO] Navigating to %cd%"


:: ======================================================================================
:: CLEANING
:: ======================================================================================
:: Cleaning directory Root/Build/
if exist Build\ (rmdir %cd%\Build /q /s)
mkdir Build\
echo "-- [CLEANING] Cleaned the directory <Build>"

:: Cleaning directory Root/Diagram/
if exist Diagram\ (rmdir %cd%\Diagram /q /s)
mkdir Diagram\
echo "-- [CLEANING] Cleaned the directory <Diagram>"

:: Cleaning directory Root/Install/
if exist Install\ (rmdir %cd%\Install /q /s)
mkdir Install\
echo "-- [CLEANING] Cleaned the directory <Install>"