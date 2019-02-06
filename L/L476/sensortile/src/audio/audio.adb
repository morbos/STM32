with STM32.GPIO;         use STM32.GPIO;
with Log;                use Log;
with Utils;              use Utils;
with Ada.Numerics;       use Ada.Numerics;

package body Audio is

   SampleSize : array (ValIdx) of UInt16;
   Freq       : Short_Float := 440.0; -- inital freq
   Idx        : ValIdx; --     buffer switch

   --  Prepare one cycle of samples at the requested F (* 2 for stereo)
   --  Fills in one of the two buffers in the system and returns the total
   --  number of samples which varies depending on the freq.
   procedure Initialize_Wave
     (Samp  : out Value_Array;
      Freq  : Short_Float;
      Vol   : Short_Float;
      Total : out UInt16)
   is
      TwoPi  : Short_Float := 2.0 * Pi;
      N      : Short_Float := (SampleRate / Freq);
      Inc    : Short_Float := (TwoPi / N);
      X      : Short_Float;
      Tmp    : Short_Float;
   begin
      Tmp := 0.0;
      Total := UInt16 (Short_Float'Ceiling (N));
      for I in 0 .. Total - 1 loop
         X := Sin (Tmp) * Vol;
         Samp (Integer (I)).L := Integer_16 (X * 32767.0);
         Samp (Integer (I)).R := Integer_16 (X * 32767.0);
         Tmp := Tmp + Inc;
      end loop;
      Total := Total * 2; --  Stereo
   end Initialize_Wave;

   --  Sets up all the plumbing for raw samples to pass from memory via dma
   --  to peripheral, through the SAI dest: codec
   procedure Initialize_Audio
   is
      SAI_Pins      : constant GPIO_Points :=
        (SAI2_MCLK_A, SAI2_SCK_A, SAI2_SD_A, SAI2_FS_A);
   begin
      --  Preload two waves.
      Initialize_Wave
        (Sample_Buffers (ValIdx'First),
         Freq,
         0.0,
         SampleSize (ValIdx'First));
      Initialize_Wave
        (Sample_Buffers (ValIdx'Last),
         Freq,
         0.0,
         SampleSize (ValIdx'Last));
      Enable_Clock (SAI_2);
      Enable_Clock (SAI_Pins);

      --  Configure the DMA channel to the SAI peripheral
      Enable_Clock (Audio_DMA_1);
      Disable (Audio_DMA_1, Audio_DMA_1_Chan_6);
      Configure
        (Audio_DMA_1,
         Audio_DMA_1_Chan_6,
         (Channel                      => Audio_DMA_1_Chan_6,
          Direction                    => Memory_To_Peripheral,
          Increment_Peripheral_Address => False,
          Increment_Memory_Address     => True,
          Peripheral_Data_Format       => HalfWords,
          Memory_Data_Format           => HalfWords,
          Operation_Mode               => Normal_Mode,
          Priority                     => Priority_High,
          FIFO_Enabled                 => True,
          FIFO_Threshold               => FIFO_Threshold_Full_Configuration,
          Memory_Burst_Size            => Memory_Burst_Single,
          Peripheral_Burst_Size        => Peripheral_Burst_Single,
          CS                           => 1));
      Clear_All_Status (Audio_DMA_1, Audio_DMA_1_Chan_6);

      Configure_IO
        (SAI_Pins,
         (Mode        => Mode_AF,
          Output_Type => Push_Pull,
          Speed       => Speed_High,
          Resistors   => Floating));
      Configure_Alternate_Function (SAI_Pins, SAI_Pins_AF);

      Disable (This => Audio_SAI, Block => Block_A);
      --  Enable SAI2
      Configure_Audio_Block
        (This            => Audio_SAI,
         Block           => Block_A,
         Frequency       => UInt32 (SampleRate),
         Stereo_Mode     => Stereo,
         Mode            => Master_Transmitter,
         MCD_Enabled     => True,
         Protocol        => Free_Protocol,
         Data_Size       => Data_16b,
         Endianness      => Data_MSB_First,
         Clock_Strobing  => Clock_Strobing_Rising_Edge,
         Synchronization => Asynchronous_Mode,
         Output_Drive    => Drive_Immediate,
         FIFO_Threshold  => FIFO_1_Quarter_Full,
         Tristate_Mgt    => SD_Line_Driven,
         Companding_Mode => No_Companding);

      STM32.SAI.Configure_Block_Frame
        (Audio_SAI,
         Block_A,
         Frame_Length => 32,
         Frame_Active => 16,
         Frame_Sync   => FS_Frame_And_Channel_Identification,
         FS_Polarity  => FS_Active_Low,
         FS_Offset    => Before_First_Bit);

      STM32.SAI.Configure_Block_Slot
        (Audio_SAI,
         Block_A,
         First_Bit_Offset => 0,
         Slot_Size        => Slot_16b,
         Number_Of_Slots  => 2,
         Enabled_Slots    => Slot_0 or Slot_1);

      Start_Transfer_with_Interrupts
        (This               => Audio_DMA_1,
         Channel            => Audio_DMA_1_Chan_6,
         Source             => Sample_Buffers (ValIdx'First)'Address,
         Destination        => Audio_SAI.ADR'Address,
         Data_Count         => SampleSize (ValIdx'First),
         Enabled_Interrupts => (Transfer_Complete_Interrupt => True,
                                others                      => False));

      Enable (This => Audio_SAI, Block => Block_A);
      Enable_DMA (Audio_SAI, Block_A);
      Idx := ValIdx'First;
   end Initialize_Audio;

   --  Based on the acc and mag, make decisions about
   --  what the vol and freq need to be
   procedure SetFreq (Y : Integer_16; Dist : Integer_16)
   is
      F       : Short_Float;
      LY      : Integer_16 := Y;
      Fvol    : Short_Float;
      Vinc    : constant Short_Float := 1.0 / 2000.0;
      Finc    : constant Short_Float := 2000.0 / 2900.0;
   begin
      --  +/- 1g for the range.
      if LY > 1000 or LY < -1000 then
         return;
      end if;
      --  Use LY for volume. -1000 .. 1000
      Fvol := Short_Float (LY + 1000) * Vinc;

      --  Freq
      --  Dist can be ~0 - 3000
      --              100hz - 3000hz
      F := (Short_Float (Dist) * Finc) + 100.0;

      --  Cap the Freq at 100 .. 3000
      if F <= 100.0 then
         F := 100.0;
      elsif F >= 3000.0 then
         F := 3000.0;
      end if;

      --  Cap the sine ampl in the range 0 .. 1
      if Fvol < 0.0 then
         Fvol := 0.0;
      elsif Fvol > 1.0 then
         Fvol := 1.0;
      end if;

      Initialize_Wave (Sample_Buffers (Idx + 1), F, Fvol, SampleSize (Idx + 1));
      Idx := Idx + 1;
      Freq := F;
   end SetFreq;

   --  This is semi-radioactive vvvvv
   --  this procedure executes at the highest pri and is invoked
   --  from the vector table directly.
   procedure Audio_Buffer_Reload
   is
   begin
      Clear_Status (DMA_1, Channel_6, Transfer_Complete_Indicated);

      Disable (Audio_DMA_1, Audio_DMA_1_Chan_6);

      Configure_Data_Flow
        (This               => Audio_DMA_1,
         Channel            => Audio_DMA_1_Chan_6,
         Source             => Sample_Buffers (Idx)'Address,
         Destination        => Audio_SAI.ADR'Address,
         Data_Count         => SampleSize (Idx));

      Enable (Audio_DMA_1, Audio_DMA_1_Chan_6);
   end Audio_Buffer_Reload;

end Audio;
