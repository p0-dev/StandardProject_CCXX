# =======================================================================================
# COPY RIGHT
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
# INTRODUCTION
# =======================================================================================
The standard project is intended as a baseline project for further development with 
CMake / Ninja and for C/C++ project.


# =======================================================================================
# BRANCH STRUCTURE FOR WORKING WITH GIT/GITHUB
# =======================================================================================

+----------------------------+
|   Project branches         |
+----------------------------+
|
|
--> +-------------------------+
    |     Git branch: main    |
    +-------------------------+
    (Empty branch, for cloning an empty and cleaned branch)
|
|
--> +-------------------------+
    |     Git branch: dev     |
    +-------------------------+
    (Main development branch, for working with development of the project)
    |
    |
    --> +----------------------------+
        | Git branch: feature/module1|
        +----------------------------+
        (Feature branch, for working with smaller feature)
    |
    |
    --> +----------------------------+
        | Git branch: feature/module2|
        +----------------------------+
        (Feature branch, for working with smaller feature)
|
|
--> +-------------------------+
    |  Git branch: staging    |
    +-------------------------+
    (Stating branch, for UT/IT, preparing the project for release)
|
|
--> +-------------------------+
    |  Git branch: release    |
    +-------------------------+
    (Release branch, for production project)