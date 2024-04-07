pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package osal_c is

   function Osal_MemCpy
     (dest : System.Address;
      src : System.Address;
      size : unsigned) return System.Address;  -- /backup/ada/STM32/L/L476/merge_l476/src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/utils/osal.c:50
   pragma Import (C, Osal_MemCpy, "Osal_MemCpy");

   function Osal_MemSet
     (ptr : System.Address;
      value : int;
      size : unsigned) return System.Address;  -- /backup/ada/STM32/L/L476/merge_l476/src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/utils/osal.c:59
   pragma Import (C, Osal_MemSet, "Osal_MemSet");

end osal_c;
