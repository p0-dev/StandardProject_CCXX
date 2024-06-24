:: ======================================================================================
:: BATCH SCRIPT CONF
:: ======================================================================================
@echo off
echo -- [CLEAN] Starting ...
cd ../
echo -- [CLEAN] Change directory to %cd%

:: ======================================================================================
:: CLEANING
:: ======================================================================================
echo -- [CLEAN] Directory: build\
if exist build\ (
    rmdir /s /q build\
)

echo -- [CLEAN] Directory: install\
if exist install\ (
    rmdir /s /q install\
)

echo -- [CLEAN] Directory: dia\
if exist dia\ (
    rmdir /s /q dia\
)

echo -- [CLEAN] Directory: Diagram\
if exist Diagram\ (
    rmdir /s /q Diagram\
)

:: ======================================================================================
:: MAKING NEW DIRECTORY
:: ======================================================================================
mkdir build\
mkdir install\
mkdir dia\
mkdir Diagram\

echo -- [CLEAN] Done
echo.