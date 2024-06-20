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
# MAIN SOURCE FILE
# =======================================================================================
set(C_MAIN ${CMAKE_CURRENT_SOURCE_DIR}/Source/Main.c)

message("-- [INFO] Main Source File: ${C_MAIN}")


# =======================================================================================
# HEADER DIRECTORY SPECIFICATION
# =======================================================================================

# Specification
set(H_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Include)

message("-- [INFO] Directory Of Header: ${H_DIR}")

# Installation
install(DIRECTORY ${H_DIR}/ DESTINATION ${INSTALL_INC_DIR})


# =======================================================================================
# MODULE DIRECTORY
# =======================================================================================
set(DummyModule1_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Source/DummyModule1)
set(DummyModule1_TARGET DummyModule1)

message("-- [INFO] Directory Of Module:<DummyModule1>: ${DummyModule1_DIR}")
message("-- [INFO] Target Of Module:<DummyModule1>: ${DummyModule1_TARGET}")


# =======================================================================================
# SUB DIRECTORY
# =======================================================================================
add_subdirectory(${DummyModule1_DIR})


# =======================================================================================
# TARGET - EXECUTION
# =======================================================================================

# Target: Execution - Main File
add_executable(${EXE_TARGET} ${C_MAIN})

# Target: Execution - Include Directory
target_include_directories(${EXE_TARGET} PUBLIC ${H_DIR})

# Target: Execution - Linking Internal Libraries
target_link_libraries(${EXE_TARGET} PUBLIC ${DummyModule1_TARGET})

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

# Target: Execution - Installation
install(TARGETS ${EXE_TARGET} DESTINATION ${INSTALL_BIN_DIR})

