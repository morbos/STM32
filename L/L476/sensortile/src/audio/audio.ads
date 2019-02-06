with Peripherals;     use Peripherals;
with HAL;             use HAL;
with STM32.Device;    use STM32.Device;
with STM32.SAI;       use STM32.SAI;
with STM32.DMA;       use STM32.DMA;
with PCM1774_I2C;     use PCM1774_I2C;
with Interfaces;      use Interfaces;
with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Numerics.Short_Elementary_Functions;
use Ada.Numerics.Short_Elementary_Functions;

package Audio is

   Audio_SAI             : SAI_Controller renames SAI_2;
   Audio_DMA_1           : DMA_Controller renames DMA_1;
   Audio_DMA_1_Chan_6    : DMA_Channel_Selector := Channel_6;
   PCM1774               : PCM1774_Codec   (PCM1774_Port'Access);

   SampleRate : constant Short_Float := 48_000.0;

   type Sample is record
      L : Integer_16;
      R : Integer_16;
   end record;
   type ValIdx is mod 2;  --  Used to switch buffers 0 .. 1. also: 1 + 1 -> 0
   type Value_Array is array (0 .. 1023) of Sample;
   Sample_Buffers : array (ValIdx) of Value_Array;

   procedure Initialize_Audio;
   procedure Initialize_Wave
     (Samp  : out Value_Array;
      Freq  : Short_Float;
      Vol   : Short_Float;
      Total : out UInt16);
   procedure Audio_Buffer_Reload;
   procedure SetFreq (Y : Integer_16; Dist : Integer_16);

   --  handlers.S has a .word for DMA1_CH6 that is bound by this to Audio_Buffer_Reload
   pragma Export (C, Audio_Buffer_Reload, "DMA1_CH6_IRQ");

end Audio;
