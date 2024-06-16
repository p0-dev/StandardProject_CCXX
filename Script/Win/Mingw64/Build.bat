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
:: NAME             | Build.bat
:: --------------------------------------------------------------------------------------
:: DESCRIPTION      | Building the project
:: --------------------------------------------------------------------------------------


:: ======================================================================================
:: CONSTANTS
:: ======================================================================================
set "PROJECT_ROOT=E:\Workspace\StandardProject"
set "BUILD_DIR=Build"

:: ======================================================================================
:: NAVIGATION -> ROOT DIRECTORY
:: ======================================================================================
cd %PROJECT_ROOT%


:: ======================================================================================
:: BUILDING PROCESS
:: ======================================================================================
set "args=--build %BUILD_DIR%"
set "args=%args% --parallel"
set "args=%args% --clean-first"
set "args=%args% --verbose"

cmake %args%