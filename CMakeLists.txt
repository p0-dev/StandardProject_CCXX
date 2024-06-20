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
# NAME              | CMakeLists.txt (root)
# ---------------------------------------------------------------------------------------
# CONTENT           | - Required version of CMake for generating build instruction.
#                   | - Project name based on requirement.
#                   | - General configuration for building this project.
#                   | - Adding required sub-directories such as:
#                   |     + Codebase
# ---------------------------------------------------------------------------------------


# =======================================================================================
# REVISION TABLE
# =======================================================================================
# VERSION | DATE        | BY            | DESCRIPTION
# ---------------------------------------------------------------------------------------
# 0.0.0.1 | 15.06.2024  | Thanh Tran    | Initialization
# ---------------------------------------------------------------------------------------


# =======================================================================================
# GENERATION PROCESS
# =======================================================================================
# In order to use CMake for generating the building instruction list, please consider
# those possible flags as below for "generating flags"

# ---------------------------------------------------------------------------------------
# FLAG                  | EXAMPLE PARAMETER         | DESCRIPTION
# ---------------------------------------------------------------------------------------
# -S                    | .                         | Location of main CMake's 
#                       |                           | script (this file)
# ---------------------------------------------------------------------------------------
# -B                    | Build                     | Location for storing results 
#                       |                           | from generating process, 
#                       |                           | in this case is directory <Build>.
# ---------------------------------------------------------------------------------------
# --toolchain           | Toolchain/Mingw64.cmake   | Specifying the toolchain to be 
#                       |                           | used with this project, 
#                       |                           | all toolchain specification 
#                       |                           | files will be put inside the 
#                       |                           | directory <Toolchain>
# ---------------------------------------------------------------------------------------
# -Wdev                 | N/A                       | Enable developer warning
# ---------------------------------------------------------------------------------------
# -Werror=dev           | N/A                       | Enable developer error
# ---------------------------------------------------------------------------------------
# -Werror=deprecated    | N/A                       | Enabling error for soon 
#                       |                           | deprecated functions of CMake
# ---------------------------------------------------------------------------------------
# -G                    | Ninja                     | Specifying the build tool to be 
#                       |                           | used, in this case it is Ninja
# ---------------------------------------------------------------------------------------
# --fresh               | N/A                       | Generating fresh build 
#                       |                           | instruction file
# ---------------------------------------------------------------------------------------
# --graphviz            | Diagram/Overview.dot      | Generating build relationship 
#                       |                           | diagram
# ---------------------------------------------------------------------------------------
# --check-system-vars   | N/A                       | Checking environmental variable
# ---------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------
# Example (on OS: Windows 10)
# ---------------------------------------------------------------------------------------
# cmake -S . \
#       -B Build \
#       -G Ninja \
#       --toolchain Toolchain\Mingw64.cmake \
#       -Wdev \
#       -Werror=dev \
#       -Werror=deprecated \ 
#       --fresh \
#       --graphviz=Diagram\Overview.dot \
#       --check-system-vars
# ---------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------
# Note
# ---------------------------------------------------------------------------------------
# The building process will do a procedure, which install the project results file inside
# the directory <Install>. The result files will be put in either <Debug> or <Release>
# depends on the BUILD_CONFIGURATION setting from users.
# ---------------------------------------------------------------------------------------


# =======================================================================================
# BUILDING PROCESS
# =======================================================================================
# Please consider using these flags for the CMake building process with Ninja

# ---------------------------------------------------------------------------------------
# FLAGS                 | EXAMPLE PARAMETER         | DESCRIPTION
# ---------------------------------------------------------------------------------------
# --build               | Build                     | Location of build instruction file 
#                       |                           | Depends on the results of 
#                       |                           | generating process.
# ---------------------------------------------------------------------------------------
# --parallel            | N/A                       | Parallel build for increasing
#                       |                           | the performance of the build
#                       |                           | process.
# ---------------------------------------------------------------------------------------
# --clean-first         | N/A                       | Clean the results from the last
#                       |                           | build before proceeding to 
#                       |                           | build the project.
# ---------------------------------------------------------------------------------------
# --verbose             | N/A                       | Build trace for debugging
# ---------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------
# Example (on OS: Windows 10)
# ---------------------------------------------------------------------------------------
# cmake --build Build
#       --clean-first
#       --verbose
# ---------------------------------------------------------------------------------------


# =======================================================================================
# INSTALLATION PROCESS
# =======================================================================================
# Installation process will put results file of the project on the host system.

