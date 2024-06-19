# =======================================================================================
# COPY RIGHT / LEFT
# =======================================================================================
# (C) 2024 Hardware And Software Solution (HASS)
# (C) 2024 Thanh Tran / Nhuan Tran
# (C) 2024 Khai Tran / Vy Tran
#
# Confidential Proprietary Information. Distribution Limited.
# 
# This source code is permitted to be used only in projects contracted
# with HASS and Thanh Tran/Nhuan Tran/Khai Tran/Vy Tran, and any other use is prohibited.
# If you use it for other purposes or change the source code,
# you may take legal responsibility and
# 
# FUCK YOU!.
# 
# In this case, there is no warranty and technical support.
# ---------------------------------------------------------------------------------------


# =======================================================================================
# FILE INFORMATION
# =======================================================================================
# NAME              | Mingw64.cmake
# ---------------------------------------------------------------------------------------
# LOCATION          | Toolchain/Mingw64.cmake
# ---------------------------------------------------------------------------------------
# CONTENT           | - Toolchain configuration
#                   | - Toolchain specification
# ---------------------------------------------------------------------------------------


# =======================================================================================
# REVISION TABLE
# =======================================================================================
# VERSION | DATE        | BY            | DESCRIPTION
# ---------------------------------------------------------------------------------------
# 0.0.0.1 | 15.06.2024  | Thanh Tran    | Initialization
# ---------------------------------------------------------------------------------------


# =======================================================================================
# USER CONFIGURATION FOR TOOLCHAIN
# =======================================================================================
set(USERCFG_C_COMPILER_EXE      "x86_64-w64-mingw32-gcc")
set(USERCFG_CXX_COMPILER_EXE    "x86_64-w64-mingw32-g++")
set(USERCFG_AR_EXE              "x86_64-w64-mingw32-gcc-ar")
set(USERCFG_OBJCOPY_EXE         "objcopy")


# =======================================================================================
# USER CONFIGURATION FOR FLAGS TO BE USED WITH COMPILER / LINKER
# =======================================================================================

# Debug - Compile
set(COMPILE_DEBUG_FLAG "")
list(APPEND COMPILE_DEBUG_FLAG " -Wall ")
list(APPEND COMPILE_DEBUG_FLAG " -D COMPILE_DEBUG_FLAG=1")

# Debug - Linking
set(LINKING_DEBUG_FLAG "")
list(APPEND LINKING_DEBUG_FLAG " -Wall")
list(APPEND LINKING_DEBUG_FLAG " -D LINKING_DEBUG_FLAG=1")

# Release - Compile
set(COMPILE_RELEASE_FLAG "")
list(APPEND COMPILE_RELEASE_FLAG " -Wall")
list(APPEND COMPILE_RELEASE_FLAG " -D COMPILE_RELEASE_FLAG=1")

# Release - Linking
set(LINKING_RELEASE_FLAG "")
list(APPEND LINKING_RELEASE_FLAG " -Wall")
list(APPEND LINKING_RELEASE_FLAG " -D LINKING_RELEASE_FLAG=1")


# =======================================================================================
# TOOLCHAIN CONFIGURATION
# =======================================================================================
# set(CMAKE_C_COMPILER_WORKS 1)                   # Skip compiler testing process
# set(CMAKE_CXX_COMPILER_WORKS 1)                 # Skip compiler testing process
