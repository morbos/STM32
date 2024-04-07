pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_ustdint_h;

package hal_h is

   --  arg-macro: function LE_TO_HOST_16 (ptr)
   --    return uint16_t) ( ((uint16_t) *((uint8_t *)ptr)) or ((uint16_t) *((uint8_t *)ptr + 1) << 8 ) ;
   --  arg-macro: function LE_TO_HOST_32 (ptr)
   --    return uint32_t) ( ((uint32_t) *((uint8_t *)ptr)) or ((uint32_t) *((uint8_t *)ptr + 1) << 8) or ((uint32_t) *((uint8_t *)ptr + 2) << 16) or ((uint32_t) *((uint8_t *)ptr + 3) << 24) ;
   --  arg-macro: function BE_TO_HOST_16 (ptr)
   --    return uint16_t) ( ((uint16_t) *((uint8_t *)ptr)) << 8 or ((uint16_t) *((uint8_t *)ptr + 1) ) ;
   --  arg-macro: function HOST_TO_LE_16 (buf, val)
   --    return  ((buf)(0) := (uint8_t) (val) ) , ((buf)(1) := (uint8_t) (val>>8) ) ;
   --  arg-macro: function HOST_TO_LE_32 (buf, val)
   --    return  ((buf)(0) := (uint8_t) (val) ) , ((buf)(1) := (uint8_t) (val>>8) ) , ((buf)(2) := (uint8_t) (val>>16) ) , ((buf)(3) := (uint8_t) (val>>24) ) ;
   --  arg-macro: function HOST_TO_BE_16 (buf, val)
   --    return  ((buf)(1) := (uint8_t) (val) ) , ((buf)(0) := (uint8_t) (val>>8) ) ;
   --  arg-macro: procedure DISABLE_INTERRUPTS ()
   --    __disable_interrupt()
   --  arg-macro: procedure ENABLE_INTERRUPTS ()
   --    __enable_interrupt()
   --  arg-macro: procedure SAVE_PRIMASK ()
   --    uint32_t uwPRIMASK_Bit := __get_PRIMASK()
   --  arg-macro: procedure ATOMIC_SECTION_BEGIN ()
   --    uint32_t uwPRIMASK_Bit := __get_PRIMASK(); __disable_interrupt();
   --  arg-macro: procedure ATOMIC_SECTION_END ()
   --    __set_PRIMASK(uwPRIMASK_Bit)
   procedure Enable_SPI_IRQ;  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/hal.h:83
   pragma Import (C, Enable_SPI_IRQ, "Enable_SPI_IRQ");

   procedure Disable_SPI_IRQ;  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/hal.h:88
   pragma Import (C, Disable_SPI_IRQ, "Disable_SPI_IRQ");

   procedure Hal_Init_Timer;  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/hal.h:90
   pragma Import (C, Hal_Init_Timer, "Hal_Init_Timer");

   function Hal_Get_Timer_Value return sys_ustdint_h.uint32_t;  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/hal.h:91
   pragma Import (C, Hal_Get_Timer_Value, "Hal_Get_Timer_Value");

   procedure Hal_Start_Timer (arg1 : sys_ustdint_h.uint32_t);  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/hal.h:92
   pragma Import (C, Hal_Start_Timer, "Hal_Start_Timer");

   procedure Hal_Stop_Timer;  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/hal.h:93
   pragma Import (C, Hal_Stop_Timer, "Hal_Stop_Timer");

end hal_h;
