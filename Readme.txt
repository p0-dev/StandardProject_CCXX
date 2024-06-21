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
# INTRODUCTION TO USER CONFIGURATION FILE
# =======================================================================================
# File name     : UserConfig.cfg
# Location      : Project root directory

The file is used for storing required/optional configuration from end-users

# ---------------------------------------------------------------------------------------
# REQUIRED CONFIGURATIONS
# ---------------------------------------------------------------------------------------
# NAME                          | DESCRIPTION
# ---------------------------------------------------------------------------------------
# USERCFG_TOOLCHAIN_CMAKE_FILE  | Specifying toolchain .cmake file for the build process
#                               | The build process requires users to provide toolchains.
#                               | Thus, the users should create <User-Define>.cmake, 
#                               | inside directory <Toolchain> for specifying the 
#                               | toolchain. Please use the template file for 
#                               | more information.
# ---------------------------------------------------------------------------------------
# USERCFG_TOOLCHAIN_BUILD_TOOL  | The build process requires the users to provide 
#                               | build tool command, in the default case, it is Ninja.
#                               | Note: Please add the build tool to your Path (System).     
# ---------------------------------------------------------------------------------------
# USERCFG_PROJECT_NAME          | The users need to provide project name, 
#                               | follow requirements of the project.
# ---------------------------------------------------------------------------------------
# USERCFG_BUILD_CONFIGURATION   | By default, the users have 2 options for 
#                               | build configurations: Debug / Release.
#                               | In order to add more, please check with scripts files 
#                               | and CMakeLists files.
# ---------------------------------------------------------------------------------------
# USERCFG_INSTALL_DIR           | In order to install the project into the user's 
#                               | host machines, the configuration could be used for 
#                               | specifying the location, the Installing process will
#                               | automatically do the rest.
# ---------------------------------------------------------------------------------------


# =======================================================================================
# OVERVIEW OF BUILDING / INSTALLING
# =======================================================================================

+ ------------------- + 
+ CMAKE: Cleaning     +
+ ------------------- + 
(Before all process, please run the script Clean for housekeeping task)
|
|
+ ------------------- + 
+ CMAKE: Generation   +
+ ------------------- + 
|
|
-->     + ------------------- + 
        + CMAKE: Building     +
        + ------------------- + 
        (Generation / Building processes are using the same script file Build)
|
|
-->             + ------------------- + 
                + CMAKE: Installation +
                + ------------------- + 
                (Installation process is using the script file Install)
                (Note: make sure to configue USERCFG_INSTALL_DIR (UserConfig.cfg))


# =======================================================================================
# CLEANING PROCESS
# =======================================================================================
The cleaning scripts could be acesses through <Script>/<Win>/Clean.bat or 
<Script>/<Linux>/Clean.sh depended on the host platform.

The cleaning scripts will remove all previous results file and create necessary 
directories for storing new results file.

Note: please run cleaning script before building script.


# =======================================================================================
# BUILD PROCESS
# =======================================================================================
In order to build the project, the users could use the script files located inside 
directory <Script>/<Win>/ or <Script>/<Linux>/

For example, please run the script <Script>/<Win>/Build.bat for building the project.


# =======================================================================================
# INSTALLATION PROCESS
# =======================================================================================
The installation process will install targets to your host system.

For example, please run the script <Script>/<Win>/Install.bat for installation.


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
