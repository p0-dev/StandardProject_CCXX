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
** NAME             | DummyModule2.c
** --------------------------------------------------------------------------------------
** LOCATION         | Root/Codebase/Source/DummyModule2/DummyModule2.c
** --------------------------------------------------------------------------------------
** DESCRIPTION      | Implementation file for DummyModule2
-------------------------------------------------------------------------------------- */


// ======================================================================================
// INCLUDE - MAIN
// ======================================================================================
#include "StandardProject/DummyModule2/DummyModule2.h"


// ======================================================================================
// INCLUDE - INTERNAL
// ======================================================================================
#include "StandardProject/DummyModule3/DummyModule3.h"


// ======================================================================================
// INCLUDE - STANDARD LIBRARIES
// ======================================================================================
#include <stdio.h>


// ======================================================================================
// IMPLEMENTATION - API FUNCTIONS
// ======================================================================================

/**
 * @name DummyModule2_Function1
 * @param in void
 * @param out void
 * @return void
 */
extern void DummyModule2_Function1 (void)
{
    printf("DummyModule2_Function1\n");
    DummyModule3_Function1();
}