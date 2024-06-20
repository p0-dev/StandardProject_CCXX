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
# AUTHOR
# =======================================================================================
# NAME      | Thanh Tran (tt)
# ---------------------------------------------------------------------------------------
# CONTACT   | thanhvpt11235@gmail.com
# ---------------------------------------------------------------------------------------


# =======================================================================================
# INTRODUCTION
# =======================================================================================
The project called "StandardProject_CCXX" is used as a standard C/C++ project (baseline) 
for further development. Depends on the future project requirement, a lot of elements 
from this StandardProject_CCXX could be changed.

The project introduction will be start with User Configuration (UserConfig.cfg) and
expands to other elements of the project


# =======================================================================================
# RECOMMENDED BRANCH STRUCTURE FOR WORKING WITH GIT/GITHUB
# =======================================================================================

+ ---------------- + 
+ Branch: main     +
+ ---------------- + 
(Keep clean, with only CopyRight.txt and ReadMe.txt, required info)

+ ---------------- + 
+ Branch: dev      + 
+ ---------------- + 
(Development branch, updated with newest code)
|
|
-->     + ----------------------- + 
        + Branch: feature/module1 + 
        + ----------------------- + 
        (Feature branch, development feature and merge with branch: dev)
|
|
-->     + ----------------------- + 
        + Branch: feature/module2 + 
        + ----------------------- + 
        (Feature branch, development feature and merge with branch: dev)
|
|
-->     + ----------------------- + 
        + Branch: feature/module3 + 
        + ----------------------- + 
        (Feature branch, development feature and merge with branch: dev)


+ ---------------- + 
+ Branch: staging  + 
+ ---------------- + 
(Staging branch, for testing. Merge with branch: dev for getting updated source to test)

+ ---------------- + 
+ Branch: release  + 
+ ---------------- + 
(Release branch, for release/production. Merge with branch: staging after test)