# ---------------------------------------------------------------------------------------
# FLAGS                 | EXAMPLE PARAMETER         | DESCRIPTION
# ---------------------------------------------------------------------------------------
# --install             | Build                     | Location of build instruction file 
#                       |                           | Depends on the results of 
#                       |                           | generating process.
# ---------------------------------------------------------------------------------------
# --prefix              | Install                   | Default location of the project 
#                       | (default setting)         | will be at Root/Install.
#                       | <User Setting>            | And user defined directory.
# ---------------------------------------------------------------------------------------
# --verbose             | N/A                       | Trace enable
# ---------------------------------------------------------------------------------------
# --strip               | N/A                       | Strip the debugging symbols 
#                       |                           | from the installed binaries 
#                       |                           | and libraries.
#                       |                           | Used for Release build.
# ---------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------
# Example (on OS: Windows 10)
# ---------------------------------------------------------------------------------------
# cmake --install Build
#       --prefix Install
#       --verbose
#       --strip
# ---------------------------------------------------------------------------------------


# =======================================================================================
# PROJECT VARRIABLES
# =======================================================================================
message("\n")

message("-- [INFO] CMake Configuration Inputs")
message("-- [INFO] --------------------------")

message("-- [INFO] USERCFG_TOOLCHAIN_BUILD_TOOL: ${USERCFG_TOOLCHAIN_BUILD_TOOL}")

message("-- [INFO] DEFAULT_INSTALL_BINARY_DIR: ${DEFAULT_INSTALL_BINARY_DIR}")
message("-- [INFO] DEFAULT_INSTALL_LIBRARY_DIR: ${DEFAULT_INSTALL_LIBRARY_DIR}")
message("-- [INFO] DEFAULT_INSTALL_INCLUDE_DIR: ${DEFAULT_INSTALL_INCLUDE_DIR}")
message("-- [INFO] DEFAULT_CODEBASE_DIR: ${DEFAULT_CODEBASE_DIR}")
message("-- [INFO] DEFAULT_CMAKE_SCRIPT_FILE: ${DEFAULT_CMAKE_SCRIPT_FILE}")
message("-- [INFO] DEFAULT_SOURCE_DIR: ${DEFAULT_SOURCE_DIR}")
message("-- [INFO] DEFAULT_INCLUDE_DIR: ${DEFAULT_INCLUDE_DIR}")
message("-- [INFO] DEFAULT_INSTALL_DIR: ${DEFAULT_INSTALL_DIR}")

message("-- [INFO] PROJECT_NAME: ${PROJECT_NAME}")
message("-- [INFO] CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}")

message("\n")


# message(FATAL_ERROR "")
# =======================================================================================
# GLOBAL FLAGS FOR CMAKE TO PROCESS
# =======================================================================================
set(FLAG_AR_AVAILABLE       0)
set(FLAG_OBJCOPY_AVAILABLE  0)


# =======================================================================================
# PROJECT CONFIGURATIONS
# =======================================================================================
cmake_minimum_required(VERSION 3.29)
project(${PROJECT_NAME})
message("\n")
message("-- [INFO] Project Configurations")
message("-- [INFO] ----------------------")
message("-- [INFO] CMAKE_MINIMUM_REQUIRED_VERSION = ${CMAKE_MINIMUM_REQUIRED_VERSION}") 
message("\n")


# message(FATAL_ERROR "")
# =======================================================================================
# PROJECT MAIN TARGETS DEFINITION
# =======================================================================================
set(EXE_TARGET "${PROJECT_NAME}_exe")

message("-- [INFO] Main Project's Target")
message("-- [INFO] ---------------------")
message("-- [INFO] - ${EXE_TARGET}")
message("\n")


# message(FATAL_ERROR "")
# =======================================================================================
# GENERAL CONSTRAINS
# =======================================================================================
message("-- [INFO] General Constrains")
message("-- [INFO] ------------------")

# Constrains - Required - Check for DEFAULT_INSTALL_DIR
if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_INSTALL_DIR})
    message(FATAL_ERROR "-- [FATAL_ERROR] Not found ${DEFAULT_INSTALL_DIR}")
elseif(NOT IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_INSTALL_DIR})
    message(FATAL_ERROR "-- [FATAL_ERROR] Not found ${DEFAULT_INSTALL_DIR}")
else()
    message("-- [INFO] Found ${DEFAULT_INSTALL_DIR}")
endif()

