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
# NAME              | CMakeLists.txt (Codebase)
# ---------------------------------------------------------------------------------------
# LOCATION          | Codebase/CMakeLists.txt
# ---------------------------------------------------------------------------------------
# CONTENT           | - Header directory / files
#                   | - Sub-directory for library targets
#                   | - Execution targets
# ---------------------------------------------------------------------------------------


# =======================================================================================
# REVISION TABLE
# =======================================================================================
# VERSION | DATE        | BY            | DESCRIPTION
# ---------------------------------------------------------------------------------------
# 0.0.0.1 | 15.06.2024  | Thanh Tran    | Initialization
# ---------------------------------------------------------------------------------------


# =======================================================================================
# PREPARATION
# =======================================================================================
message("\n")
message("-- [INFO] BUILDING ${DEFAULT_CODEBASE_DIR} ... ")
message("-- [INFO] -------------------------------------")
message("\n")


# message(FATAL_ERROR "STOP")
# =======================================================================================
# MAIN SOURCE FILE
# =======================================================================================
message("-- [INFO] Identifying main source file")
message("-- [INFO] -----------------------")
set(C_MAIN ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_SOURCE_DIR}/Main.c)
if(NOT EXISTS ${C_MAIN})
    message(FATAL_ERROR "-- [FATAL_ERROR] Cannot find ${C_MAIN}")
else()
    message("-- [INFO] Found ${C_MAIN}")
endif()

message("\n")

# message(FATAL_ERROR "STOP")
# =======================================================================================
# HEADER DIRECTORY SPECIFICATION
# =======================================================================================
message("-- [INFO] Identifying include directory")
message("-- [INFO] -----------------------------")
# Specification
set(H_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_INCLUDE_DIR})
if(NOT EXISTS ${H_DIR})
    message(FATAL_ERROR "-- [FATAL_ERROR] Cannot find ${H_DIR}")
else()
    message("-- [INFO] Found ${H_DIR}")
endif()

# Installation
message("-- [INFO] ${H_DIR} will be installed at ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_INSTALL_DIR}/${DEFAULT_INSTALL_INCLUDE_DIR}")
install(DIRECTORY ${H_DIR}/ DESTINATION ${DEFAULT_INSTALL_INCLUDE_DIR})

message("\n")


# message(FATAL_ERROR "STOP")
# =======================================================================================
# MODULE DIRECTORY
# =======================================================================================
message("-- [INFO] Checking module directory")
message("-- [INFO] -------------------------")
# Module: DummyModule1
set(DummyModule1_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_SOURCE_DIR}/DummyModule1)
if (NOT EXISTS ${DummyModule1_DIR})
    message(FATAL_ERROR "-- [FATAL_ERROR] Cannot find ${DummyModule1_DIR}")
else()
    message("-- [INFO] Found ${DummyModule1_DIR}")
endif()

message("\n")


# message(FATAL_ERROR "STOP")
# =======================================================================================
# SUB DIRECTORY / MODULE TARGET
# =======================================================================================

# Module: DummyModule1
add_subdirectory(${DummyModule1_DIR})
set(DummyModule1_TARGET DummyModule1)
if (NOT TARGET ${DummyModule1_TARGET})
    message(FATAL_ERROR "-- [FATAL_ERROR] Target: ${DummyModule1_TARGET} not available")    
else()
    message("-- [INFO] Target: ${DummyModule1_TARGET} is available")
endif()
message("\n")


# message(FATAL_ERROR "STOP")
# =======================================================================================
# TARGET - EXECUTION
# =======================================================================================
message("-- [INFO] Building main target")
message("-- [INFO] --------------------")

# Target: Execution - Main File
add_executable(${EXE_TARGET} ${C_MAIN})
message("-- [INFO] Source: ${C_MAIN}")

# Target: Execution - Include Directory
target_include_directories(${EXE_TARGET} PUBLIC ${H_DIR})
message("-- [INFO] Header: ${H_DIR}")

# Target: Execution - Linking Internal Libraries

## Linking -> DummyModule1_TARGET
target_link_libraries(${EXE_TARGET} PUBLIC ${DummyModule1_TARGET})
message("-- [INFO] Link: ${DummyModule1_TARGET}")

# Target: Execution - Compile Flags
target_compile_options(${EXE_TARGET} PUBLIC
    $<$<CONFIG:${BUILD_DEBUG}>:${COMPILE_DEBUG_FLAG}>
    $<$<CONFIG:${BUILD_RELEASE}>:${COMPILE_RELEASE_FLAG}>
)

# Target: Execution - Linking Flags
target_link_options(${EXE_TARGET} PUBLIC
    $<$<CONFIG:${BUILD_DEBUG}>:${LINKING_DEBUG_FLAG}>
    $<$<CONFIG:${BUILD_RELEASE}>:${LINKING_RELEASE_FLAG}>
)

# Build Type
message("-- [INFO] Build Configration: ${CMAKE_BUILD_TYPE}")

# Target: Execution - Installation
install(TARGETS ${EXE_TARGET} DESTINATION ${DEFAULT_INSTALL_BINARY_DIR})
message("-- [INFO] Installing at ${CMAKE_SOURCE_DIR}/${DEFAULT_INSTALL_DIR}/${DEFAULT_INSTALL_BINARY_DIR}") 

