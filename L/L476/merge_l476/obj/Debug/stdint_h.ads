pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with machine_udefault_types_h;
with Interfaces.C.Extensions;

package stdint_h is

   --  unsupported macro: INTPTR_MIN (-__INTPTR_MAX__ - 1)
   --  unsupported macro: INTPTR_MAX (__INTPTR_MAX__)
   --  unsupported macro: UINTPTR_MAX (__UINTPTR_MAX__)
   --  unsupported macro: INT8_MIN (-__INT8_MAX__ - 1)
   --  unsupported macro: INT8_MAX (__INT8_MAX__)
   --  unsupported macro: UINT8_MAX (__UINT8_MAX__)
   --  unsupported macro: INT_LEAST8_MIN (-__INT_LEAST8_MAX__ - 1)
   --  unsupported macro: INT_LEAST8_MAX (__INT_LEAST8_MAX__)
   --  unsupported macro: UINT_LEAST8_MAX (__UINT_LEAST8_MAX__)
   --  unsupported macro: INT16_MIN (-__INT16_MAX__ - 1)
   --  unsupported macro: INT16_MAX (__INT16_MAX__)
   --  unsupported macro: UINT16_MAX (__UINT16_MAX__)
   --  unsupported macro: INT_LEAST16_MIN (-__INT_LEAST16_MAX__ - 1)
   --  unsupported macro: INT_LEAST16_MAX (__INT_LEAST16_MAX__)
   --  unsupported macro: UINT_LEAST16_MAX (__UINT_LEAST16_MAX__)
   --  unsupported macro: INT32_MIN (-__INT32_MAX__ - 1)
   --  unsupported macro: INT32_MAX (__INT32_MAX__)
   --  unsupported macro: UINT32_MAX (__UINT32_MAX__)
   --  unsupported macro: INT_LEAST32_MIN (-__INT_LEAST32_MAX__ - 1)
   --  unsupported macro: INT_LEAST32_MAX (__INT_LEAST32_MAX__)
   --  unsupported macro: UINT_LEAST32_MAX (__UINT_LEAST32_MAX__)
   --  unsupported macro: INT64_MIN (-__INT64_MAX__ - 1)
   --  unsupported macro: INT64_MAX (__INT64_MAX__)
   --  unsupported macro: UINT64_MAX (__UINT64_MAX__)
   --  unsupported macro: INT_LEAST64_MIN (-__INT_LEAST64_MAX__ - 1)
   --  unsupported macro: INT_LEAST64_MAX (__INT_LEAST64_MAX__)
   --  unsupported macro: UINT_LEAST64_MAX (__UINT_LEAST64_MAX__)
   --  unsupported macro: INT_FAST8_MIN (-__INT_FAST8_MAX__ - 1)
   --  unsupported macro: INT_FAST8_MAX (__INT_FAST8_MAX__)
   --  unsupported macro: UINT_FAST8_MAX (__UINT_FAST8_MAX__)
   --  unsupported macro: INT_FAST16_MIN (-__INT_FAST16_MAX__ - 1)
   --  unsupported macro: INT_FAST16_MAX (__INT_FAST16_MAX__)
   --  unsupported macro: UINT_FAST16_MAX (__UINT_FAST16_MAX__)
   --  unsupported macro: INT_FAST32_MIN (-__INT_FAST32_MAX__ - 1)
   --  unsupported macro: INT_FAST32_MAX (__INT_FAST32_MAX__)
   --  unsupported macro: UINT_FAST32_MAX (__UINT_FAST32_MAX__)
   --  unsupported macro: INT_FAST64_MIN (-__INT_FAST64_MAX__ - 1)
   --  unsupported macro: INT_FAST64_MAX (__INT_FAST64_MAX__)
   --  unsupported macro: UINT_FAST64_MAX (__UINT_FAST64_MAX__)
   --  unsupported macro: INTMAX_MAX (__INTMAX_MAX__)
   --  unsupported macro: INTMAX_MIN (-INTMAX_MAX - 1)
   --  unsupported macro: UINTMAX_MAX (__UINTMAX_MAX__)
   --  unsupported macro: SIZE_MAX (__SIZE_MAX__)
   --  unsupported macro: SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)
   --  unsupported macro: SIG_ATOMIC_MAX (__STDINT_EXP(INT_MAX))
   --  unsupported macro: PTRDIFF_MAX (__PTRDIFF_MAX__)
   --  unsupported macro: PTRDIFF_MIN (-PTRDIFF_MAX - 1)
   --  unsupported macro: WCHAR_MIN (__WCHAR_MIN__)
   --  unsupported macro: WCHAR_MAX (__WCHAR_MAX__)
   --  unsupported macro: WINT_MAX (__WINT_MAX__)
   --  unsupported macro: WINT_MIN (__WINT_MIN__)
   --  arg-macro: procedure INT8_C (x)
   --    __INT8_C(x)
   --  arg-macro: procedure UINT8_C (x)
   --    __UINT8_C(x)
   --  arg-macro: procedure INT16_C (x)
   --    __INT16_C(x)
   --  arg-macro: procedure UINT16_C (x)
   --    __UINT16_C(x)
   --  arg-macro: procedure INT32_C (x)
   --    __INT32_C(x)
   --  arg-macro: procedure UINT32_C (x)
   --    __UINT32_C(x)
   --  arg-macro: procedure INT64_C (x)
   --    __INT64_C(x)
   --  arg-macro: procedure UINT64_C (x)
   --    __UINT64_C(x)
   --  arg-macro: procedure INTMAX_C (x)
   --    __INTMAX_C(x)
   --  arg-macro: procedure UINTMAX_C (x)
   --    __UINTMAX_C(x)
   subtype int_least8_t is machine_udefault_types_h.uu_int_least8_t;  -- /usr/gnat2018/arm-eabi/include/stdint.h:21

   subtype uint_least8_t is machine_udefault_types_h.uu_uint_least8_t;  -- /usr/gnat2018/arm-eabi/include/stdint.h:22

   subtype int_least16_t is machine_udefault_types_h.uu_int_least16_t;  -- /usr/gnat2018/arm-eabi/include/stdint.h:27

   subtype uint_least16_t is machine_udefault_types_h.uu_uint_least16_t;  -- /usr/gnat2018/arm-eabi/include/stdint.h:28

   subtype int_least32_t is machine_udefault_types_h.uu_int_least32_t;  -- /usr/gnat2018/arm-eabi/include/stdint.h:33

   subtype uint_least32_t is machine_udefault_types_h.uu_uint_least32_t;  -- /usr/gnat2018/arm-eabi/include/stdint.h:34

   subtype int_least64_t is machine_udefault_types_h.uu_int_least64_t;  -- /usr/gnat2018/arm-eabi/include/stdint.h:39

   subtype uint_least64_t is machine_udefault_types_h.uu_uint_least64_t;  -- /usr/gnat2018/arm-eabi/include/stdint.h:40

   subtype int_fast8_t is int;  -- /usr/gnat2018/arm-eabi/include/stdint.h:51

   subtype uint_fast8_t is unsigned;  -- /usr/gnat2018/arm-eabi/include/stdint.h:52

   subtype int_fast16_t is int;  -- /usr/gnat2018/arm-eabi/include/stdint.h:61

   subtype uint_fast16_t is unsigned;  -- /usr/gnat2018/arm-eabi/include/stdint.h:62

   subtype int_fast32_t is int;  -- /usr/gnat2018/arm-eabi/include/stdint.h:71

   subtype uint_fast32_t is unsigned;  -- /usr/gnat2018/arm-eabi/include/stdint.h:72

   subtype int_fast64_t is Long_Long_Integer;  -- /usr/gnat2018/arm-eabi/include/stdint.h:81

   subtype uint_fast64_t is Extensions.unsigned_long_long;  -- /usr/gnat2018/arm-eabi/include/stdint.h:82

   subtype intmax_t is Long_Long_Integer;  -- /usr/gnat2018/arm-eabi/include/stdint.h:130

   subtype uintmax_t is Extensions.unsigned_long_long;  -- /usr/gnat2018/arm-eabi/include/stdint.h:139

end stdint_h;
