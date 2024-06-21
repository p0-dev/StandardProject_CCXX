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
message("-- [INFO] BUILDING ${DEFAULT_CODEBASE_DIR} ... ")
message("-- [INFO] -------------------------------------")
message("\n")


# =======================================================================================
# HEADER DIRECTORY SPECIFICATION FOR ALL TARGETS
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


# =======================================================================================
# TARGET LIST OF THIS PROJECT
# =======================================================================================
# The name of the target will be depends on the value of library name/module name.
# Please check local CMakeLists.txt of each module for the information.

message("-- [INFO] Codebase Targets (for building):")
message("-- [INFO] --------------------------------")

# Definition: Target Name
set (Exe_TARGET ${PROJECT_NAME}_exe)
set(DummyModule1_TARGET DummyModule1)
set(DummyModule2_TARGET DummyModule2)
set(DummyModule3_TARGET DummyModule3)

# Definition: Target Location
set(DummyModule1_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_SOURCE_DIR}/DummyModule1)
set(DummyModule2_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_SOURCE_DIR}/DummyModule2)
set(DummyModule3_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${DEFAULT_SOURCE_DIR}/DummyModule3)

# Definition: Target Location List
list(APPEND TARGET_LOCATION_LIST ${DummyModule1_DIR})
list(APPEND TARGET_LOCATION_LIST ${DummyModule2_DIR})
list(APPEND TARGET_LOCATION_LIST ${DummyModule3_DIR})

message("-- [INFO] ${Exe_TARGET}")
message("-- [INFO] ${DummyModule1_TARGET}")
message("-- [INFO] ${DummyModule2_TARGET}")
message("-- [INFO] ${DummyModule3_TARGET}")

message("\n")

message("-- [INFO] ${DummyModule1_DIR}")
message("-- [INFO] ${DummyModule2_DIR}")
message("-- [INFO] ${DummyModule3_DIR}")

message("\n")

message("-- [INFO] ${TARGET_LOCATION_LIST}")

message("\n")


# =======================================================================================
# BUILDING MODULES
# =======================================================================================
# The "Module Switch List" is used as master switch for each module to be ON/OFF, duing 
# building process. Off a module could cause the building process to fail. Be careful.

message("-- [INFO] Building Targets ----")
message("-- [INFO] ---------------------")
message("\n")

foreach(TARGET_LOCATION ${TARGET_LOCATION_LIST})
    message("\n")
    if(NOT EXISTS ${TARGET_LOCATION})
        message(FATAL_ERROR "-- [FATAL_ERROR] Cannot find ${TARGET_LOCATION}")
    else()
        message("-- [INFO] Found ${TARGET_LOCATION}")
        add_subdirectory(${TARGET_LOCATION})
    endif()
    message("\n")
endforeach()

message("\n")


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


# =======================================================================================
# TARGET - EXECUTION
# =======================================================================================
message("-- [INFO] Building main target")
message("-- [INFO] --------------------")

# Target: Execution - Main File
add_executable(${Exe_TARGET} ${C_MAIN})
message("-- [INFO] Source: ${C_MAIN}")

# Target: Execution - Include Directory
target_include_directories(${Exe_TARGET} PUBLIC ${H_DIR})
message("-- [INFO] Header: ${H_DIR}")

# Target: Execution - Linking Internal Libraries
## Linking -> DummyModule1_TARGET
target_link_libraries(${Exe_TARGET} PRIVATE ${DummyModule1_TARGET})
message("-- [INFO] Link: ${DummyModule1_TARGET}")
## Linking -> DummyModule2_TARGET
target_link_libraries(${Exe_TARGET} PRIVATE ${DummyModule2_TARGET})
message("-- [INFO] Link: ${DummyModule2_TARGET}")

# Target: Execution - Compile Flags
target_compile_options(${Exe_TARGET} PUBLIC
    $<$<CONFIG:Debug>:${COMPILE_DEBUG_FLAG}>
    $<$<CONFIG:Release>:${COMPILE_RELEASE_FLAG}>
)

# Target: Execution - Linking Flags
target_link_options(${Exe_TARGET} PUBLIC
    $<$<CONFIG:Debug>:${LINKING_DEBUG_FLAG}>
    $<$<CONFIG:Release>:${LINKING_RELEASE_FLAG}>
)

# Build Type
message("-- [INFO] Build Configration: ${CMAKE_BUILD_TYPE}")

# Target: Execution - Installation
install(TARGETS ${Exe_TARGET} DESTINATION ${DEFAULT_INSTALL_BINARY_DIR})
message("-- [INFO] Installing at ${CMAKE_SOURCE_DIR}/${DEFAULT_INSTALL_DIR}/${DEFAULT_INSTALL_BINARY_DIR}") 

