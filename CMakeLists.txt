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
# NAME              | CMakeLists.txt (root)
# ---------------------------------------------------------------------------------------
# CONTENT           | - Required version of CMake for generating build instruction.
#                   | - Project name based on requirement.
#                   | - General configuration for building this project.
#                   | - Adding required sub-directories such as:
#                   |     + Codebase
# =======================================================================================


# =======================================================================================
# REVISION TABLE
# =======================================================================================
# VERSION | DATE        | BY            | DESCRIPTION
# ---------------------------------------------------------------------------------------
# 0.0.0.1 | 15.06.2024  | Thanh Tran    | Initialization
# =======================================================================================


# =======================================================================================
# GENERATION PROCESS
# =======================================================================================
# In order to use CMake for generating the building instruction list, please consider
# those possible flags as below for "generating flags"

# Flags                 | Example Parameter         | Description
# ---------------------------------------------------------------------------------------
# -S                    | .                         | Location of main CMake's 
#                                                   | script (this file)
# ---------------------------------------------------------------------------------------
# -B                    | Build                     | Location for storing results 
#                                                   | from generating process, 
#                                                   | in this case is directory <Build>.
# ---------------------------------------------------------------------------------------
# --toolchain           | Toolchain/Mingw64.cmake   | Specifying the toolchain to be 
#                                                   | used with this project, 
#                                                   | all toolchain specification 
#                                                   | files will be put inside the 
#                                                   | directory <Toolchain>
# ---------------------------------------------------------------------------------------
# -Wdev                 | N/A                       | Enable developer warning
# ---------------------------------------------------------------------------------------
# -Werror=dev           | N/A                       | Enable developer error
# ---------------------------------------------------------------------------------------
# -Werror=deprecated    | N/A                       | Enabling error for soon 
#                                                   | deprecated functions of CMake
# ---------------------------------------------------------------------------------------
# -G                    | Ninja                     | Specifying the build tool to be 
#                                                   | used, in this case it is Ninja
# ---------------------------------------------------------------------------------------
# --fresh               | N/A                       | Generating fresh build 
#                                                   | instruction file
# ---------------------------------------------------------------------------------------
# --graphviz            | Diagram/Overview.dot      | Generating build relationship 
#                                                   | diagram
# ---------------------------------------------------------------------------------------
# --check-system-vars   | N/A                       | Checking environmental variable

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


# =======================================================================================
# BUILDING PROCESS
# =======================================================================================
# Please consider using these flags for the CMake building process with Ninja

# Flags                 | Example Parameter         | Description
# ---------------------------------------------------------------------------------------
# --build               | Build                     | Location of build instruction file 
#                       |                           | Depends on the results of 
#                       |                           | generating process
# ---------------------------------------------------------------------------------------
# -B                    | Build                     | Location for storing results 
#                       |                           | from generating process, 
#                       |                           | in this case is directory <Build>.
# ---------------------------------------------------------------------------------------
# --toolchain           | Toolchain/Mingw64.cmake   | Specifying the toolchain to be 
#                       |                            | used with this project, 
#                                                   | all toolchain specification 
#                                                   | files will be put inside the 
#                                                   | directory <Toolchain>
# ---------------------------------------------------------------------------------------
# -Wdev                 | N/A                       | Enable developer warning
# ---------------------------------------------------------------------------------------
# -Werror=dev           | N/A                       | Enable developer error
# ---------------------------------------------------------------------------------------
# -Werror=deprecated    | N/A                       | Enabling error for soon 
#                                                   | deprecated functions of CMake
# ---------------------------------------------------------------------------------------
# -G                    | Ninja                     | Specifying the build tool to be 
#                                                   | used, in this case it is Ninja
# ---------------------------------------------------------------------------------------



# =======================================================================================
# INSTALLATION PROCESS
# =======================================================================================
## Please refer to README.md for installation process




