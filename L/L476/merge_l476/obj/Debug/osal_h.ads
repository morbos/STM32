pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_ustdint_h;

package osal_h is

   function Osal_Get_Cur_Time return sys_ustdint_h.uint32_t;  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/osal.h:78
   pragma Import (C, Osal_Get_Cur_Time, "Osal_Get_Cur_Time");

end osal_h;
