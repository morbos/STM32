with STM32.GPIO;      use STM32.GPIO;
with HAL;             use HAL;
with HAL.SPI;
with System;

package SPI_EEprom is

   type EEprom_Address_Bytes is (Two_Byte, Three_Byte, Four_Byte);

   type EEprom_Commands is (WRSR, WRITE, READ, WRDI, RDSR, WREN);

   for EEprom_Commands use
     (
      WRSR  => 2#0000_0001#,
      WRITE => 2#0000_0010#,
      READ  => 2#0000_0011#,
      WRDI  => 2#0000_0100#,
      RDSR  => 2#0000_0101#,
      WREN  => 2#0000_0110#
     );

   for EEprom_Commands'Size use 8;

   --  Control/status register (RCC_CSR)
   type SR_Register is record
      RDYB           : Boolean := False;
      WEN            : Boolean := False;
      BP             : HAL.UInt2;
      Reserved       : HAL.UInt3;
      WPEN           : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 8,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      RDYB           at 0 range 0 .. 0;
      WEN            at 0 range 1 .. 1;
      BP             at 0 range 2 .. 3;
      Reserved       at 0 range 4 .. 6;
      WPEN           at 0 range 7 .. 7;
   end record;

   type Cell4
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            Val : HAL.UInt32;
         when True =>
            Arr : HAL.SPI.SPI_Data_8b (1 .. 4);
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access;


   type EEprom
     (Port  : not null HAL.SPI.Any_SPI_Port) is limited private;

   procedure Initialize (This         : in out EEprom;
                         CS           : in out GPIO_Point;
                         Address_Size : EEprom_Address_Bytes;
                         Size         : UInt32);

   function GetStatus (This : EEprom;
                       CS   : in out GPIO_Point)
                      return SR_Register;

   function EEprom_Size (This : EEprom) return UInt32;

   function WriteableP (This : EEprom;
                        CS   : in out GPIO_Point) return Boolean;

   procedure WriteEnable (This : EEprom;
                          CS   : in out GPIO_Point);

   procedure WriteDisable (This : EEprom;
                           CS   : in out GPIO_Point);

   procedure Read4 (This   : EEprom;
                    CS     : in out GPIO_Point;
                    Addr   : UInt32;
                    Result : out Cell4;
                    Status : out HAL.SPI.SPI_Status) with
     Pre => Addr <= EEprom_Size (This) - 4; --  -4 so we don't go over the end

   procedure Write4 (This   : EEprom;
                     CS     : in out GPIO_Point;
                     Addr   : UInt32;
                     Data   : Cell4;
                     Status : out HAL.SPI.SPI_Status) with
     Pre => (Addr <= (EEprom_Size (This) - 4))
            and
            (WriteableP (This, CS));

private

   type EEprom (Port : not null HAL.SPI.Any_SPI_Port)
   is limited record
      Size         : UInt32;
      Address_Size : EEprom_Address_Bytes;
   end record;

end SPI_EEprom;
