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
# =======================================================================================


# =======================================================================================
# FILE INFORMATION
# =======================================================================================
# NAME              | Template.cmake
# ---------------------------------------------------------------------------------------
# LOCATION          | Toolchain/Template.cmake
# ---------------------------------------------------------------------------------------
# CONTENT           | - Toolchain configuration
#                   | - Toolchain specification
# =======================================================================================


# =======================================================================================
# REVISION TABLE
# =======================================================================================
# VERSION | DATE        | BY            | DESCRIPTION
# ---------------------------------------------------------------------------------------
# 0.0.0.1 | 15.06.2024  | Thanh Tran    | Initialization
# =======================================================================================


# =======================================================================================
# USER CONFIGURATION FOR TOOLCHAIN
# =======================================================================================
set(USERCFG_C_COMPILER_EXE      <User_Defined>)
set(USERCFG_CXX_COMPILER_EXE    <User_Defined>)
set(USERCFG_AR_EXE              <User_Defined>)
set(USERCFG_OBJCOPY_EXE         <User_Defined>)


# =======================================================================================
# GENERAL CONSTRAIN
# =======================================================================================
# Constrain 1 - Requirement - Looking for mingw64 gcc
find_program(MINGW64_GCC_EXECUTION ${USERCFG_C_COMPILER_EXE})
if (NOT MINGW64_GCC_EXECUTION)
    message("-- [ERROR] PROCESS TERMINATED!")
    message(FATAL_ERROR "[ERROR] USERCFG_C_COMPILER_EXE not found!")
endif ()

# Constrain 2 - Requirement - Looking for mingw64 g++
find_program(MINGW64_GPP_EXECUTION ${USERCFG_CXX_COMPILER_EXE})
if (NOT MINGW64_GPP_EXECUTION)
    message("-- [ERROR] PROCESS TERMINATED!")
    message(FATAL_ERROR "[ERROR] USERCFG_CXX_COMPILER_EXE not found!")
endif ()

# Constrain 3 - Optional - Looking for mingw64 ar
find_program(MINGW64_AR_EXECUTION ${USERCFG_AR_EXE})
if(NOT MINGW64_AR_EXECUTION)
    message("-- [WARNING] USERCFG_AR_EXE not found!")
endif()

# Constrain 4 - Optional - Looking for objcopy
find_program(MINGW64_OBJCOPY_EXECUTION ${USERCFG_OBJCOPY_EXE})
if(NOT MINGW64_OBJCOPY_EXECUTION)
    message("-- [WARNING] USERCFG_AR_EXE not found!")
endif()


# =======================================================================================
# TOOLCHAIN CONFIGURATION
# =======================================================================================
# set(CMAKE_C_COMPILER_WORKS 1)                   # Skip compiler testing process
# set(CMAKE_CXX_COMPILER_WORKS 1)                 # Skip compiler testing process


# =======================================================================================
# TOOLCHAIN SPECIFICATION
# =======================================================================================
set(CMAKE_C_COMPILER    ${MINGW64_GCC_EXECUTION})
set(CMAKE_CXX_COMPILER  ${MINGW64_GPP_EXECUTION})
set(CMAKE_AR            ${MINGW64_AR_EXECUTION})
set(CMAKE_OBJCOPY       ${MINGW64_OBJCOPY_EXECUTION})
