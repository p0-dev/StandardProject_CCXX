/* ======================================================================================
** COPY RIGHT / LEFT
** ======================================================================================
**  (C) 2024 Hardware And Software Solution (HASS)
**  (C) 2024 Thanh Tran / Nhuan Tran
**  (C) 2024 Khai Tran / Vy Tran
**
**  Confidential Proprietary Information. Distribution Limited.
**
**  This source code is permitted to be used only in projects contracted
**  with HASS and Thanh Tran/Khai Tran/Vy Tran, and any other use is prohibited.
**  If you use it for other purposes or change the source code,
**  you may take legal responsibility and
**
**  FUCK YOU!.
**
**  In this case, there is no warranty and technical support.
-------------------------------------------------------------------------------------- */


/* ======================================================================================
** FILE INFORMATION
** ======================================================================================
** NAME             | DummyModule1.c
** --------------------------------------------------------------------------------------
** LOCATION         | Root/Codebase/Source/DummyModule1.c
** --------------------------------------------------------------------------------------
** DESCRIPTION      | Implementation of DummyModule1
-------------------------------------------------------------------------------------- */


// ======================================================================================
// INCLUDE - DUMMY MODULE 1
// ======================================================================================
#include "StandardProject/DummyModule1/DummyModule1.h"


// ======================================================================================
// INCLUDE - INTERNAL LIBRARIES
// ======================================================================================
#include "StandardProject/DummyModule3/DummyModule3.h"


// ======================================================================================
// INCLUDE - STANDARD LIBRARY
// ======================================================================================
#include <stdio.h>


// ======================================================================================
// IMPLEMENTATION - FUNCTIONS
// ======================================================================================

/**
 * @name DummyModule1_Function1
 * @return void
 * @param input void
 * @param output Dummy message on console
 */
extern void DummyModule1_Function1 (void)
{
    printf("DummyModule1_Function1\n");
    DummyModule3_Function1();
}