# Constrains - Required - Check for DEFAULT_CODEBASE_DIR
if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_CODEBASE_DIR})
    message(FATAL_ERROR "-- [FATAL_ERROR] Not found ${DEFAULT_CODEBASE_DIR}")
elseif(NOT IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_CODEBASE_DIR})
    message(FATAL_ERROR "-- [FATAL_ERROR] Not found ${DEFAULT_CODEBASE_DIR}")
else()
    message("-- [INFO] Found ${DEFAULT_CODEBASE_DIR}")
endif()

# Constrains - Required - Check for DEFAULT_CODEBASE_DIR/DEFAULT_INCLUDE_DIR
if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_CODEBASE_DIR}/${DEFAULT_INCLUDE_DIR})
    message(FATAL_ERROR "-- [FATAL_ERROR] Not found ${DEFAULT_CODEBASE_DIR}/${DEFAULT_INCLUDE_DIR}")
elseif(NOT IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_CODEBASE_DIR}/${DEFAULT_INCLUDE_DIR})
    message(FATAL_ERROR "-- [FATAL_ERROR] Not found ${DEFAULT_CODEBASE_DIR}/${DEFAULT_INCLUDE_DIR}")
else()
    message("-- [INFO] Found ${DEFAULT_CODEBASE_DIR}/${DEFAULT_INCLUDE_DIR}")
endif()

# Constrains - Required - Check for DEFAULT_CODEBASE_DIR/DEFAULT_SOURCE_DIR
if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_CODEBASE_DIR}/${DEFAULT_SOURCE_DIR})
    message(FATAL_ERROR "-- [FATAL_ERROR] Not found ${DEFAULT_CODEBASE_DIR}/${DEFAULT_SOURCE_DIR}")
elseif(NOT IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_CODEBASE_DIR}/${DEFAULT_SOURCE_DIR})
    message(FATAL_ERROR "-- [FATAL_ERROR] Not found ${DEFAULT_CODEBASE_DIR}/${DEFAULT_SOURCE_DIR}")
else()
    message("-- [INFO] Found ${DEFAULT_CODEBASE_DIR}/${DEFAULT_SOURCE_DIR}")
endif()

# Contrains 1 - Required - Checking for ${DEFAULT_CODEBASE_DIR}/${DEFAULT_CMAKE_SCRIPT_FILE} availability
if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_CODEBASE_DIR}/${DEFAULT_CMAKE_SCRIPT_FILE})
    message(FATAL_ERROR "-- [FATAL_ERROR] Not found ${DEFAULT_CODEBASE_DIR}/${DEFAULT_CMAKE_SCRIPT_FILE}")
else()
    message("-- [INFO] Found ${DEFAULT_CODEBASE_DIR}/${DEFAULT_CMAKE_SCRIPT_FILE}")
endif()

# Constrain 3 - Required - Checking for GCC compiler
find_program(MINGW64_GCC_EXECUTION ${USERCFG_C_COMPILER_EXE})
if (NOT MINGW64_GCC_EXECUTION)
    message(FATAL_ERROR "[FATAL_ERROR] Cannot find USERCFG_C_COMPILER_EXE")
else()
    message("-- [INFO] Found USERCFG_C_COMPILER_EXE: ${USERCFG_C_COMPILER_EXE}")
endif ()

# Constrain 4 - Required - Checking for G++ compiler
find_program(MINGW64_GPP_EXECUTION ${USERCFG_CXX_COMPILER_EXE})
if (NOT MINGW64_GPP_EXECUTION)
    message(FATAL_ERROR "[FATAL_ERROR] Cannot find USERCFG_CXX_COMPILER_EXE")
else()
    message("-- [INFO] Found USERCFG_CXX_COMPILER_EXE: ${USERCFG_CXX_COMPILER_EXE}")
endif ()

# Constrain 5 - Optional - Checking for AR
find_program(MINGW64_AR_EXECUTION ${USERCFG_AR_EXE})
if(NOT MINGW64_AR_EXECUTION)
    message("-- [WARNING] Cannot find USERCFG_AR_EXE")
else()
    message("-- [INFO] Found USERCFG_AR_EXE: ${USERCFG_AR_EXE}")
    set(FLAG_AR_AVAILABLE 1)
endif()

# Constrain 6 - Optional - Checking for Objcopy
find_program(MINGW64_OBJCOPY_EXECUTION ${USERCFG_OBJCOPY_EXE})
if(NOT MINGW64_OBJCOPY_EXECUTION)
    message("-- [WARNING] Cannot find USERCFG_OBJCOPY_EXE")
