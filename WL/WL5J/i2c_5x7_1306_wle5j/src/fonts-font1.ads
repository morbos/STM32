with Fonts; use Fonts;

package Fonts.Font1 is

   Chr_Hgt_F5x7 : constant UInt8 := 7;

   type Font1_Range is range 16#20# .. 16#7f#;

   --  type Chr_Range is range 16#20# .. 16#7f#;

   --  Row format, MSB left

   Chr_F5x7_20 : aliased constant Font_Array :=
     (0, 0, 0, 0, 0);

   Chr_F5x7_21 : aliased constant Font_Array :=
     (16#00#, 16#00#, 16#5F#, 16#00#, 16#00#); --  !

   Chr_F5x7_22 : aliased constant Font_Array :=
     (16#00#, 16#03#, 16#00#, 16#03#, 16#00#); --  "

   Chr_F5x7_23 : aliased constant Font_Array :=
     (16#14#, 16#3E#, 16#14#, 16#3E#, 16#14#); --  #

   Chr_F5x7_24 : aliased constant Font_Array :=
     (16#24#, 16#2A#, 16#7F#, 16#2A#, 16#12#); --  $

   Chr_F5x7_25 : aliased constant Font_Array :=
     (16#43#, 16#33#, 16#08#, 16#66#, 16#61#); --  %

   Chr_F5x7_26 : aliased constant Font_Array :=
     (16#36#, 16#49#, 16#55#, 16#22#, 16#50#); --  &

   Chr_F5x7_27 : aliased constant Font_Array :=
     (16#00#, 16#05#, 16#03#, 16#00#, 16#00#); --  '

   Chr_F5x7_28 : aliased constant Font_Array :=
     (16#00#, 16#1C#, 16#22#, 16#41#, 16#00#); --  (

   Chr_F5x7_29 : aliased constant Font_Array :=
     (16#00#, 16#41#, 16#22#, 16#1C#, 16#00#); --  )

   Chr_F5x7_2A : aliased constant Font_Array :=
     (16#14#, 16#08#, 16#3E#, 16#08#, 16#14#); --  *

   Chr_F5x7_2B : aliased constant Font_Array :=
     (16#08#, 16#08#, 16#3E#, 16#08#, 16#08#); --  +

   Chr_F5x7_2C : aliased constant Font_Array :=
     (16#00#, 16#50#, 16#30#, 16#00#, 16#00#); --  ,

   Chr_F5x7_2D : aliased constant Font_Array :=
     (16#08#, 16#08#, 16#08#, 16#08#, 16#08#); --  -

   Chr_F5x7_2E : aliased constant Font_Array :=
     (16#00#, 16#60#, 16#60#, 16#00#, 16#00#); --  .

   Chr_F5x7_2F : aliased constant Font_Array :=
     (16#20#, 16#10#, 16#08#, 16#04#, 16#02#); --  /

   Chr_F5x7_30 : aliased constant Font_Array :=
     (16#3E#, 16#51#, 16#49#, 16#45#, 16#3E#); --  0

   Chr_F5x7_31 : aliased constant Font_Array :=
     (16#04#, 16#02#, 16#7F#, 16#00#, 16#00#); --  1

   Chr_F5x7_32 : aliased constant Font_Array :=
     (16#42#, 16#61#, 16#51#, 16#49#, 16#46#); --  2

   Chr_F5x7_33 : aliased constant Font_Array :=
     (16#22#, 16#41#, 16#49#, 16#49#, 16#36#); --  3

   Chr_F5x7_34 : aliased constant Font_Array :=
     (16#18#, 16#14#, 16#12#, 16#7F#, 16#10#); --  4

   Chr_F5x7_35 : aliased constant Font_Array :=
     (16#27#, 16#45#, 16#45#, 16#45#, 16#39#); --  5

   Chr_F5x7_36 : aliased constant Font_Array :=
     (16#3E#, 16#49#, 16#49#, 16#49#, 16#32#); --  6

   Chr_F5x7_37 : aliased constant Font_Array :=
     (16#01#, 16#01#, 16#71#, 16#09#, 16#07#); --  7

   Chr_F5x7_38 : aliased constant Font_Array :=
     (16#36#, 16#49#, 16#49#, 16#49#, 16#36#); --  8

   Chr_F5x7_39 : aliased constant Font_Array :=
     (16#26#, 16#49#, 16#49#, 16#49#, 16#3E#); --  9

   Chr_F5x7_3A : aliased constant Font_Array :=
     (16#00#, 16#36#, 16#36#, 16#00#, 16#00#); --  :

   Chr_F5x7_3B : aliased constant Font_Array :=
     (16#00#, 16#56#, 16#36#, 16#00#, 16#00#); --  ;

   Chr_F5x7_3C : aliased constant Font_Array :=
     (16#08#, 16#14#, 16#22#, 16#41#, 16#00#); --  <

   Chr_F5x7_3D : aliased constant Font_Array :=
     (16#14#, 16#14#, 16#14#, 16#14#, 16#14#); --  =

   Chr_F5x7_3E : aliased constant Font_Array :=
     (16#00#, 16#41#, 16#22#, 16#14#, 16#08#); --  >

   Chr_F5x7_3F : aliased constant Font_Array :=
     (16#02#, 16#01#, 16#51#, 16#09#, 16#06#); --  ?

   Chr_F5x7_40 : aliased constant Font_Array :=
     (16#3E#, 16#41#, 16#59#, 16#55#, 16#5E#); --  @

   Chr_F5x7_41 : aliased constant Font_Array :=
     (16#7E#, 16#09#, 16#09#, 16#09#, 16#7E#); --  A

   Chr_F5x7_42 : aliased constant Font_Array :=
     (16#7F#, 16#49#, 16#49#, 16#49#, 16#36#); --  B

   Chr_F5x7_43 : aliased constant Font_Array :=
     (16#3E#, 16#41#, 16#41#, 16#41#, 16#22#); --  C

   Chr_F5x7_44 : aliased constant Font_Array :=
     (16#7F#, 16#41#, 16#41#, 16#41#, 16#3E#); --  D

   Chr_F5x7_45 : aliased constant Font_Array :=
     (16#7F#, 16#49#, 16#49#, 16#49#, 16#41#); --  E

   Chr_F5x7_46 : aliased constant Font_Array :=
     (16#7F#, 16#09#, 16#09#, 16#09#, 16#01#); --  F

   Chr_F5x7_47 : aliased constant Font_Array :=
     (16#3E#, 16#41#, 16#41#, 16#49#, 16#3A#); --  G

   Chr_F5x7_48 : aliased constant Font_Array :=
     (16#7F#, 16#08#, 16#08#, 16#08#, 16#7F#); --  H

   Chr_F5x7_49 : aliased constant Font_Array :=
     (16#00#, 16#41#, 16#7F#, 16#41#, 16#00#); --  I

   Chr_F5x7_4A : aliased constant Font_Array :=
     (16#30#, 16#40#, 16#40#, 16#40#, 16#3F#); --  J

   Chr_F5x7_4B : aliased constant Font_Array :=
     (16#7F#, 16#08#, 16#14#, 16#22#, 16#41#); --  K

   Chr_F5x7_4C : aliased constant Font_Array :=
     (16#7F#, 16#40#, 16#40#, 16#40#, 16#40#); --  L

   Chr_F5x7_4D : aliased constant Font_Array :=
     (16#7F#, 16#02#, 16#0C#, 16#02#, 16#7F#); --  M

   Chr_F5x7_4E : aliased constant Font_Array :=
     (16#7F#, 16#02#, 16#04#, 16#08#, 16#7F#); --  N

   Chr_F5x7_4F : aliased constant Font_Array :=
     (16#3E#, 16#41#, 16#41#, 16#41#, 16#3E#); --  O

   Chr_F5x7_50 : aliased constant Font_Array :=
     (16#7F#, 16#09#, 16#09#, 16#09#, 16#06#); --  P

   Chr_F5x7_51 : aliased constant Font_Array :=
     (16#1E#, 16#21#, 16#21#, 16#21#, 16#5E#); --  Q

   Chr_F5x7_52 : aliased constant Font_Array :=
     (16#7F#, 16#09#, 16#09#, 16#09#, 16#76#); --  R

   Chr_F5x7_53 : aliased constant Font_Array :=
     (16#26#, 16#49#, 16#49#, 16#49#, 16#32#); --  S

   Chr_F5x7_54 : aliased constant Font_Array :=
     (16#01#, 16#01#, 16#7F#, 16#01#, 16#01#); --  T

   Chr_F5x7_55 : aliased constant Font_Array :=
     (16#3F#, 16#40#, 16#40#, 16#40#, 16#3F#); --  U

   Chr_F5x7_56 : aliased constant Font_Array :=
     (16#1F#, 16#20#, 16#40#, 16#20#, 16#1F#); --  V

   Chr_F5x7_57 : aliased constant Font_Array :=
     (16#7F#, 16#20#, 16#10#, 16#20#, 16#7F#); --  W

   Chr_F5x7_58 : aliased constant Font_Array :=
     (16#41#, 16#22#, 16#1C#, 16#22#, 16#41#); --  X

   Chr_F5x7_59 : aliased constant Font_Array :=
     (16#07#, 16#08#, 16#70#, 16#08#, 16#07#); --  Y

   Chr_F5x7_5A : aliased constant Font_Array :=
     (16#61#, 16#51#, 16#49#, 16#45#, 16#43#); --  Z

   Chr_F5x7_5B : aliased constant Font_Array :=
     (16#00#, 16#7F#, 16#41#, 16#00#, 16#00#); --  [

   Chr_F5x7_5C : aliased constant Font_Array :=
     (16#02#, 16#04#, 16#08#, 16#10#, 16#20#); --  \

   Chr_F5x7_5D : aliased constant Font_Array :=
     (16#00#, 16#00#, 16#41#, 16#7F#, 16#00#); --  ]

   Chr_F5x7_5E : aliased constant Font_Array :=
     (16#04#, 16#02#, 16#01#, 16#02#, 16#04#); --  ^

   Chr_F5x7_5F : aliased constant Font_Array :=
     (16#40#, 16#40#, 16#40#, 16#40#, 16#40#); --  _

   Chr_F5x7_60 : aliased constant Font_Array :=
     (16#00#, 16#01#, 16#02#, 16#04#, 16#00#); --  `

   Chr_F5x7_61 : aliased constant Font_Array :=
     (16#20#, 16#54#, 16#54#, 16#54#, 16#78#); --  A

   Chr_F5x7_62 : aliased constant Font_Array :=
     (16#7F#, 16#44#, 16#44#, 16#44#, 16#38#); --  B

   Chr_F5x7_63 : aliased constant Font_Array :=
     (16#38#, 16#44#, 16#44#, 16#44#, 16#44#); --  C

   Chr_F5x7_64 : aliased constant Font_Array :=
     (16#38#, 16#44#, 16#44#, 16#44#, 16#7F#); --  D

   Chr_F5x7_65 : aliased constant Font_Array :=
     (16#38#, 16#54#, 16#54#, 16#54#, 16#18#); --  E

   Chr_F5x7_66 : aliased constant Font_Array :=
     (16#04#, 16#04#, 16#7E#, 16#05#, 16#05#); --  F

   Chr_F5x7_67 : aliased constant Font_Array :=
     (16#08#, 16#54#, 16#54#, 16#54#, 16#3C#); --  G

   Chr_F5x7_68 : aliased constant Font_Array :=
     (16#7F#, 16#08#, 16#04#, 16#04#, 16#78#); --  H

   Chr_F5x7_69 : aliased constant Font_Array :=
     (16#00#, 16#44#, 16#7D#, 16#40#, 16#00#); --  I

   Chr_F5x7_6A : aliased constant Font_Array :=
     (16#20#, 16#40#, 16#44#, 16#3D#, 16#00#); --  J

   Chr_F5x7_6B : aliased constant Font_Array :=
     (16#7F#, 16#10#, 16#28#, 16#44#, 16#00#); --  K

   Chr_F5x7_6C : aliased constant Font_Array :=
     (16#00#, 16#41#, 16#7F#, 16#40#, 16#00#); --  L

   Chr_F5x7_6D : aliased constant Font_Array :=
     (16#7C#, 16#04#, 16#78#, 16#04#, 16#78#); --  M

   Chr_F5x7_6E : aliased constant Font_Array :=
     (16#7C#, 16#08#, 16#04#, 16#04#, 16#78#); --  N

   Chr_F5x7_6F : aliased constant Font_Array :=
     (16#38#, 16#44#, 16#44#, 16#44#, 16#38#); --  O

   Chr_F5x7_70 : aliased constant Font_Array :=
     (16#7C#, 16#14#, 16#14#, 16#14#, 16#08#); --  P

   Chr_F5x7_71 : aliased constant Font_Array :=
     (16#08#, 16#14#, 16#14#, 16#14#, 16#7C#); --  Q

   Chr_F5x7_72 : aliased constant Font_Array :=
     (16#00#, 16#7C#, 16#08#, 16#04#, 16#04#); --  R

   Chr_F5x7_73 : aliased constant Font_Array :=
     (16#48#, 16#54#, 16#54#, 16#54#, 16#20#); --  S

   Chr_F5x7_74 : aliased constant Font_Array :=
     (16#04#, 16#04#, 16#3F#, 16#44#, 16#44#); --  T

   Chr_F5x7_75 : aliased constant Font_Array :=
     (16#3C#, 16#40#, 16#40#, 16#20#, 16#7C#); --  U

   Chr_F5x7_76 : aliased constant Font_Array :=
     (16#1C#, 16#20#, 16#40#, 16#20#, 16#1C#); --  V

   Chr_F5x7_77 : aliased constant Font_Array :=
     (16#3C#, 16#40#, 16#30#, 16#40#, 16#3C#); --  W

   Chr_F5x7_78 : aliased constant Font_Array :=
     (16#44#, 16#28#, 16#10#, 16#28#, 16#44#); --  X

   Chr_F5x7_79 : aliased constant Font_Array :=
     (16#0C#, 16#50#, 16#50#, 16#50#, 16#3C#); --  Y

   Chr_F5x7_7A : aliased constant Font_Array :=
     (16#44#, 16#64#, 16#54#, 16#4C#, 16#44#); --  Z

   Chr_F5x7_7B : aliased constant Font_Array :=
     (16#00#, 16#08#, 16#36#, 16#41#, 16#41#); --  {

   Chr_F5x7_7C : aliased constant Font_Array :=
     (16#00#, 16#00#, 16#7F#, 16#00#, 16#00#); --  |

   Chr_F5x7_7D : aliased constant Font_Array :=
     (16#41#, 16#41#, 16#36#, 16#08#, 16#00#); --  }

   Chr_F5x7_7E : aliased constant Font_Array :=
     (16#02#, 16#01#, 16#02#, 16#04#, 16#02#); --  ~

   Chr_F5x7_7F : aliased constant Font_Array :=
     (16#00#, 16#00#, 16#00#, 16#00#, 16#00#); --  DEL

--   type Fa_Ptr is access constant Font_Array;

   type Chrtbl_F5x7_T is array (Font1_Range) of Fa_Ptr;

   Chrtbl_F5x7 : Chrtbl_F5x7_T := (
                Chr_F5x7_20'Access, Chr_F5x7_21'Access, Chr_F5x7_22'Access, Chr_F5x7_23'Access,
                Chr_F5x7_24'Access, Chr_F5x7_25'Access, Chr_F5x7_26'Access, Chr_F5x7_27'Access,
                Chr_F5x7_28'Access, Chr_F5x7_29'Access, Chr_F5x7_2A'Access, Chr_F5x7_2B'Access,
                Chr_F5x7_2C'Access, Chr_F5x7_2D'Access, Chr_F5x7_2E'Access, Chr_F5x7_2F'Access,
                Chr_F5x7_30'Access, Chr_F5x7_31'Access, Chr_F5x7_32'Access, Chr_F5x7_33'Access,
                Chr_F5x7_34'Access, Chr_F5x7_35'Access, Chr_F5x7_36'Access, Chr_F5x7_37'Access,
                Chr_F5x7_38'Access, Chr_F5x7_39'Access, Chr_F5x7_3A'Access, Chr_F5x7_3B'Access,
                Chr_F5x7_3C'Access, Chr_F5x7_3D'Access, Chr_F5x7_3E'Access, Chr_F5x7_3F'Access,
                Chr_F5x7_40'Access, Chr_F5x7_41'Access, Chr_F5x7_42'Access, Chr_F5x7_43'Access,
                Chr_F5x7_44'Access, Chr_F5x7_45'Access, Chr_F5x7_46'Access, Chr_F5x7_47'Access,
                Chr_F5x7_48'Access, Chr_F5x7_49'Access, Chr_F5x7_4A'Access, Chr_F5x7_4B'Access,
                Chr_F5x7_4C'Access, Chr_F5x7_4D'Access, Chr_F5x7_4E'Access, Chr_F5x7_4F'Access,
                Chr_F5x7_50'Access, Chr_F5x7_51'Access, Chr_F5x7_52'Access, Chr_F5x7_53'Access,
                Chr_F5x7_54'Access, Chr_F5x7_55'Access, Chr_F5x7_56'Access, Chr_F5x7_57'Access,
                Chr_F5x7_58'Access, Chr_F5x7_59'Access, Chr_F5x7_5A'Access, Chr_F5x7_5B'Access,
                Chr_F5x7_5C'Access, Chr_F5x7_5D'Access, Chr_F5x7_5E'Access, Chr_F5x7_5F'Access,
                Chr_F5x7_60'Access, Chr_F5x7_61'Access, Chr_F5x7_62'Access, Chr_F5x7_63'Access,
                Chr_F5x7_64'Access, Chr_F5x7_65'Access, Chr_F5x7_66'Access, Chr_F5x7_67'Access,
                Chr_F5x7_68'Access, Chr_F5x7_69'Access, Chr_F5x7_6A'Access, Chr_F5x7_6B'Access,
                Chr_F5x7_6C'Access, Chr_F5x7_6D'Access, Chr_F5x7_6E'Access, Chr_F5x7_6F'Access,
                Chr_F5x7_70'Access, Chr_F5x7_71'Access, Chr_F5x7_72'Access, Chr_F5x7_73'Access,
                Chr_F5x7_74'Access, Chr_F5x7_75'Access, Chr_F5x7_76'Access, Chr_F5x7_77'Access,
                Chr_F5x7_78'Access, Chr_F5x7_79'Access, Chr_F5x7_7A'Access, Chr_F5x7_7B'Access,
                Chr_F5x7_7C'Access, Chr_F5x7_7D'Access, Chr_F5x7_7E'Access, Chr_F5x7_7F'Access
                );

end Fonts.Font1;
