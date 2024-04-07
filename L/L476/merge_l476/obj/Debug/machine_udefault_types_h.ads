pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package machine_udefault_types_h is

   subtype uu_int8_t is signed_char;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:27

   subtype uu_uint8_t is unsigned_char;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:29

   subtype uu_int16_t is short;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:41

   subtype uu_uint16_t is unsigned_short;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:43

   subtype uu_int32_t is long;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:63

   subtype uu_uint32_t is unsigned_long;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:65

   subtype uu_int64_t is Long_Long_Integer;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:89

   subtype uu_uint64_t is Extensions.unsigned_long_long;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:91

   subtype uu_int_least8_t is signed_char;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:120

   subtype uu_uint_least8_t is unsigned_char;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:122

   subtype uu_int_least16_t is short;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:146

   subtype uu_uint_least16_t is unsigned_short;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:148

   subtype uu_int_least32_t is long;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:168

   subtype uu_uint_least32_t is unsigned_long;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:170

   subtype uu_int_least64_t is Long_Long_Integer;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:186

   subtype uu_uint_least64_t is Extensions.unsigned_long_long;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:188

   subtype uu_intptr_t is int;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:200

   subtype uu_uintptr_t is unsigned;  -- /usr/gnat2018/arm-eabi/include/machine/_default_types.h:202

end machine_udefault_types_h;
