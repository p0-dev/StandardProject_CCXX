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
:: NAME             | Gen.bat
:: --------------------------------------------------------------------------------------
:: DESCRIPTION      | Generating Makefile or Ninja.build from CMake's script
:: --------------------------------------------------------------------------------------


:: ======================================================================================
:: CONSTANTS
:: ======================================================================================
set "PROJECT_ROOT=E:\Workspace\StandardProject"
set "PROJECT_EXE_FILE=StandardProject_exe.exe"
set "PROJECT_EXE=%PROJECT_ROOT%\Build\Codebase\%PROJECT_EXE_FILE%"


:: ======================================================================================
:: CONSTRAINS
:: ======================================================================================
if not exist %PROJECT_EXE% (
    echo "[ERROR] %PROJECT_EXE_FILE% not found!"
    exit
)


:: ======================================================================================
:: RUNNING EXECUTION TARGET
:: ======================================================================================
%PROJECT_EXE%