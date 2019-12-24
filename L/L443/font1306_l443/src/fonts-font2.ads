with Fonts; use Fonts;

package Fonts.Font2 is

   Chr_Hgt_F16 : constant UInt8 := 16;

   type Font2_Range is range 16#20# .. 16#7f#;

   type Width_Font2_Array is array (Font2_Range) of UInt8;

   Widtbl_Font2_F16 : constant Width_Font2_Array :=         -- character width table
     (
        6, 3, 4, 9, 8, 9, 9, 3,             --  char 32 - 39
        7, 7, 8, 6, 3, 6, 5, 7,             --  char 40 - 47
        8, 8, 8, 8, 8, 8, 8, 8,             --  char 48 - 55
        8, 8, 3, 3, 6, 6, 6, 8,             --  char 56 - 63
        9, 8, 8, 8, 8, 8, 8, 8,             --  char 64 - 71
        8, 4, 8, 8, 7, 10, 8, 8,            --  char 72 - 79
        8, 8, 8, 8, 8, 8, 8, 10,            --  char 80 - 87
        8, 8, 8, 4, 7, 4, 7, 9,             --  char 88 - 95
        4, 7, 7, 7, 7, 7, 6, 7,             --  char 96 - 103
        7, 4, 5, 6, 4, 8, 7, 8,             --  char 104 - 111
        7, 8, 6, 6, 5, 7, 8, 8,             --  char 112 - 119
        6, 7, 7, 5, 3, 5, 8, 6              --  char 120 - 127
     );

   --  type Chr_Range is range 16#20# .. 16#7f#;


   --  Row format, MSB left

   Chr_F16_20 : aliased constant Font_Array := (
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  --  row 1 - 11
        0, 0, 0, 0, 0);  --  row 12 - 16

   Chr_F16_21 : aliased constant Font_Array := (
        16#00#, 16#00#, 16#00#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#,    --  row 1 - 11
        16#00#, 16#40#, 16#00#, 16#00#, 16#00#);                                       --  row 12 - 16

   Chr_F16_22 : aliased constant Font_Array := (
        16#00#, 16#00#, 16#A0#, 16#A0#, 16#A0#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#,    --  row 1 - 11
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
                                       );

   Chr_F16_23 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#24#, 16#24#, 16#24#, 16#FF#, 16#24#, 16#24#, 16#FF#, 16#24#,    --  row 1 - 11
        16#24#, 16#24#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
                                       );

   Chr_F16_24 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#3C#, 16#42#, 16#40#, 16#40#, 16#70#, 16#40#, 16#70#, 16#40#,    --  row 1 - 11
        16#40#, 16#FE#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_25 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#61#, 16#91#, 16#92#, 16#64#, 16#08#, 16#10#, 16#26#, 16#49#,    --  row 1 - 11
        16#89#, 16#86#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_26 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#20#, 16#50#, 16#88#, 16#88#, 16#50#, 16#20#, 16#52#, 16#8C#,    --  row 1 - 11
        16#8C#, 16#73#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_27 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#40#, 16#40#, 16#40#, 16#80#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#,    -- row 1 - 11
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_28 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#0C#, 16#10#, 16#20#, 16#40#, 16#40#, 16#80#, 16#80#, 16#80#, 16#80#, 16#80#,   --  row 1 - 11
        16#40#, 16#40#, 16#20#, 16#10#, 16#0C#                                         --  row 12 - 16
        );

   Chr_F16_29 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#C0#, 16#20#, 16#10#, 16#08#, 16#08#, 16#04#, 16#04#, 16#04#, 16#04#, 16#04#,    --  row 1 - 11
        16#08#, 16#08#, 16#10#, 16#20#, 16#C0#                                         --  row 12 - 16
        );

   Chr_F16_2A : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#10#, 16#92#, 16#54#, 16#38#, 16#54#, 16#92#, 16#10#,    --  row 1 - 11
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_2B : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#20#, 16#20#, 16#F8#, 16#20#, 16#20#,    --  row 1 - 11
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_2C : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#,    --  row 1 - 11
        16#C0#, 16#C0#, 16#40#, 16#80#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_2D : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#F8#, 16#00#, 16#00#,    --  row 1 - 11
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_2E : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#,    --  row 1 - 11
        16#C0#, 16#C0#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_2F : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#04#, 16#04#, 16#08#, 16#08#, 16#10#, 16#10#, 16#20#, 16#20#, 16#40#,    --  row 1 - 11
        16#40#, 16#80#, 16#80#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_30 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#38#, 16#44#, 16#44#, 16#82#, 16#82#, 16#82#, 16#82#, 16#44#,    --  row 1 - 11
        16#44#, 16#38#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_31 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#10#, 16#30#, 16#50#, 16#10#, 16#10#, 16#10#, 16#10#, 16#10#,    --  row 1 - 11
        16#10#, 16#7C#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_32 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#38#, 16#44#, 16#82#, 16#02#, 16#04#, 16#18#, 16#20#, 16#40#,    --  row 1 - 11
        16#80#, 16#FE#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_33 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#78#, 16#84#, 16#02#, 16#04#, 16#38#, 16#04#, 16#02#, 16#02#,    --  row 1 - 11
        16#84#, 16#78#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_34 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#04#, 16#0C#, 16#14#, 16#24#, 16#44#, 16#84#, 16#FE#, 16#04#,    --  row 1 - 11
        16#04#, 16#04#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_35 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#FC#, 16#80#, 16#80#, 16#80#, 16#F8#, 16#04#, 16#02#, 16#02#,    --  row 1 - 11
        16#84#, 16#78#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_36 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#3C#, 16#40#, 16#80#, 16#80#, 16#B8#, 16#C4#, 16#82#, 16#82#,    --  row 1 - 11
        16#44#, 16#38#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_37 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#7E#, 16#02#, 16#02#, 16#04#, 16#04#, 16#08#, 16#08#, 16#10#,    --  row 1 - 11
        16#10#, 16#10#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_38 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#38#, 16#44#, 16#82#, 16#44#, 16#38#, 16#44#, 16#82#, 16#82#,    --  row 1 - 11
        16#44#, 16#38#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_39 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#38#, 16#44#, 16#82#, 16#82#, 16#46#, 16#3A#, 16#02#, 16#02#,    --  row 1 - 11
        16#04#, 16#78#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_3A : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#C0#, 16#C0#, 16#00#, 16#C0#, 16#C0#,    --  row 1 - 11
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_3B : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#C0#, 16#C0#, 16#00#, 16#C0#, 16#C0#,    --  row 1 - 11
        16#40#, 16#80#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_3C : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#08#, 16#10#, 16#20#, 16#40#, 16#80#, 16#40#, 16#20#,    --  row 1 - 11
        16#10#, 16#08#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_3D : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#F8#, 16#00#, 16#F8#, 16#00#,    --  row 1 - 11
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_3E : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#80#, 16#40#, 16#20#, 16#10#, 16#08#, 16#10#, 16#20#,    --  row 1 - 11
        16#40#, 16#80#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_3F : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#38#, 16#44#, 16#82#, 16#02#, 16#04#, 16#08#, 16#10#, 16#10#,    --  row 1 - 11
        16#00#, 16#10#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_40 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#3C#, 16#42#, 16#99#, 16#A5#, 16#A5#, 16#A5#, 16#A5#, 16#9E#,    --  row 1 - 11
        16#40#, 16#3E#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );
   Chr_F16_41 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#10#, 16#10#, 16#28#, 16#28#, 16#44#, 16#44#, 16#7C#, 16#82#,    --  row 1 - 11
        16#82#, 16#82#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_42 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#F8#, 16#84#, 16#82#, 16#84#, 16#F8#, 16#84#, 16#82#, 16#82#,    --  row 1 - 11
        16#84#, 16#F8#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_43 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#3C#, 16#42#, 16#80#, 16#80#, 16#80#, 16#80#, 16#80#, 16#80#,    --  row 1 - 11
        16#42#, 16#3C#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );
   Chr_F16_44 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#F8#, 16#84#, 16#82#, 16#82#, 16#82#, 16#82#, 16#82#, 16#82#,    --  row 1 - 11
        16#84#, 16#F8#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_45 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#FE#, 16#80#, 16#80#, 16#80#, 16#FC#, 16#80#, 16#80#, 16#80#,    --  row 1 - 11
        16#80#, 16#FE#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_46 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#FE#, 16#80#, 16#80#, 16#80#, 16#F8#, 16#80#, 16#80#, 16#80#,    --  row 1 - 11
        16#80#, 16#80#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );
   Chr_F16_47 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#3C#, 16#42#, 16#80#, 16#80#, 16#80#, 16#9C#, 16#82#, 16#82#,    --  row 1 - 11
        16#42#, 16#3C#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_48 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#84#, 16#84#, 16#84#, 16#84#, 16#FC#, 16#84#, 16#84#, 16#84#,    --  row 1 - 11
        16#84#, 16#84#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_49 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#E0#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#,    --  row 1 - 11
        16#40#, 16#E0#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_4A : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#02#, 16#02#, 16#02#, 16#02#, 16#02#, 16#02#, 16#02#, 16#82#,    --  row 1 - 11
        16#44#, 16#38#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_4B : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#84#, 16#88#, 16#90#, 16#A0#, 16#C0#, 16#A0#, 16#90#, 16#88#,    --  row 1 - 11
        16#84#, 16#82#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_4C : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#80#, 16#80#, 16#80#, 16#80#, 16#80#, 16#80#, 16#80#, 16#80#,    --  row 1 - 11
        16#80#, 16#FC#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_4D : aliased constant Font_Array := (        --  2 unsigned chars per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#C1#, 16#80#, 16#C1#, 16#80#, 16#A2#,
                                                16#80#,    --  row 1 - 6
        16#A2#, 16#80#, 16#94#, 16#80#, 16#94#, 16#80#, 16#88#, 16#80#, 16#88#, 16#80#, 16#80#,
                                                16#80#,    --  row 7 - 12
        16#80#, 16#80#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#                             --  row 13 - 16
        );

   Chr_F16_4E : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#C2#, 16#C2#, 16#A2#, 16#A2#, 16#92#, 16#92#, 16#8A#, 16#8A#,    --  row 1 - 11
        16#86#, 16#86#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_4F : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#38#, 16#44#, 16#82#, 16#82#, 16#82#, 16#82#, 16#82#, 16#82#,    --  row 1 - 11
        16#44#, 16#38#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_50 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#F8#, 16#84#, 16#82#, 16#82#, 16#82#, 16#84#, 16#F8#, 16#80#,    --  row 1 - 11
        16#80#, 16#80#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );
   Chr_F16_51 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#38#, 16#44#, 16#82#, 16#82#, 16#82#, 16#82#, 16#82#, 16#82#,    --  row 1 - 11
        16#44#, 16#38#, 16#08#, 16#06#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_52 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#F8#, 16#84#, 16#82#, 16#82#, 16#84#, 16#F8#, 16#90#, 16#88#,    --  row 1 - 11
        16#84#, 16#82#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_53 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#38#, 16#44#, 16#82#, 16#80#, 16#60#, 16#1C#, 16#02#, 16#82#,    --  row 1 - 11
        16#44#, 16#38#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_54 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#FE#, 16#10#, 16#10#, 16#10#, 16#10#, 16#10#, 16#10#, 16#10#,    --  row 1 - 11
        16#10#, 16#10#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_55 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#82#, 16#82#, 16#82#, 16#82#, 16#82#, 16#82#, 16#82#, 16#82#,    --  row 1 - 11
        16#44#, 16#38#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_56 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#82#, 16#82#, 16#82#, 16#82#, 16#44#, 16#44#, 16#28#, 16#28#,    --  row 1 - 11
        16#10#, 16#10#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_57 : aliased constant Font_Array := (        --  2 unsigned chars per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#80#, 16#80#, 16#80#, 16#80#, 16#80#,
                                                16#80#,    --  row 1 - 6
        16#88#, 16#80#, 16#88#, 16#80#, 16#49#, 16#00#, 16#55#, 16#00#, 16#55#, 16#00#, 16#22#,
                                                16#00#,    --  row 7 - 12
        16#22#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#                             --  row 13 - 16
        );

   Chr_F16_58 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#82#, 16#82#, 16#44#, 16#28#, 16#10#, 16#10#, 16#28#, 16#44#,    --  row 1 - 11
        16#82#, 16#82#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_59 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#82#, 16#82#, 16#82#, 16#44#, 16#28#, 16#10#, 16#10#, 16#10#,    --  row 1 - 11
        16#10#, 16#10#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_5A : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#FE#, 16#02#, 16#04#, 16#08#, 16#10#, 16#10#, 16#20#, 16#40#,    --  row 1 - 11
        16#80#, 16#FE#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_5B : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#E0#, 16#80#, 16#80#, 16#80#, 16#80#, 16#80#, 16#80#, 16#80#, 16#80#,    --  row 1 - 11
        16#80#, 16#80#, 16#E0#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_5C : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#04#, 16#04#, 16#08#, 16#08#, 16#10#, 16#10#, 16#20#, 16#20#, 16#40#,    --  row 1 - 11
        16#40#, 16#80#, 16#80#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_5D : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#E0#, 16#20#, 16#20#, 16#20#, 16#20#, 16#20#, 16#20#, 16#20#, 16#20#,    --  row 1 - 11
        16#20#, 16#20#, 16#E0#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_5E : aliased constant Font_Array := (        --  1 unsigned chars per row
        16#00#, 16#10#, 16#28#, 16#44#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#,    --  row 1 - 11
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_5F : aliased constant Font_Array := (        --  1 unsigned chars per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#,    --  row 1 - 11
        16#00#, 16#00#, 16#00#, 16#FF#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_60 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#40#, 16#40#, 16#40#, 16#20#, 16#00#, 16#00#, 16#00#, 16#00#,    --  row 1 - 11
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_61 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#70#, 16#08#, 16#04#, 16#74#, 16#8C#,    --  row 1 - 11
        16#8C#, 16#74#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_62 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#80#, 16#80#, 16#B0#, 16#C8#, 16#84#, 16#84#, 16#84#,    --  row 1 - 11
        16#C8#, 16#B0#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_63 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#38#, 16#44#, 16#80#, 16#80#, 16#80#,    --  row 1 - 11
        16#44#, 16#38#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_64 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#04#, 16#04#, 16#34#, 16#4C#, 16#84#, 16#84#, 16#84#,    --  row 1 - 11
        16#4C#, 16#34#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_65 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#38#, 16#44#, 16#84#, 16#F8#, 16#80#,    --  row 1 - 11
        16#44#, 16#38#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_66 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#30#, 16#48#, 16#40#, 16#40#, 16#40#, 16#E0#, 16#40#, 16#40#,    --  row 1 - 11
        16#40#, 16#40#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );
   Chr_F16_67 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#30#, 16#4C#, 16#84#, 16#84#, 16#84#,    --  row 1 - 11
        16#4C#, 16#34#, 16#04#, 16#08#, 16#70#                                         --  row 12 - 16
        );

   Chr_F16_68 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#80#, 16#80#, 16#80#, 16#B0#, 16#C8#, 16#84#, 16#84#, 16#84#,    --  row 1 - 11
        16#84#, 16#84#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_69 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#40#, 16#00#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#,    --  row 1 - 11
        16#40#, 16#40#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_6A : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#10#, 16#00#, 16#30#, 16#10#, 16#10#, 16#10#, 16#10#,    --  row 1 - 11
        16#10#, 16#10#, 16#10#, 16#90#, 16#60#                                         --  row 12 - 16
        );

   Chr_F16_6B : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#80#, 16#80#, 16#80#, 16#88#, 16#90#, 16#A0#, 16#C0#, 16#A0#,    --  row 1 - 11
        16#90#, 16#88#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_6C : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#C0#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#,    --  row 1 - 11
        16#40#, 16#40#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_6D : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#AC#, 16#D2#, 16#92#, 16#92#, 16#92#,    --  row 1 - 11
        16#92#, 16#92#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_6E : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#B0#, 16#C8#, 16#84#, 16#84#, 16#84#,    --  row 1 - 11
        16#84#, 16#84#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_6F : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#38#, 16#44#, 16#82#, 16#82#, 16#82#,    --  row 1 - 11
        16#44#, 16#38#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_70 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#B0#, 16#C8#, 16#84#, 16#84#, 16#84#,    --  row 1 - 11
        16#C8#, 16#B0#, 16#80#, 16#80#, 16#80#                                         --  row 12 - 16
        );

   Chr_F16_71 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#34#, 16#4C#, 16#84#, 16#84#, 16#84#,    --  row 1 - 11
        16#4C#, 16#34#, 16#04#, 16#04#, 16#06#                                         --  row 12 - 16
        );

   Chr_F16_72 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#B0#, 16#C8#, 16#80#, 16#80#, 16#80#,    --  row 1 - 11
        16#80#, 16#80#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_73 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#70#, 16#88#, 16#80#, 16#70#, 16#08#,    --  row 1 - 11
        16#88#, 16#70#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_74 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#40#, 16#40#, 16#E0#, 16#40#, 16#40#, 16#40#, 16#40#,    --  row 1 - 11
        16#40#, 16#30#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_75 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#84#, 16#84#, 16#84#, 16#84#, 16#84#,    --  row 1 - 11
        16#4C#, 16#34#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_76 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#82#, 16#82#, 16#82#, 16#82#, 16#44#,    --  row 1 - 11
        16#28#, 16#10#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_77 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#82#, 16#82#, 16#82#, 16#92#, 16#92#,    --  row 1 - 11
        16#AA#, 16#44#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_78 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#88#, 16#88#, 16#50#, 16#20#, 16#50#,    --  row 1 - 11
        16#88#, 16#88#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_79 : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#84#, 16#84#, 16#84#, 16#84#, 16#84#,    --  row 1 - 11
        16#4C#, 16#34#, 16#04#, 16#08#, 16#70#                                         --  row 12 - 16
        );

   Chr_F16_7A : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#FC#, 16#04#, 16#08#, 16#30#, 16#40#,    --  row 1 - 11
        16#80#, 16#FC#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_7B : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#10#, 16#20#, 16#20#, 16#20#, 16#20#, 16#20#, 16#20#, 16#40#, 16#20#, 16#20#,    --  row 1 - 11
        16#20#, 16#20#, 16#20#, 16#20#, 16#10#                                         --  row 12 - 16
        );

   Chr_F16_7C : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#, 16#40#,    --  row 1 - 11
        16#40#, 16#40#, 16#40#, 16#40#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_7D : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#40#, 16#20#, 16#20#, 16#20#, 16#20#, 16#20#, 16#20#, 16#10#, 16#20#, 16#20#,    --  row 1 - 11
        16#20#, 16#20#, 16#20#, 16#20#, 16#40#                                         --  row 12 - 16
        );

   Chr_F16_7E : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#00#, 16#32#, 16#4C#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#,    --  row 1 - 11
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

   Chr_F16_7F : aliased constant Font_Array := (        --  1 unsigned char per row
        16#00#, 16#00#, 16#30#, 16#48#, 16#48#, 16#30#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#,    --  row 1 - 11
        16#00#, 16#00#, 16#00#, 16#00#, 16#00#                                         --  row 12 - 16
        );

