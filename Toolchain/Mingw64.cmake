# =======================================================================================
# DEFINITION: TOOLCHAIN
# =======================================================================================
set(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc)
set(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++)

# =======================================================================================
# DEFINITION: BUILD FLAGS: DEBUG
# =======================================================================================
add_compile_options($<$<CONFIG:Debug>:-Wall>)
add_compile_options($<$<CONFIG:Debug>:-DDebugCompileFlag=1>)

# =======================================================================================
# DEFINITION: LINKING FLAGS: DEBUG
# =======================================================================================
add_link_options($<$<CONFIG:Debug>:-Wall>)
add_link_options($<$<CONFIG:Debug>:-DDebugLinkingFlag=1>)

# =======================================================================================
# DEFINITION: BUILD FLAGS: RELEASE
# =======================================================================================
add_compile_options($<$<CONFIG:Release>:-Wall>)
add_compile_options($<$<CONFIG:Release>:-DReleaseCompileFlag=1>)

# =======================================================================================
# DEFINITION: LINKING FLAGS: RELEASE
# =======================================================================================
add_link_options($<$<CONFIG:Release>:-Wall>)
add_link_options($<$<CONFIG:Release>:-DReleaseLinkingFlag=1>)