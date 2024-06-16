

# ---------------------------------------------------------------------------------------
# COPY RIGHT / LEFT
# ---------------------------------------------------------------------------------------
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
# INTENTIONAL LEAVE BLANK
# =======================================================================================


# ---------------------------------------------------------------------------------------
# FILE INFORMATION
# ---------------------------------------------------------------------------------------
# NAME              | CMakeLists.txt (Codebase)
# ---------------------------------------------------------------------------------------
# LOCATION          | Codebase/CMakeLists.txt
# ---------------------------------------------------------------------------------------
# CONTENT           | - Header directory / files
#                   | - Sub-directory for library targets
#                   | - Execution targets
# ---------------------------------------------------------------------------------------


# =======================================================================================
# HEADER DIRECTORY SPECIFICATION
# =======================================================================================
set(H_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Include)

message("-- [INFO] Header directory = ${H_DIR}")


# =======================================================================================
# MODULE DIRECTORY
# =======================================================================================
set(DummyModule1_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Source/DummyModule1)

message("-- [INFO] <DummyModule1> directory = ${DummyModule1_DIR}")


# =======================================================================================
# MAIN FILE
# =======================================================================================
set(C_MAIN ${CMAKE_CURRENT_SOURCE_DIR}/Source/Main.c)

message("-- [INFO] Main file (including MAIN function) = ${C_MAIN}")


# =======================================================================================
# SUB_DIRECTORY
# =======================================================================================
add_subdirectory(${DummyModule1_DIR})


# =======================================================================================
# TARGET - EXECUTION
# =======================================================================================
## Execution Target - Main File
add_executable(${EXE_TARGET} ${C_MAIN})

## Execution Target - Include Directory
target_include_directories(${EXE_TARGET} PUBLIC ${H_DIR})

## Execution Target - Linking Internal Libraries
target_link_libraries(${EXE_TARGET} PUBLIC LibDummyModule1)

## Execution Target - Compile Flags
target_compile_options(${EXE_TARGET} PUBLIC
    $<$<CONFIG:Debug>:${COMPILATION_C_DEBUG_FLAGS}>
    $<$<CONFIG:Release>:${COMPILATION_C_RELEASE_FLAGS}>
)

## Execution Target - Linking Flags
target_link_options(${EXE_TARGET} PUBLIC
    $<$<CONFIG:Debug>:${LINKING_C_DEBUG_FLAGS}>
    $<$<CONFIG:Release>:${LINKING_C_RELEASE_FLAGS}>
)

