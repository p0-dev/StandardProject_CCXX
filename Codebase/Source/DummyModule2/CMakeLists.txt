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
# NAME              | CMakeLists.txt (DummyModule2)
# ---------------------------------------------------------------------------------------
# LOCATION          | Root/Codebase/Source/DummyModule2/CMakeLists.txt
# ---------------------------------------------------------------------------------------
# CONTENT           | Specification of header and source for DummyModule2
# ---------------------------------------------------------------------------------------


# =======================================================================================
# CONSTANTS
# =======================================================================================
message("-- [INFO] Building target: DummyModule2")
message("-- [INFO] -----------------------------")
set(TARGET DummyModule2)


# message(FATAL_ERROR "STOP")
# =======================================================================================
# SOURCE
# =======================================================================================
set(TARGET_SRC DummyModule2.c)
message("-- [INFO] ${TARGET}'s Source: ${TARGET_SRC}")


# =======================================================================================
# HEADER
# =======================================================================================
set(TARGET_HEADER ${H_DIR})
message("-- [INFO] ${TARGET}'s Header: ${TARGET_HEADER}")


# =======================================================================================
# TARGET - DUMMY MODULE 2
# =======================================================================================

# Main Target
add_library(${TARGET} STATIC ${TARGET_SRC})

# Include Directory
target_include_directories(${TARGET} PUBLIC ${TARGET_HEADER})

# Compilation Flags
target_compile_options(${TARGET} PUBLIC
    $<$<CONFIG:Debug>:${COMPILE_DEBUG_FLAG}>
    $<$<CONFIG:Release>:${COMPILE_RELEASE_FLAG}>
)

# Target Dependancy
## DummyModule3
target_link_libraries(${TARGET} PRIVATE ${DummyModule3_TARGET})
message("-- [INFO] Link: ${DummyModule3_TARGET}")

# Installation
install(TARGETS ${TARGET} DESTINATION ${DEFAULT_INSTALL_LIBRARY_DIR})
message("-- [INFO] Installing at ${CMAKE_SOURCE_DIR}/${DEFAULT_INSTALL_DIR}/${DEFAULT_INSTALL_LIBRARY_DIR}")  