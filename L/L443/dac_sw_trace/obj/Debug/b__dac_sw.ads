pragma Ada_95;
pragma Warnings (Off);
with System;
package ada_main is


   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2016 (20160515-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_dac_sw" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   procedure main;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#67870878#;
   pragma Export (C, u00001, "dac_swB");
   u00002 : constant Version_32 := 16#abae7442#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#73099791#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#669e66b4#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#ddcfa2ee#;
   pragma Export (C, u00005, "ada__numericsS");
   u00006 : constant Version_32 := 16#6646b8c6#;
   pragma Export (C, u00006, "systemS");
   u00007 : constant Version_32 := 16#df255519#;
   pragma Export (C, u00007, "ada__real_timeB");
   u00008 : constant Version_32 := 16#786da119#;
   pragma Export (C, u00008, "ada__real_timeS");
   u00009 : constant Version_32 := 16#215e5eae#;
   pragma Export (C, u00009, "system__task_primitivesS");
   u00010 : constant Version_32 := 16#2bdb7bcc#;
   pragma Export (C, u00010, "system__os_interfaceS");
   u00011 : constant Version_32 := 16#d298f53b#;
   pragma Export (C, u00011, "system__bbS");
   u00012 : constant Version_32 := 16#497c2a22#;
   pragma Export (C, u00012, "system__bb__board_supportB");
   u00013 : constant Version_32 := 16#6c151b88#;
   pragma Export (C, u00013, "system__bb__board_supportS");
   u00014 : constant Version_32 := 16#a9652a9e#;
   pragma Export (C, u00014, "system__bb__parametersS");
   u00015 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00015, "interfacesS");
   u00016 : constant Version_32 := 16#eccb4efe#;
   pragma Export (C, u00016, "interfaces__stm32S");
   u00017 : constant Version_32 := 16#49a0afd6#;
   pragma Export (C, u00017, "interfaces__stm32__rccS");
   u00018 : constant Version_32 := 16#e721877b#;
   pragma Export (C, u00018, "interfaces__bit_typesS");
   u00019 : constant Version_32 := 16#52c0c445#;
   pragma Export (C, u00019, "system__unsigned_typesS");
   u00020 : constant Version_32 := 16#7274cf3a#;
   pragma Export (C, u00020, "system__bb__board_parametersS");
   u00021 : constant Version_32 := 16#1d036890#;
   pragma Export (C, u00021, "system__bb__mcu_parametersB");
   u00022 : constant Version_32 := 16#57f2449f#;
   pragma Export (C, u00022, "system__bb__mcu_parametersS");
   u00023 : constant Version_32 := 16#182dcb18#;
   pragma Export (C, u00023, "interfaces__stm32__pwrS");
   u00024 : constant Version_32 := 16#bae44d78#;
   pragma Export (C, u00024, "system__stm32B");
   u00025 : constant Version_32 := 16#9161f971#;
   pragma Export (C, u00025, "system__stm32S");
   u00026 : constant Version_32 := 16#69fdc308#;
   pragma Export (C, u00026, "system__machine_codeS");
   u00027 : constant Version_32 := 16#09705416#;
   pragma Export (C, u00027, "system__bb__cpu_primitivesB");
   u00028 : constant Version_32 := 16#f0f54f29#;
   pragma Export (C, u00028, "system__bb__cpu_primitivesS");
   u00029 : constant Version_32 := 16#c6c99d66#;
   pragma Export (C, u00029, "ada__exceptionsB");
   u00030 : constant Version_32 := 16#e9d950c8#;
   pragma Export (C, u00030, "ada__exceptionsS");
   u00031 : constant Version_32 := 16#9ff58e61#;
   pragma Export (C, u00031, "ada__exceptions__last_chance_handlerB");
   u00032 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00032, "ada__exceptions__last_chance_handlerS");
   u00033 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00033, "gnatS");
   u00034 : constant Version_32 := 16#bde1380e#;
   pragma Export (C, u00034, "gnat__debug_utilitiesB");
   u00035 : constant Version_32 := 16#987dcd8c#;
   pragma Export (C, u00035, "gnat__debug_utilitiesS");
   u00036 : constant Version_32 := 16#a56b3ef3#;
   pragma Export (C, u00036, "system__secondary_stackB");
   u00037 : constant Version_32 := 16#ef559880#;
   pragma Export (C, u00037, "system__secondary_stackS");
   u00038 : constant Version_32 := 16#dcb9a4e8#;
   pragma Export (C, u00038, "system__storage_elementsB");
   u00039 : constant Version_32 := 16#4b85f2c2#;
   pragma Export (C, u00039, "system__storage_elementsS");
   u00040 : constant Version_32 := 16#37ec8d54#;
   pragma Export (C, u00040, "system__ioB");
   u00041 : constant Version_32 := 16#f8044f89#;
   pragma Export (C, u00041, "system__ioS");
   u00042 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00042, "system__img_intB");
   u00043 : constant Version_32 := 16#649d5804#;
   pragma Export (C, u00043, "system__img_intS");
   u00044 : constant Version_32 := 16#3a74c49f#;
   pragma Export (C, u00044, "system__text_ioB");
   u00045 : constant Version_32 := 16#1374e837#;
   pragma Export (C, u00045, "system__text_ioS");
   u00046 : constant Version_32 := 16#8a951db7#;
   pragma Export (C, u00046, "interfaces__stm32__gpioS");
   u00047 : constant Version_32 := 16#a35d2b41#;
   pragma Export (C, u00047, "interfaces__stm32__usartS");
   u00048 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00048, "ada__exceptions__tracebackB");
   u00049 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00049, "ada__exceptions__tracebackS");
   u00050 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00050, "system__traceback_entriesB");
   u00051 : constant Version_32 := 16#661d4eb6#;
   pragma Export (C, u00051, "system__traceback_entriesS");
   u00052 : constant Version_32 := 16#9ad5afb3#;
   pragma Export (C, u00052, "system__exception_tableB");
   u00053 : constant Version_32 := 16#3be8d184#;
   pragma Export (C, u00053, "system__exception_tableS");
   u00054 : constant Version_32 := 16#adfc1adc#;
   pragma Export (C, u00054, "system__soft_linksB");
   u00055 : constant Version_32 := 16#46cfa633#;
   pragma Export (C, u00055, "system__soft_linksS");
   u00056 : constant Version_32 := 16#4190faa9#;
   pragma Export (C, u00056, "system__task_primitives__operationsB");
   u00057 : constant Version_32 := 16#2beb80a0#;
   pragma Export (C, u00057, "system__task_primitives__operationsS");
   u00058 : constant Version_32 := 16#e0fce7f8#;
   pragma Export (C, u00058, "system__task_infoB");
   u00059 : constant Version_32 := 16#e65c05c7#;
   pragma Export (C, u00059, "system__task_infoS");
   u00060 : constant Version_32 := 16#b2c3e52c#;
   pragma Export (C, u00060, "system__taskingB");
   u00061 : constant Version_32 := 16#f78c9625#;
   pragma Export (C, u00061, "system__taskingS");
   u00062 : constant Version_32 := 16#5a83c3a4#;
   pragma Export (C, u00062, "system__multiprocessorsB");
   u00063 : constant Version_32 := 16#0bef7f4c#;
   pragma Export (C, u00063, "system__multiprocessorsS");
   u00064 : constant Version_32 := 16#c0ab394a#;
   pragma Export (C, u00064, "system__parametersB");
   u00065 : constant Version_32 := 16#afb8eb99#;
   pragma Export (C, u00065, "system__parametersS");
   u00066 : constant Version_32 := 16#0f8eba36#;
   pragma Export (C, u00066, "system__tasking__debugB");
   u00067 : constant Version_32 := 16#6b583f9f#;
   pragma Export (C, u00067, "system__tasking__debugS");
   u00068 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00068, "system__exceptionsB");
   u00069 : constant Version_32 := 16#0e25d530#;
   pragma Export (C, u00069, "system__exceptionsS");
   u00070 : constant Version_32 := 16#ee157335#;
   pragma Export (C, u00070, "system__exceptions__machineS");
   u00071 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00071, "system__exceptions_debugB");
   u00072 : constant Version_32 := 16#18cc4102#;
   pragma Export (C, u00072, "system__exceptions_debugS");
   u00073 : constant Version_32 := 16#188dc286#;
   pragma Export (C, u00073, "system__tracebackB");
   u00074 : constant Version_32 := 16#c47197b2#;
   pragma Export (C, u00074, "system__tracebackS");
   u00075 : constant Version_32 := 16#6fd210f2#;
   pragma Export (C, u00075, "system__traceback__symbolicB");
   u00076 : constant Version_32 := 16#210c07ca#;
   pragma Export (C, u00076, "system__traceback__symbolicS");
   u00077 : constant Version_32 := 16#b2bae353#;
   pragma Export (C, u00077, "system__address_imageB");
   u00078 : constant Version_32 := 16#c7aa25fc#;
   pragma Export (C, u00078, "system__address_imageS");
   u00079 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00079, "system__wch_conB");
   u00080 : constant Version_32 := 16#7d3b9a14#;
   pragma Export (C, u00080, "system__wch_conS");
   u00081 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00081, "system__wch_stwB");
   u00082 : constant Version_32 := 16#502ab615#;
   pragma Export (C, u00082, "system__wch_stwS");
   u00083 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00083, "system__wch_cnvB");
   u00084 : constant Version_32 := 16#728c20e7#;
   pragma Export (C, u00084, "system__wch_cnvS");
   u00085 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00085, "system__wch_jisB");
   u00086 : constant Version_32 := 16#f2fc39c6#;
   pragma Export (C, u00086, "system__wch_jisS");
   u00087 : constant Version_32 := 16#d75b1d4c#;
   pragma Export (C, u00087, "system__bb__threadsB");
   u00088 : constant Version_32 := 16#8ca3fa4b#;
   pragma Export (C, u00088, "system__bb__threadsS");
   u00089 : constant Version_32 := 16#51219b17#;
   pragma Export (C, u00089, "system__bb__protectionB");
   u00090 : constant Version_32 := 16#40543378#;
   pragma Export (C, u00090, "system__bb__protectionS");
   u00091 : constant Version_32 := 16#5b35ed67#;
   pragma Export (C, u00091, "system__bb__threads__queuesB");
   u00092 : constant Version_32 := 16#63341024#;
   pragma Export (C, u00092, "system__bb__threads__queuesS");
   u00093 : constant Version_32 := 16#1a7dc503#;
   pragma Export (C, u00093, "system__bb__cpu_primitives__multiprocessorsB");
   u00094 : constant Version_32 := 16#127f1e3a#;
   pragma Export (C, u00094, "system__bb__cpu_primitives__multiprocessorsS");
   u00095 : constant Version_32 := 16#7fc9cd23#;
   pragma Export (C, u00095, "system__bb__timeB");
   u00096 : constant Version_32 := 16#eae8218f#;
   pragma Export (C, u00096, "system__bb__timeS");
   u00097 : constant Version_32 := 16#771734b4#;
   pragma Export (C, u00097, "ada__tagsB");
   u00098 : constant Version_32 := 16#4aa8cf5f#;
   pragma Export (C, u00098, "ada__tagsS");
   u00099 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00099, "system__htableB");
   u00100 : constant Version_32 := 16#e2840b2c#;
   pragma Export (C, u00100, "system__htableS");
   u00101 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00101, "system__string_hashB");
   u00102 : constant Version_32 := 16#40da6052#;
   pragma Export (C, u00102, "system__string_hashS");
   u00103 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00103, "system__val_unsB");
   u00104 : constant Version_32 := 16#4268297e#;
   pragma Export (C, u00104, "system__val_unsS");
   u00105 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00105, "system__val_utilB");
   u00106 : constant Version_32 := 16#cae60e38#;
   pragma Export (C, u00106, "system__val_utilS");
   u00107 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00107, "system__case_utilB");
   u00108 : constant Version_32 := 16#424fd111#;
   pragma Export (C, u00108, "system__case_utilS");
   u00109 : constant Version_32 := 16#ce253456#;
   pragma Export (C, u00109, "system__bb__interruptsB");
   u00110 : constant Version_32 := 16#f872d067#;
   pragma Export (C, u00110, "system__bb__interruptsS");
   u00111 : constant Version_32 := 16#17db3fbf#;
   pragma Export (C, u00111, "system__bb__timing_eventsB");
   u00112 : constant Version_32 := 16#fe2209f8#;
   pragma Export (C, u00112, "system__bb__timing_eventsS");
   u00113 : constant Version_32 := 16#0941e52e#;
   pragma Export (C, u00113, "system__multiprocessors__fair_locksB");
   u00114 : constant Version_32 := 16#a70e2885#;
   pragma Export (C, u00114, "system__multiprocessors__fair_locksS");
   u00115 : constant Version_32 := 16#5f7c11fe#;
   pragma Export (C, u00115, "system__multiprocessors__spin_locksB");
   u00116 : constant Version_32 := 16#9ac42bf1#;
   pragma Export (C, u00116, "system__multiprocessors__spin_locksS");
   u00117 : constant Version_32 := 16#d3a2eabd#;
   pragma Export (C, u00117, "ada__text_ioB");
   u00118 : constant Version_32 := 16#99562386#;
   pragma Export (C, u00118, "ada__text_ioS");
   u00119 : constant Version_32 := 16#71f79a66#;
   pragma Export (C, u00119, "halS");
   u00120 : constant Version_32 := 16#1879b65d#;
   pragma Export (C, u00120, "stm32S");
   u00121 : constant Version_32 := 16#e481624e#;
   pragma Export (C, u00121, "stm32__dacB");
   u00122 : constant Version_32 := 16#a37032eb#;
   pragma Export (C, u00122, "stm32__dacS");
   u00123 : constant Version_32 := 16#a304bf33#;
   pragma Export (C, u00123, "stm32_svdS");
   u00124 : constant Version_32 := 16#fbc8100f#;
   pragma Export (C, u00124, "stm32_svd__dacS");
   u00125 : constant Version_32 := 16#52f1910f#;
   pragma Export (C, u00125, "system__assertionsB");
   u00126 : constant Version_32 := 16#abcb9452#;
   pragma Export (C, u00126, "system__assertionsS");
   u00127 : constant Version_32 := 16#a96e5e5d#;
   pragma Export (C, u00127, "stm32__deviceB");
   u00128 : constant Version_32 := 16#8bd950fc#;
   pragma Export (C, u00128, "stm32__deviceS");
   u00129 : constant Version_32 := 16#84449f5e#;
   pragma Export (C, u00129, "stm32_svd__rccS");
   u00130 : constant Version_32 := 16#84ecf1eb#;
   pragma Export (C, u00130, "stm32__adcB");
   u00131 : constant Version_32 := 16#e0ee62e1#;
   pragma Export (C, u00131, "stm32__adcS");
   u00132 : constant Version_32 := 16#6a4c6cb2#;
   pragma Export (C, u00132, "ada__real_time__delaysB");
   u00133 : constant Version_32 := 16#64efb39b#;
   pragma Export (C, u00133, "ada__real_time__delaysS");
   u00134 : constant Version_32 := 16#c72b3d09#;
   pragma Export (C, u00134, "stm32_svd__adcS");
   u00135 : constant Version_32 := 16#0512a1e8#;
   pragma Export (C, u00135, "stm32__crcB");
   u00136 : constant Version_32 := 16#0169c58f#;
   pragma Export (C, u00136, "stm32__crcS");
   u00137 : constant Version_32 := 16#7e562d48#;
   pragma Export (C, u00137, "stm32_svd__crcS");
   u00138 : constant Version_32 := 16#78a75446#;
   pragma Export (C, u00138, "stm32__dmaB");
   u00139 : constant Version_32 := 16#194c91a7#;
   pragma Export (C, u00139, "stm32__dmaS");
   u00140 : constant Version_32 := 16#61e4fe5f#;
   pragma Export (C, u00140, "stm32_svd__dmaS");
   u00141 : constant Version_32 := 16#b72b5631#;
   pragma Export (C, u00141, "stm32__gpioB");
   u00142 : constant Version_32 := 16#e63de2c6#;
   pragma Export (C, u00142, "stm32__gpioS");
   u00143 : constant Version_32 := 16#81159258#;
   pragma Export (C, u00143, "stm32__rccB");
   u00144 : constant Version_32 := 16#738b340d#;
   pragma Export (C, u00144, "stm32__rccS");
   u00145 : constant Version_32 := 16#06a98a33#;
   pragma Export (C, u00145, "stm32__syscfgB");
   u00146 : constant Version_32 := 16#9876f55d#;
   pragma Export (C, u00146, "stm32__syscfgS");
   u00147 : constant Version_32 := 16#0b2850f0#;
   pragma Export (C, u00147, "stm32__extiB");
   u00148 : constant Version_32 := 16#4e29fc64#;
   pragma Export (C, u00148, "stm32__extiS");
   u00149 : constant Version_32 := 16#d5ea2931#;
   pragma Export (C, u00149, "stm32_svd__extiS");
   u00150 : constant Version_32 := 16#72c1c4f7#;
   pragma Export (C, u00150, "stm32_svd__syscfgS");
   u00151 : constant Version_32 := 16#ebd807a5#;
   pragma Export (C, u00151, "stm32_svd__gpioS");
   u00152 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00152, "ada__streamsB");
   u00153 : constant Version_32 := 16#7705e907#;
   pragma Export (C, u00153, "ada__streamsS");
   u00154 : constant Version_32 := 16#823e79d0#;
   pragma Export (C, u00154, "ada__io_exceptionsS");
   u00155 : constant Version_32 := 16#3f21acb6#;
   pragma Export (C, u00155, "hal__gpioS");
   u00156 : constant Version_32 := 16#77cfbaf2#;
   pragma Export (C, u00156, "system__finalization_mastersB");
   u00157 : constant Version_32 := 16#3dba810c#;
   pragma Export (C, u00157, "system__finalization_mastersS");
   u00158 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00158, "system__img_boolB");
   u00159 : constant Version_32 := 16#939fc92d#;
   pragma Export (C, u00159, "system__img_boolS");
   u00160 : constant Version_32 := 16#9623954f#;
   pragma Export (C, u00160, "ada__finalizationS");
   u00161 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00161, "system__finalization_rootB");
   u00162 : constant Version_32 := 16#29b4cb56#;
   pragma Export (C, u00162, "system__finalization_rootS");
   u00163 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00163, "system__storage_poolsB");
   u00164 : constant Version_32 := 16#45ab266b#;
   pragma Export (C, u00164, "system__storage_poolsS");
   u00165 : constant Version_32 := 16#5a895de2#;
   pragma Export (C, u00165, "system__pool_globalB");
   u00166 : constant Version_32 := 16#7141203e#;
   pragma Export (C, u00166, "system__pool_globalS");
   u00167 : constant Version_32 := 16#a66a0087#;
   pragma Export (C, u00167, "system__memoryB");
   u00168 : constant Version_32 := 16#3f3bdef2#;
   pragma Export (C, u00168, "system__memoryS");
   u00169 : constant Version_32 := 16#11f85980#;
   pragma Export (C, u00169, "system__stream_attributesB");
   u00170 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00170, "system__stream_attributesS");
   u00171 : constant Version_32 := 16#5c37ab0d#;
   pragma Export (C, u00171, "stm32__i2cB");
   u00172 : constant Version_32 := 16#63089794#;
   pragma Export (C, u00172, "stm32__i2cS");
   u00173 : constant Version_32 := 16#2595f936#;
   pragma Export (C, u00173, "hal__i2cS");
   u00174 : constant Version_32 := 16#250046b4#;
   pragma Export (C, u00174, "stm32_svd__i2cS");
   u00175 : constant Version_32 := 16#d213a809#;
   pragma Export (C, u00175, "stm32__spiB");
   u00176 : constant Version_32 := 16#8694d5b8#;
   pragma Export (C, u00176, "stm32__spiS");
   u00177 : constant Version_32 := 16#433dd96d#;
   pragma Export (C, u00177, "stm32_svd__spiS");
   u00178 : constant Version_32 := 16#d5515017#;
   pragma Export (C, u00178, "hal__spiS");
   u00179 : constant Version_32 := 16#97a26746#;
   pragma Export (C, u00179, "stm32__timersB");
   u00180 : constant Version_32 := 16#28dd7a8b#;
   pragma Export (C, u00180, "stm32__timersS");
   u00181 : constant Version_32 := 16#4074acc1#;
   pragma Export (C, u00181, "system__libm_singleB");
   u00182 : constant Version_32 := 16#ef0ac2ce#;
   pragma Export (C, u00182, "system__libm_singleS");
   u00183 : constant Version_32 := 16#3e33a4d2#;
   pragma Export (C, u00183, "system__fat_fltS");
   u00184 : constant Version_32 := 16#090d83cc#;
   pragma Export (C, u00184, "system__libmB");
   u00185 : constant Version_32 := 16#e1341d41#;
   pragma Export (C, u00185, "system__libmS");
   u00186 : constant Version_32 := 16#02782c77#;
   pragma Export (C, u00186, "system__libm_single__squarerootB");
   u00187 : constant Version_32 := 16#f76d7ac6#;
   pragma Export (C, u00187, "system__libm_single__squarerootS");
   u00188 : constant Version_32 := 16#9f7a6252#;
   pragma Export (C, u00188, "system__libm_prefixS");
   u00189 : constant Version_32 := 16#1f138d00#;
   pragma Export (C, u00189, "traceB");
   u00190 : constant Version_32 := 16#e0bdcea4#;
   pragma Export (C, u00190, "traceS");
   u00191 : constant Version_32 := 16#ab1d4aef#;
   pragma Export (C, u00191, "cortex_m_svdS");
   u00192 : constant Version_32 := 16#a7dbdddf#;
   pragma Export (C, u00192, "cortex_m_svd__debugS");
   u00193 : constant Version_32 := 16#87d18502#;
   pragma Export (C, u00193, "cortex_m_svd__dwtS");
   u00194 : constant Version_32 := 16#ccf4ae88#;
   pragma Export (C, u00194, "stm32__boardB");
   u00195 : constant Version_32 := 16#254fde3d#;
   pragma Export (C, u00195, "stm32__boardS");
   u00196 : constant Version_32 := 16#dd943c83#;
   pragma Export (C, u00196, "stm32__setupS");
   u00197 : constant Version_32 := 16#6a788516#;
   pragma Export (C, u00197, "stm32_svd__dbgmcuS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  gnat%s
   --  interfaces%s
   --  interfaces.bit_types%s
   --  system%s
   --  ada.io_exceptions%s
   --  ada.numerics%s
   --  gnat.debug_utilities%s
   --  interfaces.stm32%s
   --  system.bb%s
   --  system.bb.board_parameters%s
   --  system.bb.protection%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.libm%s
   --  system.libm%b
   --  system.libm_prefix%s
   --  system.libm_single%s
   --  system.libm_single.squareroot%s
   --  system.libm_single.squareroot%b
   --  system.machine_code%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  ada.tags%s
   --  ada.streams%s
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.text_io%s
   --  system.io%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  ada.streams%b
   --  system.exceptions.machine%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.soft_links%s
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.unsigned_types%s
   --  interfaces.stm32.gpio%s
   --  interfaces.stm32.pwr%s
   --  interfaces.stm32.rcc%s
   --  interfaces.stm32.usart%s
   --  system.bb.mcu_parameters%s
   --  system.bb.mcu_parameters%b
   --  system.fat_flt%s
   --  system.libm_single%b
   --  system.stm32%s
   --  system.bb.parameters%s
   --  system.stm32%b
   --  system.text_io%b
   --  system.bb.cpu_primitives%s
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.bb.cpu_primitives.multiprocessors%s
   --  system.bb.cpu_primitives.multiprocessors%b
   --  system.bb.interrupts%s
   --  system.bb.board_support%s
   --  system.bb.board_support%b
   --  system.bb.time%s
   --  system.bb.threads%s
   --  system.bb.threads.queues%s
   --  system.bb.threads.queues%b
   --  system.bb.threads%b
   --  system.bb.interrupts%b
   --  system.bb.cpu_primitives%b
   --  system.bb.protection%b
   --  system.bb.timing_events%s
   --  system.bb.timing_events%b
   --  system.multiprocessors.spin_locks%s
   --  system.multiprocessors.spin_locks%b
   --  system.multiprocessors.fair_locks%s
   --  system.bb.time%b
   --  system.os_interface%s
   --  system.multiprocessors.fair_locks%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.task_primitives%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.soft_links%b
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.traceback%s
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.address_image%s
   --  system.assertions%s
   --  system.assertions%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.secondary_stack%s
   --  system.tasking%b
   --  system.finalization_masters%b
   --  ada.tags%b
   --  gnat.debug_utilities%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  ada.exceptions.traceback%b
   --  ada.exceptions.last_chance_handler%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.real_time.delays%s
   --  ada.real_time.delays%b
   --  cortex_m_svd%s
   --  hal%s
   --  cortex_m_svd.debug%s
   --  cortex_m_svd.dwt%s
   --  stm32%s
   --  stm32_svd%s
   --  stm32_svd.adc%s
   --  stm32_svd.crc%s
   --  stm32_svd.dac%s
   --  stm32_svd.dbgmcu%s
   --  stm32_svd.dma%s
   --  stm32_svd.exti%s
   --  stm32_svd.gpio%s
   --  stm32_svd.i2c%s
   --  stm32_svd.rcc%s
   --  stm32_svd.spi%s
   --  stm32_svd.syscfg%s
   --  hal.gpio%s
   --  hal.i2c%s
   --  hal.spi%s
   --  stm32.adc%s
   --  stm32.adc%b
   --  stm32.crc%s
   --  stm32.crc%b
   --  stm32.dac%s
   --  stm32.dac%b
   --  stm32.dma%s
   --  stm32.dma%b
   --  stm32.exti%s
   --  stm32.exti%b
   --  stm32.gpio%s
   --  stm32.i2c%s
   --  stm32.i2c%b
   --  stm32.rcc%s
   --  stm32.rcc%b
   --  stm32.setup%s
   --  stm32.spi%s
   --  stm32.spi%b
   --  stm32.syscfg%s
   --  stm32.gpio%b
   --  stm32.timers%s
   --  stm32.timers%b
   --  stm32.device%s
   --  stm32.device%b
   --  stm32.syscfg%b
   --  stm32.board%s
   --  stm32.board%b
   --  trace%s
   --  trace%b
   --  dac_sw%b
   --  END ELABORATION ORDER


end ada_main;