--   type Fa_Ptr is access constant Font_Array;

   type Chrtbl_F16_T is array (Font2_Range) of Fa_Ptr;

   Chrtbl_F16 : Chrtbl_F16_T := (
                Chr_F16_20'Access, Chr_F16_21'Access, Chr_F16_22'Access, Chr_F16_23'Access,
                Chr_F16_24'Access, Chr_F16_25'Access, Chr_F16_26'Access, Chr_F16_27'Access,
                Chr_F16_28'Access, Chr_F16_29'Access, Chr_F16_2A'Access, Chr_F16_2B'Access,
                Chr_F16_2C'Access, Chr_F16_2D'Access, Chr_F16_2E'Access, Chr_F16_2F'Access,
                Chr_F16_30'Access, Chr_F16_31'Access, Chr_F16_32'Access, Chr_F16_33'Access,
                Chr_F16_34'Access, Chr_F16_35'Access, Chr_F16_36'Access, Chr_F16_37'Access,
                Chr_F16_38'Access, Chr_F16_39'Access, Chr_F16_3A'Access, Chr_F16_3B'Access,
                Chr_F16_3C'Access, Chr_F16_3D'Access, Chr_F16_3E'Access, Chr_F16_3F'Access,
                Chr_F16_40'Access, Chr_F16_41'Access, Chr_F16_42'Access, Chr_F16_43'Access,
                Chr_F16_44'Access, Chr_F16_45'Access, Chr_F16_46'Access, Chr_F16_47'Access,
                Chr_F16_48'Access, Chr_F16_49'Access, Chr_F16_4A'Access, Chr_F16_4B'Access,
                Chr_F16_4C'Access, Chr_F16_4D'Access, Chr_F16_4E'Access, Chr_F16_4F'Access,
                Chr_F16_50'Access, Chr_F16_51'Access, Chr_F16_52'Access, Chr_F16_53'Access,
                Chr_F16_54'Access, Chr_F16_55'Access, Chr_F16_56'Access, Chr_F16_57'Access,
                Chr_F16_58'Access, Chr_F16_59'Access, Chr_F16_5A'Access, Chr_F16_5B'Access,
                Chr_F16_5C'Access, Chr_F16_5D'Access, Chr_F16_5E'Access, Chr_F16_5F'Access,
                Chr_F16_60'Access, Chr_F16_61'Access, Chr_F16_62'Access, Chr_F16_63'Access,
                Chr_F16_64'Access, Chr_F16_65'Access, Chr_F16_66'Access, Chr_F16_67'Access,
                Chr_F16_68'Access, Chr_F16_69'Access, Chr_F16_6A'Access, Chr_F16_6B'Access,
                Chr_F16_6C'Access, Chr_F16_6D'Access, Chr_F16_6E'Access, Chr_F16_6F'Access,
                Chr_F16_70'Access, Chr_F16_71'Access, Chr_F16_72'Access, Chr_F16_73'Access,
                Chr_F16_74'Access, Chr_F16_75'Access, Chr_F16_76'Access, Chr_F16_77'Access,
                Chr_F16_78'Access, Chr_F16_79'Access, Chr_F16_7A'Access, Chr_F16_7B'Access,
                Chr_F16_7C'Access, Chr_F16_7D'Access, Chr_F16_7E'Access, Chr_F16_7F'Access
                );

end Fonts.Font2;
