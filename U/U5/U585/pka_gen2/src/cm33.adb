with System;

package body CM33 is

   procedure Init_MPU
   is
      Ram : Attr_Type := (Outer => 4, Inner => 4);
      Rom : Attr_Type := (Outer => 4, Inner => 5);
      Dev : Attr_Type := (Outer => 0, Inner => 0);
   begin
      Add_Attrib (AttrIdx => 0, Attrib => Ram);
      Add_Attrib (AttrIdx => 1, Attrib => Dev);
      Add_Attrib (AttrIdx => 2, Attrib => Rom);
      Add_Region (Region_Num => 0,
                  Addr       => 16#2000_0000#,
                  Size       => (786 * 1024) - 1,
                  AttIdx     => 0);
      Add_Region (Region_Num => 1,
                  Addr       => 16#5000_0000#,
                  Size       => 16#1000_0000# - 1,
                  AttIdx     => 1);
      Add_Region (Region_Num => 2,
                  Addr       => 16#4000_0000#,
                  Size       => 16#1000_0000# - 1,
                  AttIdx     => 1);
      Add_Region (Region_Num => 3,
                  Addr       => 16#E000_0000#,
                  Size       => 16#1000_0000# - 1,
                  AttIdx     => 1);
      Add_Region (Region_Num => 4,
                  Addr       => 16#0800_0000#,
                  Size       => 16#0020_0000# - 1,
                  AttIdx     => 2);
      Enable_MPU;
   end Init_MPU;

   procedure Init_CM33
   is
   begin
      Init_MPU;
   end Init_CM33;

end CM33;