else()
    message("-- [INFO] Found USERCFG_OBJCOPY_EXE: ${USERCFG_OBJCOPY_EXE}")
    set(FLAG_OBJCOPY_AVAILABLE 1)
endif()

# Constrain 11 - Required - Checking for build tool
find_program(BUILD_TOOL_EXECUTION ${USERCFG_TOOLCHAIN_BUILD_TOOL})
if(NOT BUILD_TOOL_EXECUTION)
    message(FATAL_ERROR "-- [FATAL_ERROR] Cannot find USERCFG_TOOLCHAIN_BUILD_TOOL")
else()
    message("-- [INFO] Found USERCFG_TOOLCHAIN_BUILD_TOOL: ${USERCFG_TOOLCHAIN_BUILD_TOOL}")
endif()

# Constrain 7 - Optional - Checking for compilation flags (debug)
if("" STREQUAL "${COMPILE_DEBUG_FLAG}")
    message("-- [WARNING] COMPILE_DEBUG_FLAG is not set!")
else()
    message("-- [INFO] COMPILE_DEBUG_FLAG: ${COMPILE_DEBUG_FLAG}")
endif()

# Constrain 8 - Optional - Checking for linking flags (debug)
if("" STREQUAL "${LINKING_DEBUG_FLAG}")
    message("-- [WARNING] LINKING_DEBUG_FLAG is not set!")
else()
    message("-- [INFO] LINKING_DEBUG_FLAG: ${LINKING_DEBUG_FLAG}")
endif()

# Constrain 9 - Optional - Checking for compilation flags (release)
if("" STREQUAL "${COMPILE_RELEASE_FLAG}")
    message("-- [WARNING] COMPILE_RELEASE_FLAG is not set!")
else()
    message("-- [INFO] COMPILE_RELEASE_FLAG: ${COMPILE_RELEASE_FLAG}")
endif()

# Constrain 10 - Optional - Checking for linking flags (release)
if("" STREQUAL "${LINKING_RELEASE_FLAG}")
    message("-- [WARNING] LINKING_RELEASE_FLAG is not set!")
else()
    message("-- [INFO] LINKING_RELEASE_FLAG: ${LINKING_RELEASE_FLAG}")
endif()

message("\n")


# message(FATAL_ERROR "")
# =======================================================================================
# TOOLCHAIN DEFINITION
# =======================================================================================
message("-- [INFO] Toolchain Definition")
message("-- [INFO] --------------------")
set(CMAKE_C_COMPILER    ${MINGW64_GCC_EXECUTION})
set(CMAKE_CXX_COMPILER  ${MINGW64_GPP_EXECUTION})

if(FLAG_AR_AVAILABLE)
    set(CMAKE_AR ${MINGW64_AR_EXECUTION})
endif()

if(FLAG_OBJCOPY_AVAILABLE)
    set(CMAKE_OBJCOPY ${MINGW64_OBJCOPY_EXECUTION})
endif()

message("-- [INFO] CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
message("-- [INFO] CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
message("-- [INFO] CMAKE_AR: ${CMAKE_AR}")
message("-- [INFO] CMAKE_OBJCOPY: ${CMAKE_OBJCOPY}")

message("-- [INFO] COMPILE_DEBUG_FLAG: ${COMPILE_DEBUG_FLAG}")
message("-- [INFO] LINKING_DEBUG_FLAG: ${LINKING_DEBUG_FLAG}")

message("-- [INFO] COMPILE_RELEASE_FLAG: ${COMPILE_RELEASE_FLAG}")
message("-- [INFO] LINKING_RELEASE_FLAG: ${LINKING_RELEASE_FLAG}")

message("\n")


# message(FATAL_ERROR "")
# =======================================================================================
# CMAKE CONFIGURATIONS
# =======================================================================================
message("-- [INFO] CMake Configuration")
message("-- [INFO] -------------------")
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)            # Export compile command for clangd

message("-- [INFO] CMAKE_EXPORT_COMPILE_COMMANDS = ${CMAKE_EXPORT_COMPILE_COMMANDS}")

message("\n")


# message(FATAL_ERROR "")
# =======================================================================================
# SUB_DIRECTORY
# =======================================================================================
message("-- [INFO] Sub-directories")
message("-- [INFO] ---------------")

# Codebase
add_subdirectory(Codebase)

