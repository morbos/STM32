pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_ustdint_h;

package hal_types_h is

   --  arg-macro: function htobs (d)
   --    return d;
   --  arg-macro: function htobl (d)
   --    return d;
   --  arg-macro: function btohs (d)
   --    return d;
   --  arg-macro: function btohl (d)
   --    return d;
   TRUE : constant := (1);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/hal_types.h:48

   FALSE : constant := (0);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/hal_types.h:52

   subtype BOOL is sys_ustdint_h.uint8_t;  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/hal_types.h:45

end hal_types_h;
