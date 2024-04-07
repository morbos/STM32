pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package ble_list_h is

   type u_tListNode;
   type u_tListNode is record
      next : access u_tListNode;  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_list.h:19
      prev : access u_tListNode;  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_list.h:20
   end record;
   pragma Convention (C_Pass_By_Copy, u_tListNode);  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_list.h:18

   subtype tListNode is u_tListNode;  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_list.h:21

   type pListNode is access all u_tListNode;  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_list.h:21

end ble_list_h;
