pragma Ada_95;
pragma Warnings (Off);
pragma Restrictions (No_Exception_Propagation);
with System;
package ada_main is


   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2016 (20160515-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_spi_f103" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#3314c91c#;
   pragma Export (C, u00001, "spi_f103B");
   u00002 : constant Version_32 := 16#0bedc8d1#;
   pragma Export (C, u00002, "systemS");
   u00003 : constant Version_32 := 16#669e66b4#;
   pragma Export (C, u00003, "adaS");
   u00004 : constant Version_32 := 16#500583ea#;
   pragma Export (C, u00004, "ada__real_timeB");
   u00005 : constant Version_32 := 16#786da119#;
   pragma Export (C, u00005, "ada__real_timeS");
   u00006 : constant Version_32 := 16#4cf52eb9#;
   pragma Export (C, u00006, "system__task_primitivesS");
   u00007 : constant Version_32 := 16#55801c0d#;
   pragma Export (C, u00007, "system__os_interfaceS");
   u00008 : constant Version_32 := 16#bf33852c#;
   pragma Export (C, u00008, "system__bbS");
   u00009 : constant Version_32 := 16#fbf6c3ae#;
   pragma Export (C, u00009, "system__bb__board_supportB");
   u00010 : constant Version_32 := 16#6c151b88#;
   pragma Export (C, u00010, "system__bb__board_supportS");
   u00011 : constant Version_32 := 16#ddf58cf5#;
   pragma Export (C, u00011, "system__bb__parametersS");
   u00012 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00012, "interfacesS");
   u00013 : constant Version_32 := 16#2e6937e1#;
   pragma Export (C, u00013, "interfaces__stm32S");
   u00014 : constant Version_32 := 16#ba244e4b#;
   pragma Export (C, u00014, "interfaces__stm32__rccS");
   u00015 : constant Version_32 := 16#e721877b#;
   pragma Export (C, u00015, "interfaces__bit_typesS");
   u00016 : constant Version_32 := 16#3f6bb452#;
   pragma Export (C, u00016, "system__unsigned_typesS");
   u00017 : constant Version_32 := 16#7ad1909d#;
   pragma Export (C, u00017, "system__bb__board_parametersS");
   u00018 : constant Version_32 := 16#201451fa#;
   pragma Export (C, u00018, "system__bb__mcu_parametersB");
   u00019 : constant Version_32 := 16#6dac22e3#;
   pragma Export (C, u00019, "system__bb__mcu_parametersS");
   u00020 : constant Version_32 := 16#128f6fa2#;
   pragma Export (C, u00020, "interfaces__stm32__pwrS");
   u00021 : constant Version_32 := 16#f0f78184#;
   pragma Export (C, u00021, "system__stm32B");
   u00022 : constant Version_32 := 16#50774427#;
   pragma Export (C, u00022, "system__stm32S");
   u00023 : constant Version_32 := 16#0456b31f#;
   pragma Export (C, u00023, "system__machine_codeS");
   u00024 : constant Version_32 := 16#500d98ae#;
   pragma Export (C, u00024, "system__bb__cpu_primitivesB");
   u00025 : constant Version_32 := 16#8eae28e8#;
   pragma Export (C, u00025, "system__bb__cpu_primitivesS");
   u00026 : constant Version_32 := 16#5e68f5cc#;
   pragma Export (C, u00026, "ada__exceptionsB");
   u00027 : constant Version_32 := 16#362ca14a#;
   pragma Export (C, u00027, "ada__exceptionsS");
   u00028 : constant Version_32 := 16#c4ab0a9a#;
   pragma Export (C, u00028, "system__bb__threadsB");
   u00029 : constant Version_32 := 16#e1088a5c#;
   pragma Export (C, u00029, "system__bb__threadsS");
   u00030 : constant Version_32 := 16#42d18cc1#;
   pragma Export (C, u00030, "system__bb__protectionB");
   u00031 : constant Version_32 := 16#40543378#;
   pragma Export (C, u00031, "system__bb__protectionS");
   u00032 : constant Version_32 := 16#5b35ed67#;
   pragma Export (C, u00032, "system__bb__threads__queuesB");
   u00033 : constant Version_32 := 16#63341024#;
   pragma Export (C, u00033, "system__bb__threads__queuesS");
   u00034 : constant Version_32 := 16#1a7dc503#;
   pragma Export (C, u00034, "system__bb__cpu_primitives__multiprocessorsB");
   u00035 : constant Version_32 := 16#127f1e3a#;
   pragma Export (C, u00035, "system__bb__cpu_primitives__multiprocessorsS");
   u00036 : constant Version_32 := 16#5a83c3a4#;
   pragma Export (C, u00036, "system__multiprocessorsB");
   u00037 : constant Version_32 := 16#75b4188d#;
   pragma Export (C, u00037, "system__multiprocessorsS");
   u00038 : constant Version_32 := 16#6c39daf5#;
   pragma Export (C, u00038, "system__bb__timeB");
   u00039 : constant Version_32 := 16#eae8218f#;
   pragma Export (C, u00039, "system__bb__timeS");
   u00040 : constant Version_32 := 16#5080ab39#;
   pragma Export (C, u00040, "ada__tagsB");
   u00041 : constant Version_32 := 16#8cf2bb30#;
   pragma Export (C, u00041, "ada__tagsS");
   u00042 : constant Version_32 := 16#5f0d82b3#;
   pragma Export (C, u00042, "system__secondary_stackB");
   u00043 : constant Version_32 := 16#789854d7#;
   pragma Export (C, u00043, "system__secondary_stackS");
   u00044 : constant Version_32 := 16#dcb9a4e8#;
   pragma Export (C, u00044, "system__storage_elementsB");
   u00045 : constant Version_32 := 16#262e82d5#;
   pragma Export (C, u00045, "system__storage_elementsS");
   u00046 : constant Version_32 := 16#ce253456#;
   pragma Export (C, u00046, "system__bb__interruptsB");
   u00047 : constant Version_32 := 16#8629b7a6#;
   pragma Export (C, u00047, "system__bb__interruptsS");
   u00048 : constant Version_32 := 16#042b2869#;
   pragma Export (C, u00048, "system__bb__timing_eventsB");
   u00049 : constant Version_32 := 16#fe2209f8#;
   pragma Export (C, u00049, "system__bb__timing_eventsS");
   u00050 : constant Version_32 := 16#0941e52e#;
   pragma Export (C, u00050, "system__multiprocessors__fair_locksB");
   u00051 : constant Version_32 := 16#a70e2885#;
   pragma Export (C, u00051, "system__multiprocessors__fair_locksS");
   u00052 : constant Version_32 := 16#5f7c11fe#;
   pragma Export (C, u00052, "system__multiprocessors__spin_locksB");
   u00053 : constant Version_32 := 16#9ac42bf1#;
   pragma Export (C, u00053, "system__multiprocessors__spin_locksS");
   u00054 : constant Version_32 := 16#c0ab394a#;
   pragma Export (C, u00054, "system__parametersB");
   u00055 : constant Version_32 := 16#c2139b8e#;
   pragma Export (C, u00055, "system__parametersS");
   u00056 : constant Version_32 := 16#4190faa9#;
   pragma Export (C, u00056, "system__task_primitives__operationsB");
   u00057 : constant Version_32 := 16#a4cb5653#;
   pragma Export (C, u00057, "system__task_primitives__operationsS");
   u00058 : constant Version_32 := 16#e0fce7f8#;
   pragma Export (C, u00058, "system__task_infoB");
   u00059 : constant Version_32 := 16#8bf775d0#;
   pragma Export (C, u00059, "system__task_infoS");
   u00060 : constant Version_32 := 16#c7858f9f#;
   pragma Export (C, u00060, "system__taskingB");
   u00061 : constant Version_32 := 16#3c1e2214#;
   pragma Export (C, u00061, "system__taskingS");
   u00062 : constant Version_32 := 16#0f8eba36#;
   pragma Export (C, u00062, "system__tasking__debugB");
   u00063 : constant Version_32 := 16#6b583f9f#;
   pragma Export (C, u00063, "system__tasking__debugS");
   u00064 : constant Version_32 := 16#d3a2eabd#;
   pragma Export (C, u00064, "ada__text_ioB");
   u00065 : constant Version_32 := 16#99562386#;
   pragma Export (C, u00065, "ada__text_ioS");
   u00066 : constant Version_32 := 16#78d7ba51#;
   pragma Export (C, u00066, "system__text_ioB");
   u00067 : constant Version_32 := 16#7edf9820#;
   pragma Export (C, u00067, "system__text_ioS");
   u00068 : constant Version_32 := 16#54f3ef79#;
   pragma Export (C, u00068, "interfaces__stm32__gpioS");
   u00069 : constant Version_32 := 16#d6f238fc#;
   pragma Export (C, u00069, "interfaces__stm32__usartS");
   u00070 : constant Version_32 := 16#71f79a66#;
   pragma Export (C, u00070, "halS");
   u00071 : constant Version_32 := 16#d5515017#;
   pragma Export (C, u00071, "hal__spiS");
   u00072 : constant Version_32 := 16#189dd11d#;
   pragma Export (C, u00072, "last_chance_handlerB");
   u00073 : constant Version_32 := 16#d1bc38d5#;
   pragma Export (C, u00073, "last_chance_handlerS");
   u00074 : constant Version_32 := 16#6a4c6cb2#;
   pragma Export (C, u00074, "ada__real_time__delaysB");
   u00075 : constant Version_32 := 16#64efb39b#;
   pragma Export (C, u00075, "ada__real_time__delaysS");
   u00076 : constant Version_32 := 16#1879b65d#;
   pragma Export (C, u00076, "stm32S");
   u00077 : constant Version_32 := 16#ab5f03f3#;
   pragma Export (C, u00077, "stm32__boardB");
   u00078 : constant Version_32 := 16#7398dfbc#;
   pragma Export (C, u00078, "stm32__boardS");
   u00079 : constant Version_32 := 16#6eca58e1#;
   pragma Export (C, u00079, "stm32__setupS");
   u00080 : constant Version_32 := 16#1fd5c97f#;
   pragma Export (C, u00080, "stm32__gpioB");
   u00081 : constant Version_32 := 16#d14b8c45#;
   pragma Export (C, u00081, "stm32__gpioS");
   u00082 : constant Version_32 := 16#a71f2a10#;
   pragma Export (C, u00082, "stm32__rccB");
   u00083 : constant Version_32 := 16#593a7088#;
   pragma Export (C, u00083, "stm32__rccS");
   u00084 : constant Version_32 := 16#61404bc6#;
   pragma Export (C, u00084, "stm32__deviceB");
   u00085 : constant Version_32 := 16#20e562e2#;
   pragma Export (C, u00085, "stm32__deviceS");
   u00086 : constant Version_32 := 16#5340d707#;
   pragma Export (C, u00086, "stm32_svdS");
   u00087 : constant Version_32 := 16#78b98332#;
   pragma Export (C, u00087, "stm32_svd__rccS");
   u00088 : constant Version_32 := 16#748adc27#;
   pragma Export (C, u00088, "system__assertionsB");
   u00089 : constant Version_32 := 16#c660e445#;
   pragma Export (C, u00089, "system__assertionsS");
   u00090 : constant Version_32 := 16#269d2c81#;
   pragma Export (C, u00090, "stm32__adcB");
   u00091 : constant Version_32 := 16#e6605efc#;
   pragma Export (C, u00091, "stm32__adcS");
   u00092 : constant Version_32 := 16#7a710d0b#;
   pragma Export (C, u00092, "stm32_svd__adcS");
   u00093 : constant Version_32 := 16#0512a1e8#;
   pragma Export (C, u00093, "stm32__crcB");
   u00094 : constant Version_32 := 16#186e8887#;
   pragma Export (C, u00094, "stm32__crcS");
   u00095 : constant Version_32 := 16#97150874#;
   pragma Export (C, u00095, "stm32_svd__crcS");
   u00096 : constant Version_32 := 16#78602d2a#;
   pragma Export (C, u00096, "stm32__dacB");
   u00097 : constant Version_32 := 16#56967a8e#;
   pragma Export (C, u00097, "stm32__dacS");
   u00098 : constant Version_32 := 16#169d928b#;
   pragma Export (C, u00098, "stm32_svd__dacS");
   u00099 : constant Version_32 := 16#817a1cff#;
   pragma Export (C, u00099, "stm32__dmaB");
   u00100 : constant Version_32 := 16#5b75d000#;
   pragma Export (C, u00100, "stm32__dmaS");
   u00101 : constant Version_32 := 16#8a96fb27#;
   pragma Export (C, u00101, "stm32_svd__dmaS");
   u00102 : constant Version_32 := 16#29beb20a#;
   pragma Export (C, u00102, "stm32__i2cB");
   u00103 : constant Version_32 := 16#bd19315c#;
   pragma Export (C, u00103, "stm32__i2cS");
   u00104 : constant Version_32 := 16#cde18a7d#;
   pragma Export (C, u00104, "stm32_svd__i2cS");
   u00105 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00105, "system__img_unsB");
   u00106 : constant Version_32 := 16#a09f88a5#;
   pragma Export (C, u00106, "system__img_unsS");
   u00107 : constant Version_32 := 16#2595f936#;
   pragma Export (C, u00107, "hal__i2cS");
   u00108 : constant Version_32 := 16#cc2a548f#;
   pragma Export (C, u00108, "stm32__i2sB");
   u00109 : constant Version_32 := 16#76b6c69e#;
   pragma Export (C, u00109, "stm32__i2sS");
   u00110 : constant Version_32 := 16#78066153#;
   pragma Export (C, u00110, "hal__audioS");
   u00111 : constant Version_32 := 16#4cefce65#;
   pragma Export (C, u00111, "stm32_svd__spiS");
   u00112 : constant Version_32 := 16#9def1522#;
   pragma Export (C, u00112, "stm32__rtcS");
   u00113 : constant Version_32 := 16#b697e7c4#;
   pragma Export (C, u00113, "hal__real_time_clockS");
   u00114 : constant Version_32 := 16#d974b410#;
   pragma Export (C, u00114, "stm32__spiB");
   u00115 : constant Version_32 := 16#e47e442a#;
   pragma Export (C, u00115, "stm32__spiS");
   u00116 : constant Version_32 := 16#22ac8dee#;
   pragma Export (C, u00116, "stm32__timersB");
   u00117 : constant Version_32 := 16#590bfb8e#;
   pragma Export (C, u00117, "stm32__timersS");
   u00118 : constant Version_32 := 16#af403693#;
   pragma Export (C, u00118, "stm32__usartsB");
   u00119 : constant Version_32 := 16#3d705160#;
   pragma Export (C, u00119, "stm32__usartsS");
   u00120 : constant Version_32 := 16#9f7216dd#;
   pragma Export (C, u00120, "stm32_svd__usartS");
   u00121 : constant Version_32 := 16#fec1deba#;
   pragma Export (C, u00121, "hal__uartS");
   u00122 : constant Version_32 := 16#fb440e58#;
   pragma Export (C, u00122, "stm32_svd__pwrS");
   u00123 : constant Version_32 := 16#ff4dd5b4#;
   pragma Export (C, u00123, "stm32__syscfgS");
   u00124 : constant Version_32 := 16#a6771d8f#;
   pragma Export (C, u00124, "stm32_svd__afioS");
   u00125 : constant Version_32 := 16#992d569d#;
   pragma Export (C, u00125, "stm32_svd__gpioS");
   u00126 : constant Version_32 := 16#3f21acb6#;
   pragma Export (C, u00126, "hal__gpioS");
   u00127 : constant Version_32 := 16#48f027d6#;
   pragma Export (C, u00127, "stm32__extiB");
   u00128 : constant Version_32 := 16#4e29fc64#;
   pragma Export (C, u00128, "stm32__extiS");
   u00129 : constant Version_32 := 16#689a8f6b#;
   pragma Export (C, u00129, "stm32_svd__extiS");
   u00130 : constant Version_32 := 16#63573a44#;
   pragma Export (C, u00130, "peripheralsS");
   u00131 : constant Version_32 := 16#45fecf1a#;
   pragma Export (C, u00131, "spi_eepromB");
   u00132 : constant Version_32 := 16#6318dbc4#;
   pragma Export (C, u00132, "spi_eepromS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  interfaces.bit_types%s
   --  system%s
   --  ada.exceptions%s
   --  ada.exceptions%b
   --  interfaces.stm32%s
   --  interfaces.stm32.pwr%s
   --  interfaces.stm32.usart%s
   --  system.bb%s
   --  system.bb.board_parameters%s
   --  system.bb.mcu_parameters%s
   --  system.bb.mcu_parameters%b
   --  system.bb.protection%s
   --  system.machine_code%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.stm32%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  ada.tags%s
   --  system.task_info%s
   --  system.task_info%b
   --  system.text_io%s
   --  system.unsigned_types%s
   --  interfaces.stm32.gpio%s
   --  interfaces.stm32.rcc%s
   --  system.bb.parameters%s
   --  system.text_io%b
   --  system.stm32%b
   --  system.bb.cpu_primitives%s
   --  system.img_uns%s
   --  system.img_uns%b
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
   --  system.task_primitives%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.assertions%s
   --  system.assertions%b
   --  system.secondary_stack%s
   --  system.tasking%b
   --  ada.tags%b
   --  system.secondary_stack%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.real_time.delays%s
   --  ada.real_time.delays%b
   --  hal%s
   --  stm32%s
   --  stm32_svd%s
   --  stm32_svd.adc%s
   --  stm32_svd.afio%s
   --  stm32_svd.crc%s
   --  stm32_svd.dac%s
   --  stm32_svd.dma%s
   --  stm32_svd.exti%s
   --  stm32_svd.gpio%s
   --  stm32_svd.i2c%s
   --  stm32_svd.pwr%s
   --  stm32_svd.rcc%s
   --  stm32_svd.spi%s
   --  stm32_svd.usart%s
   --  hal.audio%s
   --  hal.gpio%s
   --  hal.i2c%s
   --  hal.real_time_clock%s
   --  hal.spi%s
   --  hal.uart%s
   --  last_chance_handler%s
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
   --  spi_eeprom%s
   --  spi_eeprom%b
   --  stm32.i2c%s
   --  stm32.i2s%s
   --  stm32.rcc%s
   --  stm32.rtc%s
   --  stm32.setup%s
   --  stm32.spi%s
   --  stm32.spi%b
   --  stm32.syscfg%s
   --  stm32.gpio%b
   --  stm32.timers%s
   --  stm32.timers%b
   --  stm32.usarts%s
   --  stm32.device%s
   --  stm32.device%b
   --  stm32.usarts%b
   --  stm32.rcc%b
   --  stm32.i2s%b
   --  stm32.i2c%b
   --  peripherals%s
   --  stm32.board%s
   --  stm32.board%b
   --  last_chance_handler%b
   --  spi_f103%b
   --  END ELABORATION ORDER


end ada_main;
