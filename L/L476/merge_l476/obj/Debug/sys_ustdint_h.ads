pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with machine_udefault_types_h;

package sys_ustdint_h is

   subtype int8_t is machine_udefault_types_h.uu_int8_t;  -- /usr/gnat2018/arm-eabi/include/sys/_stdint.h:19

   subtype uint8_t is machine_udefault_types_h.uu_uint8_t;  -- /usr/gnat2018/arm-eabi/include/sys/_stdint.h:20

   subtype int16_t is machine_udefault_types_h.uu_int16_t;  -- /usr/gnat2018/arm-eabi/include/sys/_stdint.h:25

   subtype uint16_t is machine_udefault_types_h.uu_uint16_t;  -- /usr/gnat2018/arm-eabi/include/sys/_stdint.h:26

   subtype int32_t is machine_udefault_types_h.uu_int32_t;  -- /usr/gnat2018/arm-eabi/include/sys/_stdint.h:31

   subtype uint32_t is machine_udefault_types_h.uu_uint32_t;  -- /usr/gnat2018/arm-eabi/include/sys/_stdint.h:32

   subtype int64_t is machine_udefault_types_h.uu_int64_t;  -- /usr/gnat2018/arm-eabi/include/sys/_stdint.h:37

   subtype uint64_t is machine_udefault_types_h.uu_uint64_t;  -- /usr/gnat2018/arm-eabi/include/sys/_stdint.h:38

   subtype intptr_t is machine_udefault_types_h.uu_intptr_t;  -- /usr/gnat2018/arm-eabi/include/sys/_stdint.h:42

   subtype uintptr_t is machine_udefault_types_h.uu_uintptr_t;  -- /usr/gnat2018/arm-eabi/include/sys/_stdint.h:43

end sys_ustdint_h;
