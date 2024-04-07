pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package stddef_h is

   --  unsupported macro: NULL ((void *)0)
   --  arg-macro: procedure offsetof (TYPE, MEMBER)
   --    __builtin_offsetof (TYPE, MEMBER)
   subtype ptrdiff_t is int;  -- /usr/gnat2018/lib/gcc/arm-eabi/7.3.1/include/stddef.h:149

   subtype size_t is unsigned;  -- /usr/gnat2018/lib/gcc/arm-eabi/7.3.1/include/stddef.h:216

   subtype wchar_t is unsigned;  -- /usr/gnat2018/lib/gcc/arm-eabi/7.3.1/include/stddef.h:328

   subtype wint_t is unsigned;  -- /usr/gnat2018/lib/gcc/arm-eabi/7.3.1/include/stddef.h:357

end stddef_h;