# =======================================================================================
# PROJECT CONSTANTS / MACROS
# =======================================================================================
set(BUILD_RELEASE   "Release")
set(BUILD_DEBUG     "Debug")


# =======================================================================================
# GENERAL CONSTRAINS
# =======================================================================================
## Contrains 1 - Checking for Codebase/CMakeLists.txt
if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/Codebase/CMakeLists.txt)
    message("-- [INFO] PROCESS TERMINATED")
    message(FATAL_ERROR "Not found Codebase/CMakeLists.txt")
endif()

## Contrains 2 - Checking for build type
if(NOT CMAKE_BUILD_TYPE)
    message("-- [INFO] CMAKE_BUILD_TYPE not found!")
    set(CMAKE_BUILD_TYPE ${BUILD_RELEASE})
elseif(${CMAKE_BUILD_TYPE} STREQUAL ${BUILD_RELEASE})
    set(CMAKE_BUILD_TYPE ${BUILD_RELEASE})
elseif(${CMAKE_BUILD_TYPE} STREQUAL ${BUILD_DEBUG})
    set(CMAKE_BUILD_TYPE ${BUILD_DEBUG})
else()
    message("-- [INFO] PROCESS TERMINATED")
    message(FATAL_ERROR "[ERROR] Wrong CMAKE_BUILD_TYPE")
endif()

message("-- [INFO] CMAKE_BUILD_TYPE = ${CMAKE_BUILD_TYPE}")


# =======================================================================================
# CMAKE CONFIGURATIONS
# =======================================================================================
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)            # Export compile command for clangd

message("-- [INFO] CMAKE_EXPORT_COMPILE_COMMANDS = ${CMAKE_EXPORT_COMPILE_COMMANDS}")


# =======================================================================================
# PROJECT CONFIGURATIONS
# =======================================================================================
cmake_minimum_required(VERSION 3.29)
project(StandardProject)

message("-- [INFO] CMAKE_MINIMUM_REQUIRED_VERSION = ${CMAKE_MINIMUM_REQUIRED_VERSION}") 
message("-- [INFO] PROJECT_NAME = ${PROJECT_NAME}")

# =======================================================================================
# PROJECT MAIN TARGETS
# =======================================================================================
set(EXE_TARGET "${PROJECT_NAME}_exe")
set(CMAKE_TARGET "${PROJECT_NAME}_cmake")

message("-- [INFO] Available Main Targets:")
message("-- [INFO] - ${EXE_TARGET}")
message("-- [INFO] - ${CMAKE_TARGET}")

# =======================================================================================
# GENERAL COMPILATION FLAGS
# =======================================================================================
set(COMPILATION_C_DEBUG_FLAGS "-D COMPILE_DEBUG_FLAG=1")
set(COMPILATION_C_RELEASE_FLAGS "-D COMPILE_REPLEASE_FLAG=1")

if(${BUILD_RELEASE} STREQUAL ${CMAKE_BUILD_TYPE})
    message("-- [INFO] Compilation flags = ${COMPILATION_C_RELEASE_FLAGS}")
else()
    message("-- [INFO] Compilation flags = ${COMPILATION_C_DEBUG_FLAGS}")
endif()


# =======================================================================================
# GENERAL LINKING FLAGS
# =======================================================================================
set(LINKING_C_DEBUG_FLAGS "-D LINKING_DEBUG_FLAG=1")
set(LINKING_C_RELEASE_FLAGS "-D LINKING_RELEASE_FLAG=1")

if(${BUILD_RELEASE} STREQUAL ${CMAKE_BUILD_TYPE})
    message("-- [INFO] Linking flags = ${LINKING_C_RELEASE_FLAGS}")
else()
    message("-- [INFO] Linking flags = ${LINKING_C_DEBUG_FLAGS}")
endif()


# =======================================================================================
# SUB_DIRECTORY
# =======================================================================================
add_subdirectory(Codebase)
