with HAL;              use HAL;
with STM32.Device;     use STM32.Device;
with STM32.GPIO;       use STM32.GPIO;
with STM32.SAU;        use STM32.SAU;
with STM32.MPU;        use STM32.MPU;
with STM32_SVD.RCC;    use STM32_SVD.RCC;
with STM32_SVD.GTZC;   use STM32_SVD.GTZC;
with STM32_SVD.ICache; use STM32_SVD.ICache;
with System;

with System.Machine_Code; use System.Machine_Code;

package CM33 is

   type Test_Target_Response is record
      IRegion : UInt8;
      IRvalid : Boolean;
      Secure  : Boolean;
      NSRW    : Boolean;
      NSR     : Boolean;
      RW      : Boolean;
      R       : Boolean;
      SRvalid : Boolean;
      MRvalid : Boolean;
      SRegion : UInt8;
      MRegion : UInt8;
   end record
     with Size => 32, Bit_Order => System.Low_Order_First;

   for Test_Target_Response use record
      IRegion  at 0 range 24 .. 31;
      IRvalid  at 0 range 23 .. 23;
      Secure   at 0 range 22 .. 22;
      NSRW     at 0 range 21 .. 21;
      NSR      at 0 range 20 .. 20;
      RW       at 0 range 19 .. 19;
      R        at 0 range 18 .. 18;
      SRvalid  at 0 range 17 .. 17;
      MRvalid  at 0 range 16 .. 16;
      SRegion  at 0 range 8 .. 15;
      MRegion  at 0 range 0 .. 7;
   end record;

   procedure Init_MPU;
   procedure Enable_MCO;
   procedure Enable_GTZC_SRAM;
   procedure Enable_ICACHE;
   procedure Init_CM33;

   function Test_Address (Addr : System.Address) return Test_Target_Response;
   function Test_Address_Helper (Addr : System.Address) return UInt32;
   pragma Import (C, Test_Address_Helper, "test_address_helper");

end CM33;
