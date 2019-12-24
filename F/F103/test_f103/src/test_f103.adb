with HAL;           use HAL;
procedure Test_F103
is
   type Font_Array is array (Integer range <>) of UInt8;

   Font1 : aliased Font_Array := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                  0, 0, 0, 0, 0);

   Chr_F16_23 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#24#, 16#24#, 16#24#, 16#FF#, 16#24#, 16#24#,
        16#FF#, 16#24#,    --  row 1 - 11
        16#24#, 16#24#, 16#00#, 16#00#, 16#00#
        --  row 12 - 16
            );

   Chr_F16_24 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#3C#, 16#42#, 16#40#, 16#40#, 16#70#, 16#40#,
        16#70#, 16#40#,    --  row 1 - 11
        16#40#, 16#FE#, 16#00#, 16#00#, 16#00#
        --  row 12 - 16
        );


   type Fa_Ptr is access constant Font_Array;

   type Chrtbl_F16_T is array (Integer range <>) of Fa_Ptr;

   Chrtbl_F16 : Chrtbl_F16_T := (Chr_F16_23'Access, Chr_F16_24'Access);

begin
   loop
      null;
   end loop;
end Test_F103;
