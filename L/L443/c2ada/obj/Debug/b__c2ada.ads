pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#b67c59c1#;
   pragma Export (C, u00001, "c2adaB");
   u00002 : constant Version_32 := 16#abae7442#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#dca50bae#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#6479b1b2#;
   pragma Export (C, u00004, "testB");
   u00005 : constant Version_32 := 16#82e79b9b#;
   pragma Export (C, u00005, "testS");
   u00006 : constant Version_32 := 16#db831581#;
   pragma Export (C, u00006, "systemS");
   u00007 : constant Version_32 := 16#a66a0087#;
   pragma Export (C, u00007, "system__memoryB");
   u00008 : constant Version_32 := 16#82fe73b5#;
   pragma Export (C, u00008, "system__memoryS");
   u00009 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00009, "adaS");
   u00010 : constant Version_32 := 16#bc8836a8#;
   pragma Export (C, u00010, "ada__exceptionsB");
   u00011 : constant Version_32 := 16#5c0244db#;
   pragma Export (C, u00011, "ada__exceptionsS");
   u00012 : constant Version_32 := 16#72ab9969#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerB");
   u00013 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00013, "ada__exceptions__last_chance_handlerS");
   u00014 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00014, "gnatS");
   u00015 : constant Version_32 := 16#00249549#;
   pragma Export (C, u00015, "gnat__debug_utilitiesB");
   u00016 : constant Version_32 := 16#25b860cb#;
   pragma Export (C, u00016, "gnat__debug_utilitiesS");
   u00017 : constant Version_32 := 16#3a251268#;
   pragma Export (C, u00017, "system__secondary_stackB");
   u00018 : constant Version_32 := 16#71e4c887#;
   pragma Export (C, u00018, "system__secondary_stackS");
   u00019 : constant Version_32 := 16#d8537b0b#;
   pragma Export (C, u00019, "system__parametersB");
   u00020 : constant Version_32 := 16#0a85049f#;
   pragma Export (C, u00020, "system__parametersS");
   u00021 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00021, "system__storage_elementsB");
   u00022 : constant Version_32 := 16#f6405f85#;
   pragma Export (C, u00022, "system__storage_elementsS");
   u00023 : constant Version_32 := 16#60c9526c#;
   pragma Export (C, u00023, "system__ioB");
   u00024 : constant Version_32 := 16#45c1e2ce#;
   pragma Export (C, u00024, "system__ioS");
   u00025 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00025, "system__img_intB");
   u00026 : constant Version_32 := 16#d958f543#;
   pragma Export (C, u00026, "system__img_intS");
   u00027 : constant Version_32 := 16#d887b5b7#;
   pragma Export (C, u00027, "system__text_ioB");
   u00028 : constant Version_32 := 16#f9949a48#;
   pragma Export (C, u00028, "system__text_ioS");
   u00029 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00029, "interfacesS");
   u00030 : constant Version_32 := 16#e721877b#;
   pragma Export (C, u00030, "interfaces__bit_typesS");
   u00031 : constant Version_32 := 16#510ee3b9#;
   pragma Export (C, u00031, "interfaces__stm32S");
   u00032 : constant Version_32 := 16#3750b0f0#;
   pragma Export (C, u00032, "interfaces__stm32__gpioS");
   u00033 : constant Version_32 := 16#ef056902#;
   pragma Export (C, u00033, "system__unsigned_typesS");
   u00034 : constant Version_32 := 16#f4650291#;
   pragma Export (C, u00034, "interfaces__stm32__rccS");
   u00035 : constant Version_32 := 16#1e988606#;
   pragma Export (C, u00035, "interfaces__stm32__usartS");
   u00036 : constant Version_32 := 16#0c622333#;
   pragma Export (C, u00036, "system__stm32B");
   u00037 : constant Version_32 := 16#2ca45436#;
   pragma Export (C, u00037, "system__stm32S");
   u00038 : constant Version_32 := 16#d263672f#;
   pragma Export (C, u00038, "system__bbS");
   u00039 : constant Version_32 := 16#581947f3#;
   pragma Export (C, u00039, "system__bb__parametersS");
   u00040 : constant Version_32 := 16#cf4af069#;
   pragma Export (C, u00040, "system__bb__board_parametersS");
   u00041 : constant Version_32 := 16#b7e403ce#;
   pragma Export (C, u00041, "system__bb__mcu_parametersB");
   u00042 : constant Version_32 := 16#ee78c71c#;
   pragma Export (C, u00042, "system__bb__mcu_parametersS");
   u00043 : constant Version_32 := 16#a5e8665f#;
   pragma Export (C, u00043, "interfaces__stm32__pwrS");
   u00044 : constant Version_32 := 16#aca62f10#;
   pragma Export (C, u00044, "system__os_interfaceS");
   u00045 : constant Version_32 := 16#0e296a4f#;
   pragma Export (C, u00045, "system__bb__board_supportB");
   u00046 : constant Version_32 := 16#90d92d2c#;
   pragma Export (C, u00046, "system__bb__board_supportS");
   u00047 : constant Version_32 := 16#e67b2690#;
   pragma Export (C, u00047, "system__bb__cpu_primitivesB");
   u00048 : constant Version_32 := 16#54e1820e#;
   pragma Export (C, u00048, "system__bb__cpu_primitivesS");
   u00049 : constant Version_32 := 16#ccc8ae60#;
   pragma Export (C, u00049, "system__bb__cpu_primitives__context_switch_triggerB");
   u00050 : constant Version_32 := 16#a4bbd201#;
   pragma Export (C, u00050, "system__bb__cpu_primitives__context_switch_triggerS");
   u00051 : constant Version_32 := 16#b6ebb280#;
   pragma Export (C, u00051, "system__machine_codeS");
   u00052 : constant Version_32 := 16#74f718e7#;
   pragma Export (C, u00052, "system__bb__threadsB");
   u00053 : constant Version_32 := 16#dba57cb1#;
   pragma Export (C, u00053, "system__bb__threadsS");
   u00054 : constant Version_32 := 16#5922a358#;
   pragma Export (C, u00054, "system__bb__interruptsB");
   u00055 : constant Version_32 := 16#2096c879#;
   pragma Export (C, u00055, "system__bb__interruptsS");
   u00056 : constant Version_32 := 16#c51cf369#;
   pragma Export (C, u00056, "system__bb__cpu_specificS");
   u00057 : constant Version_32 := 16#acf0f448#;
   pragma Export (C, u00057, "system__bb__threads__queuesB");
   u00058 : constant Version_32 := 16#43c38f71#;
   pragma Export (C, u00058, "system__bb__threads__queuesS");
   u00059 : constant Version_32 := 16#666e8420#;
   pragma Export (C, u00059, "system__bb__timeB");
   u00060 : constant Version_32 := 16#57d61edc#;
   pragma Export (C, u00060, "system__bb__timeS");
   u00061 : constant Version_32 := 16#d398a95f#;
   pragma Export (C, u00061, "ada__tagsB");
   u00062 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00062, "ada__tagsS");
   u00063 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00063, "system__htableB");
   u00064 : constant Version_32 := 16#5f41a66b#;
   pragma Export (C, u00064, "system__htableS");
   u00065 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00065, "system__string_hashB");
   u00066 : constant Version_32 := 16#fd1fcd15#;
   pragma Export (C, u00066, "system__string_hashS");
   u00067 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00067, "system__val_unsB");
   u00068 : constant Version_32 := 16#ffad8439#;
   pragma Export (C, u00068, "system__val_unsS");
   u00069 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00069, "system__val_utilB");
   u00070 : constant Version_32 := 16#7723a37f#;
   pragma Export (C, u00070, "system__val_utilS");
   u00071 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00071, "system__case_utilB");
   u00072 : constant Version_32 := 16#e456a3d5#;
   pragma Export (C, u00072, "system__case_utilS");
   u00073 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00073, "system__wch_conB");
   u00074 : constant Version_32 := 16#c0fe3753#;
   pragma Export (C, u00074, "system__wch_conS");
   u00075 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00075, "system__wch_stwB");
   u00076 : constant Version_32 := 16#edef1b52#;
   pragma Export (C, u00076, "system__wch_stwS");
   u00077 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00077, "system__wch_cnvB");
   u00078 : constant Version_32 := 16#cf498da0#;
   pragma Export (C, u00078, "system__wch_cnvS");
   u00079 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00079, "system__wch_jisB");
   u00080 : constant Version_32 := 16#4f399481#;
   pragma Export (C, u00080, "system__wch_jisS");
   u00081 : constant Version_32 := 16#60ec638d#;
   pragma Export (C, u00081, "system__bb__protectionB");
   u00082 : constant Version_32 := 16#fd6a0c2b#;
   pragma Export (C, u00082, "system__bb__protectionS");
   u00083 : constant Version_32 := 16#7af2af36#;
   pragma Export (C, u00083, "system__bb__timing_eventsB");
   u00084 : constant Version_32 := 16#a6b19da0#;
   pragma Export (C, u00084, "system__bb__timing_eventsS");
   u00085 : constant Version_32 := 16#774893cb#;
   pragma Export (C, u00085, "system__multiprocessorsB");
   u00086 : constant Version_32 := 16#12c58d38#;
   pragma Export (C, u00086, "system__multiprocessorsS");
   u00087 : constant Version_32 := 16#92637465#;
   pragma Export (C, u00087, "system__multiprocessors__fair_locksB");
   u00088 : constant Version_32 := 16#a70e2885#;
   pragma Export (C, u00088, "system__multiprocessors__fair_locksS");
   u00089 : constant Version_32 := 16#5f7c11fe#;
   pragma Export (C, u00089, "system__multiprocessors__spin_locksB");
   u00090 : constant Version_32 := 16#9ac42bf1#;
   pragma Export (C, u00090, "system__multiprocessors__spin_locksS");
   u00091 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00091, "ada__exceptions__tracebackB");
   u00092 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00092, "ada__exceptions__tracebackS");
   u00093 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00093, "system__traceback_entriesB");
   u00094 : constant Version_32 := 16#dbd8e3f1#;
   pragma Export (C, u00094, "system__traceback_entriesS");
   u00095 : constant Version_32 := 16#9ad5afb3#;
   pragma Export (C, u00095, "system__exception_tableB");
   u00096 : constant Version_32 := 16#862d7cc3#;
   pragma Export (C, u00096, "system__exception_tableS");
   u00097 : constant Version_32 := 16#38d4a07a#;
   pragma Export (C, u00097, "system__soft_linksB");
   u00098 : constant Version_32 := 16#fb0a0b74#;
   pragma Export (C, u00098, "system__soft_linksS");
   u00099 : constant Version_32 := 16#cc0049a6#;
   pragma Export (C, u00099, "system__task_primitivesS");
   u00100 : constant Version_32 := 16#336da6b2#;
   pragma Export (C, u00100, "system__task_primitives__operationsB");
   u00101 : constant Version_32 := 16#3d19e90c#;
   pragma Export (C, u00101, "system__task_primitives__operationsS");
   u00102 : constant Version_32 := 16#e0fce7f8#;
   pragma Export (C, u00102, "system__task_infoB");
   u00103 : constant Version_32 := 16#5b99a880#;
   pragma Export (C, u00103, "system__task_infoS");
   u00104 : constant Version_32 := 16#88d7d611#;
   pragma Export (C, u00104, "system__taskingB");
   u00105 : constant Version_32 := 16#48eb5fe5#;
   pragma Export (C, u00105, "system__taskingS");
   u00106 : constant Version_32 := 16#a4a3fc51#;
   pragma Export (C, u00106, "system__tasking__debugB");
   u00107 : constant Version_32 := 16#b275d76a#;
   pragma Export (C, u00107, "system__tasking__debugS");
   u00108 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00108, "system__exceptionsB");
   u00109 : constant Version_32 := 16#b3e07877#;
   pragma Export (C, u00109, "system__exceptionsS");
   u00110 : constant Version_32 := 16#056e902a#;
   pragma Export (C, u00110, "system__exceptions__machineB");
   u00111 : constant Version_32 := 16#a4c69443#;
   pragma Export (C, u00111, "system__exceptions__machineS");
   u00112 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00112, "system__exceptions_debugB");
   u00113 : constant Version_32 := 16#a509ec45#;
   pragma Export (C, u00113, "system__exceptions_debugS");
   u00114 : constant Version_32 := 16#0ae4f3fe#;
   pragma Export (C, u00114, "system__tracebackB");
   u00115 : constant Version_32 := 16#79b43af5#;
   pragma Export (C, u00115, "system__tracebackS");
   u00116 : constant Version_32 := 16#bb296fbb#;
   pragma Export (C, u00116, "system__traceback__symbolicB");
   u00117 : constant Version_32 := 16#34559061#;
   pragma Export (C, u00117, "system__traceback__symbolicS");
   u00118 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00118, "system__address_imageB");
   u00119 : constant Version_32 := 16#7a6f88bb#;
   pragma Export (C, u00119, "system__address_imageS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  gnat%s
   --  interfaces%s
   --  interfaces.bit_types%s
   --  system%s
   --  interfaces.stm32%s
   --  system.bb%s
   --  system.bb.board_parameters%s
   --  system.bb.cpu_specific%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.machine_code%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.secondary_stack%s
   --  system.secondary_stack%b
   --  gnat.debug_utilities%s
   --  gnat.debug_utilities%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  interfaces.stm32.gpio%s
   --  interfaces.stm32.pwr%s
   --  interfaces.stm32.rcc%s
   --  interfaces.stm32.usart%s
   --  system.bb.mcu_parameters%s
   --  system.bb.mcu_parameters%b
   --  system.stm32%s
   --  system.bb.parameters%s
   --  system.stm32%b
   --  system.text_io%s
   --  system.text_io%b
   --  system.io%s
   --  system.io%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.multiprocessors%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  ada.exceptions%s
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.memory%s
   --  system.memory%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.wch_stw%s
   --  ada.tags%s
   --  system.bb.time%s
   --  system.bb.protection%s
   --  system.bb.interrupts%s
   --  system.bb.board_support%s
   --  system.multiprocessors%b
   --  system.multiprocessors.spin_locks%s
   --  system.multiprocessors.spin_locks%b
   --  system.multiprocessors.fair_locks%s
   --  system.bb.cpu_primitives%s
   --  system.bb.cpu_primitives.context_switch_trigger%s
   --  system.bb.cpu_primitives.context_switch_trigger%b
   --  system.bb.board_support%b
   --  ada.exceptions.last_chance_handler%s
   --  system.val_util%s
   --  system.val_uns%s
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  system.wch_stw%b
   --  ada.tags%b
   --  system.bb.timing_events%s
   --  system.bb.threads%s
   --  system.bb.threads.queues%s
   --  system.bb.threads.queues%b
   --  system.bb.interrupts%b
   --  system.bb.cpu_primitives%b
   --  system.os_interface%s
   --  system.task_primitives%s
   --  ada.exceptions.last_chance_handler%b
   --  system.val_util%b
   --  system.val_uns%b
   --  ada.exceptions%b
   --  system.tasking%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%s
   --  system.tasking%b
   --  system.soft_links%b
   --  system.bb.timing_events%b
   --  system.bb.time%b
   --  system.bb.protection%b
   --  system.bb.threads%b
   --  system.multiprocessors.fair_locks%b
   --  system.task_primitives.operations%b
   --  test%s
   --  test%b
   --  c2ada%b
   --  END ELABORATION ORDER

end ada_main;
