#include "TargetFeatures.h"
#include "main.h"
#include "OTA.h"
#include "MetaDataManager.h"
#include "sensor_service.h"
#include "bluenrg_utils.h"
#include "HWAdvanceFeatures.h"

#ifdef ALLMEMS1_ENABLE_SD_CARD_LOGGING
#include "DataLog_Manager.h"
#include "datalog_application.h"
#endif /* ALLMEMS1_ENABLE_SD_CARD_LOGGING */

/**
  ******************************************************************************
  * @file    TargetPlatform.c
  * @author  Central LAB
  * @version V3.4.0
  * @date    26-Apr-2018
  * @brief   Initialization of the Target Platform
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT(c) 2018 STMicroelectronics</center></h2>
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */
#include <stdio.h>
#include "TargetFeatures.h"
#include "main.h"

#ifdef ALLMEMS1_ENABLE_SD_CARD_LOGGING
#include "datalog_application.h"
#endif /* ALLMEMS1_ENABLE_SD_CARD_LOGGING */

#ifdef STM32_SENSORTILE
  #ifdef ALLMEMS1_ENABLE_PRINTF
    #include "usbd_core.h"
    #include "usbd_cdc.h"
    #include "usbd_cdc_interface.h"
  #endif /* ALLMEMS1_ENABLE_PRINTF */
#endif /* STM32_SENSORTILE */

/* Imported variables ---------------------------------------------------------*/
#ifdef STM32_SENSORTILE
  #ifdef ALLMEMS1_ENABLE_PRINTF
     extern USBD_DescriptorsTypeDef VCP_Desc;
  #endif /* ALLMEMS1_ENABLE_PRINTF */
#endif /* STM32_SENSORTILE */
/* Exported variables ---------------------------------------------------------*/
TargetFeatures_t TargetBoardFeatures;

#ifdef STM32_SENSORTILE
  #ifdef ALLMEMS1_ENABLE_PRINTF
    USBD_HandleTypeDef  USBD_Device;
  #endif /* ALLMEMS1_ENABLE_PRINTF */
#endif /* STM32_SENSORTILE */

volatile float RMS_Ch[AUDIO_CHANNELS];
float DBNOISE_Value_Old_Ch[AUDIO_CHANNELS];
uint16_t PCM_Buffer[AUDIO_CHANNELS*PCM_AUDIO_IN_SAMPLES];

#ifdef USE_STM32F4XX_NUCLEO
//uint16_t PDM_Buffer[AUDIO_CHANNELS*PCM_AUDIO_IN_SAMPLES*80/8];//64
uint16_t PDM_Buffer[AUDIO_CHANNELS*PCM_AUDIO_IN_SAMPLES*128/8];//64
#endif /* USE_STM32F4XX_NUCLEO */

/* Local defines -------------------------------------------------------------*/

/* Local function prototypes --------------------------------------------------*/
static void Init_MEM1_Sensors(void);
//static void Init_MEMS_Mics(uint32_t AudioFreq, uint32_t AudioVolume);
extern void Init_MEMS_Mics(uint32_t AudioFreq, uint32_t AudioVolume);

#ifdef USE_STM32L4XX_NUCLEO
static uint32_t GetPage(uint32_t Address);
static uint32_t GetBank(uint32_t Address);
#endif /* USE_STM32L4XX_NUCLEO */

extern tBleStatus Term_Update(uint8_t *data,uint8_t length);

void
Error_Handler()
{
    for(;;);
}
/**
  * @brief  Initialize all the Target platform's Features
  * @param  TargetType_t BoardType Nucleo/BlueCoin/SensorTile
  * @retval None
  */
void InitTargetPlatform(TargetType_t BoardType)
{
  TargetBoardFeatures.BoardType = BoardType;
#ifdef STM32_NUCLEO
  #ifdef ALLMEMS1_ENABLE_PRINTF
  /* UART Initialization */
  if(UART_Global_Init()!=HAL_OK) {
    Error_Handler();
  } else {
    ALLMEMS1_PRINTF("UART Initialized\r\n");
  }
  #endif /* ALLMEMS1_ENABLE_PRINTF */

  /* I2C Initialization */
  if(I2C_Global_Init()!=COMPONENT_OK) {
    Error_Handler();
  } else {
    ALLMEMS1_PRINTF("I2C  Initialized\r\n");
  }

  /* Initialize the BlueNRG SPI driver */
  if(SPI_Global_Init()!=HAL_OK) {
    Error_Handler();
  } else {
    ALLMEMS1_PRINTF("SPI  Initialized\r\n");
  }

  /* Initialize button */
  BSP_PB_Init(BUTTON_KEY, BUTTON_MODE_EXTI);
#elif STM32_BLUECOIN
  /* Configure Shutdown button */
  BSP_ShutDown_Init();

  /* if Watchdog_Refresh() is not called each 1,2s the BC will reset */
  BSP_Watchdog_Init(300);

  /* Configure the User Button in EXTI Mode */
  BSP_PB_Init(BUTTON_1, BUTTON_MODE_EXTI);
  BSP_PB_Init(BUTTON_2, BUTTON_MODE_EXTI);

  /* Initialize Battery Measurement*/
  BSP_BatMS_Init();

  /* Initialize Charger Pin*/
  BSP_ChrgPin_Init();

  /* Enable Battery Measurement*/
  BSP_BatMS_Enable();

  /* Configure Power Voltage Detector(PVD) to detect if battery voltage is low */
  PVD_Config();


#elif STM32_SENSORTILE

#ifdef ALLMEMS1_ENABLE_SD_CARD_LOGGING
  /* Configure the SDCard */
//  DATALOG_SD_Init();
  HAL_Delay(200);
#endif /* ALLMEMS1_ENABLE_SD_CARD_LOGGING */

  /* Configure and disable all the Chip Select pins */
  Sensor_IO_SPI_CS_Init_All();

  #ifdef ALLMEMS1_ENABLE_PRINTF
  /* enable USB power on Pwrctrl CR2 register */
  HAL_PWREx_EnableVddUSB();

  /* Configure the CDC */
  /* Init Device Library */
  USBD_Init(&USBD_Device, &VCP_Desc, 0);
  /* Add Supported Class */
  USBD_RegisterClass(&USBD_Device, USBD_CDC_CLASS);
  /* Add Interface callbacks for AUDIO and CDC Class */
  USBD_CDC_RegisterInterface(&USBD_Device, &USBD_CDC_fops);
  /* Start Device Process */
  USBD_Start(&USBD_Device);
  /* 10 seconds ... for having time to open the Terminal
   * for looking the ALLMEMS1 Initialization phase */
  HAL_Delay(10000);
  #endif /* ALLMEMS1_ENABLE_PRINTF */
#endif /* STM32_NUCLEO */

  /* Initialize LED */
#ifdef STM32_NUCLEO
  BSP_LED_Init(LED2);
#elif STM32_SENSORTILE
  BSP_LED_Init( LED1 );
#elif STM32_BLUECOIN
  BSP_LED_Init(LED1);
  BSP_LED_Init(LED2);
  BSP_LED_Init(LED3);
  BSP_LED_Init(LED4);
  BSP_LED_Init(LED5);
  BSP_LED_Init(LED6);
  BSP_LED_Init(LED7);
  BSP_LED_Init(LED8);
#endif /* STM32_NUCLEO */

  ALLMEMS1_PRINTF("\r\nSTMicroelectronics %s:\r\n"
         "\tVersion %c.%c.%c\r\n"
#ifdef USE_STM32F4XX_NUCLEO
  #ifdef STM32_BLUECOIN
        "\tSTM32F446RE-BlueCoin board"
  #elif STM32_NUCLEO
    #ifdef STM32F401xE
        "\tSTM32F401RE-Nucleo board"
    #elif STM32F446xx
          "\tSTM32F446xx-Nucleo board"
    #endif /* STM32F401xE */
  #endif /* STM32_BLUECOIN */
#elif USE_STM32L4XX_NUCLEO
  #ifdef STM32_SENSORTILE
        "\tSTM32476RG-SensorTile board"
  #elif STM32_NUCLEO
        "\tSTM32L476RG-Nucleo board"
  #endif /* STM32_SENSORTILE */
#endif /* USE_STM32L4XX_NUCLEO */
          "\r\n\n",
          ALLMEMS1_PACKAGENAME,
          ALLMEMS1_VERSION_MAJOR,ALLMEMS1_VERSION_MINOR,ALLMEMS1_VERSION_PATCH);

  /* Reset all the Target's Features */
  memset(&TargetBoardFeatures, 0, sizeof(TargetFeatures_t));
  /* Discovery and Intialize all the MEMS Target's Features */
//  Init_MEM1_Sensors();

#ifdef STM32_SENSORTILE
#if 0
  /* Inialize the Gas Gouge if the battery is present */
  if(BSP_GG_Init(&TargetBoardFeatures.HandleGGComponent) == COMPONENT_OK){
    ALLMEMS1_PRINTF("OK Gas Gouge Component\n\r");
  } else {
    ALLMEMS1_PRINTF("Battery not present\n\r");
  }
#endif
#endif /* STM32_SENSORTILE */

#ifdef USE_STM32F4XX_NUCLEO
  /* Initialize Mic */
  Init_MEMS_Mics(AUDIO_SAMPLING_FREQUENCY, AUDIO_VOLUME_VALUE);
#endif /* USE_STM32F4XX_NUCLEO */

  ALLMEMS1_PRINTF("\n\r");

#ifdef USE_STM32F4XX_NUCLEO
      //BSP_AUDIO_IN_Record(PDM_Buffer, 0);
#endif /* USE_STM32F4XX_NUCLEO */

  TargetBoardFeatures.bnrg_expansion_board = IDB04A1; /* IDB04A1 by default */
}

/** @brief Initialize all the MEMS1 sensors
 * @param None
 * @retval None
 */
static void Init_MEM1_Sensors(void)
{
#ifdef IKS01A1
  ALLMEMS1_PRINTF("Code compiled for X-NUCLEO-IKS01A1\r\n");
  TargetBoardFeatures.mems_expansion_board= _IKS01A1;
#elif IKS01A2
  ALLMEMS1_PRINTF("Code compiled for X-NUCLEO-IKS01A2\r\n");
  TargetBoardFeatures.mems_expansion_board= _IKS01A2;
#endif /* IKS01A1 */

  /* Accelero */
#ifdef STM32_BLUECOIN
  HAL_Delay(200); // THIS MUST BE CHECKED!!
#endif /* STM32_BLUECOIN */

#if 0
  if (BSP_ACCELERO_Init( ACCELERO_SENSORS_AUTO, &TargetBoardFeatures.HandleAccSensor ) == COMPONENT_OK){
    ALLMEMS1_PRINTF("OK Accelero Sensor\n\r");
  } else {
    ALLMEMS1_PRINTF("Error Accelero Sensor\n\r");
    while(1);
  }
#endif

  /* DS3/DSM or DS0 */
#ifdef STM32_NUCLEO
  #ifdef IKS01A1
  {
    uint8_t WhoAmI;
    BSP_ACCELERO_Get_WhoAmI(TargetBoardFeatures.HandleAccSensor,&WhoAmI);
    if(LSM6DS3_ACC_GYRO_WHO_AM_I==WhoAmI) {
      ALLMEMS1_PRINTF("\tDS3 DIL24 Present\n\r");
      TargetBoardFeatures.HWAdvanceFeatures = 1;
    } else {
      TargetBoardFeatures.HWAdvanceFeatures = 0;
    }
  }
  #elif IKS01A2
    #ifndef DISABLE_LSM6DSL_IT
    TargetBoardFeatures.HWAdvanceFeatures = 1;
    #else
    TargetBoardFeatures.HWAdvanceFeatures = 0;
    #endif
  #endif /* IKS01A1 */

#else /* STM32_NUCLEO */
  TargetBoardFeatures.HWAdvanceFeatures = 1;
#endif /* STM32_NUCLEO */

#if 0
  /* Gyro */
  if(BSP_GYRO_Init( GYRO_SENSORS_AUTO, &TargetBoardFeatures.HandleGyroSensor )==COMPONENT_OK){
    ALLMEMS1_PRINTF("OK Gyroscope Sensor\n\r");
  } else {
    ALLMEMS1_PRINTF("Error Gyroscope Sensor\n\r");
    while(1);
  }

  if(BSP_MAGNETO_Init( MAGNETO_SENSORS_AUTO, &TargetBoardFeatures.HandleMagSensor )==COMPONENT_OK){
    ALLMEMS1_PRINTF("OK Magneto Sensor\n\r");
  } else {
    ALLMEMS1_PRINTF("Error Magneto Sensor\n\r");
    while(1);
  }
#endif

#ifndef STM32_BLUECOIN
#if 0
  /* Humidity */
  if(BSP_HUMIDITY_Init( HUMIDITY_SENSORS_AUTO, &TargetBoardFeatures.HandleHumSensor )==COMPONENT_OK){
    ALLMEMS1_PRINTF("OK Humidity Sensor\n\r");
  } else {
    ALLMEMS1_PRINTF("Error Humidity Sensor\n\r");
  }
#endif
#endif /* STM32_BLUECOIN */

#if 0
  /* Temperature1 */
  if(BSP_TEMPERATURE_Init( TEMPERATURE_SENSORS_AUTO, &TargetBoardFeatures.HandleTempSensors[TargetBoardFeatures.NumTempSensors] )==COMPONENT_OK){
     ALLMEMS1_PRINTF("OK Temperature Sensor1\n\r");
     TargetBoardFeatures.NumTempSensors++;
  } else {
    ALLMEMS1_PRINTF("Error Temperature Sensor1\n\r");
  }
#endif

  /* Temperature2 */
#ifdef STM32_NUCLEO
  #ifdef IKS01A1
  if(BSP_TEMPERATURE_Init( LPS25HB_T_0, &TargetBoardFeatures.HandleTempSensors[TargetBoardFeatures.NumTempSensors] )==COMPONENT_OK){
  #elif IKS01A2
  if(BSP_TEMPERATURE_Init( LPS22HB_T_0, &TargetBoardFeatures.HandleTempSensors[TargetBoardFeatures.NumTempSensors] )==COMPONENT_OK){
  #endif /* IKS01A1 */
     ALLMEMS1_PRINTF("OK Temperature Sensor2\n\r");
     TargetBoardFeatures.NumTempSensors++;
  } else {
    ALLMEMS1_PRINTF("Error Temperature Sensor2\n\r");
  }
#elif STM32_SENSORTILE
#if 0
  if(BSP_TEMPERATURE_Init( LPS22HB_T_0, &TargetBoardFeatures.HandleTempSensors[TargetBoardFeatures.NumTempSensors] )==COMPONENT_OK){
     ALLMEMS1_PRINTF("OK Temperature Sensor2\n\r");
     TargetBoardFeatures.NumTempSensors++;
  } else {
    ALLMEMS1_PRINTF("Error Temperature Sensor2\n\r");
  }
#endif
#endif /* STM32_NUCLEO */

#if 0
  /* Pressure */
  if(BSP_PRESSURE_Init( PRESSURE_SENSORS_AUTO, &TargetBoardFeatures.HandlePressSensor )==COMPONENT_OK){
    ALLMEMS1_PRINTF("OK Pressure Sensor\n\r");
  } else {
    ALLMEMS1_PRINTF("Error Pressure Sensor\n\r");
  }
#endif

#if 0
  /*  Enable all the sensors */
  if(TargetBoardFeatures.HandleAccSensor) {
    if(BSP_ACCELERO_Sensor_Enable( TargetBoardFeatures.HandleAccSensor )==COMPONENT_OK) {
      ALLMEMS1_PRINTF("Enabled Accelero Sensor\n\r");
    }
  }

  if(TargetBoardFeatures.HandleGyroSensor) {
    if(BSP_GYRO_Sensor_Enable( TargetBoardFeatures.HandleGyroSensor )==COMPONENT_OK) {
      ALLMEMS1_PRINTF("Enabled Gyroscope Sensor\n\r");
    }
  }

  if(TargetBoardFeatures.HandleMagSensor) {
    if(BSP_MAGNETO_Sensor_Enable( TargetBoardFeatures.HandleMagSensor )==COMPONENT_OK) {
      ALLMEMS1_PRINTF("Enabled Magneto Sensor\n\r");
    }
  }
#endif

#ifndef STM32_BLUECOIN
#if 0
  if(TargetBoardFeatures.HandleHumSensor) {
    if(BSP_HUMIDITY_Sensor_Enable( TargetBoardFeatures.HandleHumSensor)==COMPONENT_OK) {
      ALLMEMS1_PRINTF("Enabled Humidity Sensor\n\r");
    }
  }
#endif
#endif /* STM32_BLUECOIN */

#if 0
  if(TargetBoardFeatures.HandleTempSensors[0]){
    if(BSP_TEMPERATURE_Sensor_Enable( TargetBoardFeatures.HandleTempSensors[0])==COMPONENT_OK) {
      ALLMEMS1_PRINTF("Enabled Temperature Sensor1\n\r");
    }
  }

  if(TargetBoardFeatures.HandleTempSensors[1]){
    if(BSP_TEMPERATURE_Sensor_Enable( TargetBoardFeatures.HandleTempSensors[1])==COMPONENT_OK) {
      ALLMEMS1_PRINTF("Enabled Temperature Sensor2\n\r");
    }
  }

  if(TargetBoardFeatures.HandlePressSensor) {
    if(BSP_PRESSURE_Sensor_Enable( TargetBoardFeatures.HandlePressSensor)==COMPONENT_OK) {
      ALLMEMS1_PRINTF("Enabled Pressure Sensor\n\r");
    }
  }
#endif

}

/** @brief Initialize all the MEMS's Microphones
 * @param None
 * @retval None
 */
void Init_MEMS_Mics(uint32_t AudioFreq, uint32_t AudioVolume)
{
  uint8_t ret;

  ret= BSP_AUDIO_IN_Init(AudioFreq, 16, AUDIO_CHANNELS);

  if(ret != AUDIO_OK)
  {
    ALLMEMS1_PRINTF("\nError Audio Init\r\n");

    while(1) {
      ;
    }
  }
  else
  {
    ALLMEMS1_PRINTF("\nOK Audio Init\t(Audio Freq.= %ld)\r\n", AudioFreq);
  }

  /* Set the volume level */
  ret= BSP_AUDIO_IN_SetVolume(AudioVolume);

  if(ret != AUDIO_OK)
  {
    ALLMEMS1_PRINTF("Error Audio Volume\r\n\n");

    while(1) {
      ;
    }
  }
  else
  {
    ALLMEMS1_PRINTF("OK Audio Volume\t(Volume= %ld)\r\n", AudioVolume);
  }

  /* Number of Microphones */
  TargetBoardFeatures.NumMicSensors=AUDIO_CHANNELS;
}

/** @brief Initialize all the MEMS's Microphones
 * @param None
 * @retval None
 */
void InitMics(uint32_t AudioFreq, uint32_t AudioVolume)
{
  Init_MEMS_Mics(AudioFreq, AudioVolume);

#if defined(USE_STM32F4XX_NUCLEO) || defined(STM32_BLUECOIN)
  BSP_AUDIO_IN_Record(PDM_Buffer, 0);
#endif /* USE_STM32F4XX_NUCLEO || STM32_BLUECOIN */

#if defined(STM32_SENSORTILE) || defined(USE_STM32L4XX_NUCLEO)
  BSP_AUDIO_IN_Record(PCM_Buffer,0);
#endif /* STM32_SENSORTILE || USE_STM32L4XX_NUCLEO*/
}

/** @brief DeInitialize all the MEMS's Microphones
 * @param None
 * @retval None
 */
void DeInitMics(void)
{
  uint8_t ret= AUDIO_OK;

  BSP_AUDIO_IN_Stop();

#if defined(STM32_SENSORTILE) || defined(USE_STM32L4XX_NUCLEO)
  ret= BSP_AUDIO_IN_DeInit();
#else /* STM32_SENSORTILE || USE_STM32L4XX_NUCLEO*/
  __HAL_RCC_SPI3_FORCE_RESET();
  __HAL_RCC_SPI3_RELEASE_RESET();
#endif /* STM32_SENSORTILE || USE_STM32L4XX_NUCLEO*/

  if(ret != AUDIO_OK)
  {
    ALLMEMS1_PRINTF("Error Audio DeInit\r\n");

    while(1) {
      ;
    }
  }
  else
  {
    ALLMEMS1_PRINTF("OK Audio DeInit\r\n");
  }
}


/**
  * @brief  This function switches on the LED
  * @param  None
  * @retval None
  */
void LedOnTargetPlatform(void)
{
#ifdef STM32_NUCLEO
  BSP_LED_On(LED2);
#elif STM32_SENSORTILE
  BSP_LED_On( LED1 );
#elif STM32_BLUECOIN
  BSP_LED_On(LED1);
  BSP_LED_On(LED3);
  BSP_LED_On(LED5);
  BSP_LED_On(LED7);
#endif /* STM32_NUCLEO */

  TargetBoardFeatures.LedStatus=1;
}

/**
  * @brief  This function switches off the LED
  * @param  None
  * @retval None
  */
void LedOffTargetPlatform(void)
{
#ifdef STM32_NUCLEO
  BSP_LED_Off(LED2);
#elif STM32_SENSORTILE
  BSP_LED_Off( LED1 );
#elif STM32_BLUECOIN
  BSP_LED_Off(LED1);
  BSP_LED_Off(LED3);
  BSP_LED_Off(LED5);
  BSP_LED_Off(LED7);
#endif /* STM32_NUCLEO */

  TargetBoardFeatures.LedStatus=0;
}

/** @brief  This function toggles the LED
  * @param  None
  * @retval None
  */
void LedToggleTargetPlatform(void)
{
#ifdef STM32_NUCLEO
  BSP_LED_Toggle(LED2);
#elif STM32_SENSORTILE
  BSP_LED_Toggle( LED1 );
#elif STM32_BLUECOIN
  BSP_LED_Toggle(LED1);
  BSP_LED_Toggle(LED3);
  BSP_LED_Toggle(LED5);
  BSP_LED_Toggle(LED7);
#endif /* STM32_NUCLEO */
}

#ifdef USE_STM32L4XX_NUCLEO
/**
  * @brief  Gets the page of a given address
  * @param  Addr: Address of the FLASH Memory
  * @retval The page of a given address
  */
static uint32_t GetPage(uint32_t Addr)
{
  uint32_t page = 0;

  if (Addr < (FLASH_BASE + FLASH_BANK_SIZE))
  {
    /* Bank 1 */
    page = (Addr - FLASH_BASE) / FLASH_PAGE_SIZE;
  }
  else
  {
    /* Bank 2 */
    page = (Addr - (FLASH_BASE + FLASH_BANK_SIZE)) / FLASH_PAGE_SIZE;
  }

  return page;
}

/**
  * @brief  Gets the bank of a given address
  * @param  Addr: Address of the FLASH Memory
  * @retval The bank of a given address
  */
static uint32_t GetBank(uint32_t Addr)
{
  uint32_t bank = 0;

  if (READ_BIT(SYSCFG->MEMRMP, SYSCFG_MEMRMP_FB_MODE) == 0)
  {
  	/* No Bank swap */
    if (Addr < (FLASH_BASE + FLASH_BANK_SIZE))
    {
      bank = FLASH_BANK_1;
    }
    else
    {
      bank = FLASH_BANK_2;
    }
  }
  else
  {
  	/* Bank swap */
    if (Addr < (FLASH_BASE + FLASH_BANK_SIZE))
    {
      bank = FLASH_BANK_2;
    }
    else
    {
      bank = FLASH_BANK_1;
    }
  }

  return bank;
}

/**
 * @brief User function for Erasing the MDM on Flash
 * @param None
 * @retval uint32_t Success/NotSuccess [1/0]
 */
uint32_t UserFunctionForErasingFlash(void) {
  FLASH_EraseInitTypeDef EraseInitStruct;
  uint32_t SectorError = 0;
  uint32_t Success=1;

  EraseInitStruct.TypeErase   = FLASH_TYPEERASE_PAGES;
  EraseInitStruct.Banks       = GetBank(MDM_FLASH_ADD);
  EraseInitStruct.Page        = GetPage(MDM_FLASH_ADD);
  EraseInitStruct.NbPages     = 2;

  /* Unlock the Flash to enable the flash control register access *************/
  HAL_FLASH_Unlock();

  if(HAL_FLASHEx_Erase(&EraseInitStruct, &SectorError) != HAL_OK){
    /* Error occurred while sector erase.
      User can add here some code to deal with this error.
      SectorError will contain the faulty sector and then to know the code error on this sector,
      user can call function 'HAL_FLASH_GetError()'
      FLASH_ErrorTypeDef errorcode = HAL_FLASH_GetError(); */
    Success=0;
    Error_Handler();
  }

  /* Lock the Flash to disable the flash control register access (recommended
  to protect the FLASH memory against possible unwanted operation) *********/
  HAL_FLASH_Lock();

  return Success;
}

/**
 * @brief User function for Saving the MDM  on the Flash
 * @param void *InitMetaDataVector Pointer to the MDM beginning
 * @param void *EndMetaDataVector Pointer to the MDM end
 * @retval uint32_t Success/NotSuccess [1/0]
 */
uint32_t UserFunctionForSavingFlash(void *InitMetaDataVector,void *EndMetaDataVector)
{
  uint32_t Success=1;

  /* Store in Flash Memory */
  uint32_t Address = MDM_FLASH_ADD;
  uint64_t *WriteIndex;

  /* Unlock the Flash to enable the flash control register access *************/
  HAL_FLASH_Unlock();
  for(WriteIndex =((uint64_t *) InitMetaDataVector); WriteIndex<((uint64_t *) EndMetaDataVector); WriteIndex++) {
    if (HAL_FLASH_Program(FLASH_TYPEPROGRAM_DOUBLEWORD, Address,*WriteIndex) == HAL_OK){
      Address = Address + 8;
    } else {
      /* Error occurred while writing data in Flash memory.
         User can add here some code to deal with this error
         FLASH_ErrorTypeDef errorcode = HAL_FLASH_GetError(); */
      Error_Handler();
      Success =0;
    }
  }

  /* Lock the Flash to disable the flash control register access (recommended
   to protect the FLASH memory against possible unwanted operation) *********/
  HAL_FLASH_Lock();

  return Success;
}
#endif /* USE_STM32L4XX_NUCLEO */

#ifdef USE_STM32F4XX_NUCLEO
/**
 * @brief User function for Erasing the Flash data for MDM
 * @param None
 * @retval uint32_t Success/NotSuccess [1/0]
 */
uint32_t UserFunctionForErasingFlash(void) {
  FLASH_EraseInitTypeDef EraseInitStruct;
  uint32_t SectorError = 0;
  uint32_t Success=1;

  EraseInitStruct.TypeErase = TYPEERASE_SECTORS;
  EraseInitStruct.VoltageRange = VOLTAGE_RANGE_3;
  EraseInitStruct.Sector = FLASH_SECTOR_7;
  EraseInitStruct.NbSectors = 1;

  /* Unlock the Flash to enable the flash control register access *************/
  HAL_FLASH_Unlock();

  if(HAL_FLASHEx_Erase(&EraseInitStruct, &SectorError) != HAL_OK){
    /* Error occurred while sector erase.
      User can add here some code to deal with this error.
      SectorError will contain the faulty sector and then to know the code error on this sector,
      user can call function 'HAL_FLASH_GetError()'
      FLASH_ErrorTypeDef errorcode = HAL_FLASH_GetError(); */
    Success=0;
    Error_Handler();
  }

  /* Lock the Flash to disable the flash control register access (recommended
  to protect the FLASH memory against possible unwanted operation) *********/
  HAL_FLASH_Lock();

  return Success;
}

/**
 * @brief User function for Saving the MDM  on the Flash
 * @param void *InitMetaDataVector Pointer to the MDM beginning
 * @param void *EndMetaDataVector Pointer to the MDM end
 * @retval uint32_t Success/NotSuccess [1/0]
 */
uint32_t UserFunctionForSavingFlash(void *InitMetaDataVector,void *EndMetaDataVector)
{
  uint32_t Success=1;

  /* Store in Flash Memory */
  uint32_t Address = MDM_FLASH_ADD;
  uint32_t *WriteIndex;

  /* Unlock the Flash to enable the flash control register access *************/
  HAL_FLASH_Unlock();

  for(WriteIndex =((uint32_t *) InitMetaDataVector); WriteIndex<((uint32_t *) EndMetaDataVector); WriteIndex++) {
    if (HAL_FLASH_Program(TYPEPROGRAM_WORD, Address,*WriteIndex) == HAL_OK){
      Address = Address + 4;
    } else {
      /* Error occurred while writing data in Flash memory.
         User can add here some code to deal with this error
         FLASH_ErrorTypeDef errorcode = HAL_FLASH_GetError(); */
      Error_Handler();
      Success=0;
    }
  }

  /* Lock the Flash to disable the flash control register access (recommended
   to protect the FLASH memory against possible unwanted operation) *********/
  HAL_FLASH_Lock();

  return Success;
}
#endif /* USE_STM32F4XX_NUCLEO */

/******************* (C) COPYRIGHT 2018 STMicroelectronics *****END OF FILE****/

/**
  ******************************************************************************
  * @file    system_stm32l4xx.c
  * @author  MCD Application Team
  * @brief   CMSIS Cortex-M4 Device Peripheral Access Layer System Source File
  *
  *   This file provides two functions and one global variable to be called from
  *   user application:
  *      - SystemInit(): This function is called at startup just after reset and
  *                      before branch to main program. This call is made inside
  *                      the "startup_stm32l4xx.s" file.
  *
  *      - SystemCoreClock variable: Contains the core clock (HCLK), it can be used
  *                                  by the user application to setup the SysTick
  *                                  timer or configure other parameters.
  *
  *      - SystemCoreClockUpdate(): Updates the variable SystemCoreClock and must
  *                                 be called whenever the core clock is changed
  *                                 during program execution.
  *
  *   After each device reset the MSI (4 MHz) is used as system clock source.
  *   Then SystemInit() function is called, in "startup_stm32l4xx.s" file, to
  *   configure the system clock before to branch to main program.
  *
  *   This file configures the system clock as follows:
  *=============================================================================
  *-----------------------------------------------------------------------------
  *        System Clock source                    | MSI
  *-----------------------------------------------------------------------------
  *        SYSCLK(Hz)                             | 4000000
  *-----------------------------------------------------------------------------
  *        HCLK(Hz)                               | 4000000
  *-----------------------------------------------------------------------------
  *        AHB Prescaler                          | 1
  *-----------------------------------------------------------------------------
  *        APB1 Prescaler                         | 1
  *-----------------------------------------------------------------------------
  *        APB2 Prescaler                         | 1
  *-----------------------------------------------------------------------------
  *        PLL_M                                  | 1
  *-----------------------------------------------------------------------------
  *        PLL_N                                  | 8
  *-----------------------------------------------------------------------------
  *        PLL_P                                  | 7
  *-----------------------------------------------------------------------------
  *        PLL_Q                                  | 2
  *-----------------------------------------------------------------------------
  *        PLL_R                                  | 2
  *-----------------------------------------------------------------------------
  *        PLLSAI1_P                              | NA
  *-----------------------------------------------------------------------------
  *        PLLSAI1_Q                              | NA
  *-----------------------------------------------------------------------------
  *        PLLSAI1_R                              | NA
  *-----------------------------------------------------------------------------
  *        PLLSAI2_P                              | NA
  *-----------------------------------------------------------------------------
  *        PLLSAI2_Q                              | NA
  *-----------------------------------------------------------------------------
  *        PLLSAI2_R                              | NA
  *-----------------------------------------------------------------------------
  *        Require 48MHz for USB OTG FS,          | Disabled
  *        SDIO and RNG clock                     |
  *-----------------------------------------------------------------------------
  *=============================================================================
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT(c) 2018 STMicroelectronics</center></h2>
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

/** @addtogroup CMSIS
  * @{
  */

/** @addtogroup stm32l4xx_system
  * @{
  */

/** @addtogroup STM32L4xx_System_Private_Includes
  * @{
  */

#include "stm32l4xx.h"

#if !defined  (HSE_VALUE)
  #define HSE_VALUE    8000000U  /*!< Value of the External oscillator in Hz */
#endif /* HSE_VALUE */

#if !defined  (MSI_VALUE)
  #define MSI_VALUE    4000000U  /*!< Value of the Internal oscillator in Hz*/
#endif /* MSI_VALUE */

#if !defined  (HSI_VALUE)
  #define HSI_VALUE    16000000U /*!< Value of the Internal oscillator in Hz*/
#endif /* HSI_VALUE */

/**
  * @}
  */

/** @addtogroup STM32L4xx_System_Private_TypesDefinitions
  * @{
  */

/**
  * @}
  */

/** @addtogroup STM32L4xx_System_Private_Defines
  * @{
  */

/************************* Miscellaneous Configuration ************************/
/*!< Uncomment the following line if you need to relocate your vector Table in
     Internal SRAM. */
/* #define VECT_TAB_SRAM */
#if 0
#define VECT_TAB_OFFSET  0x00 /*!< Vector Table base offset field.
                                   This value must be a multiple of 0x200. */
#else
#define VECT_TAB_OFFSET  0x4000 /*!< Vector Table base offset field.
                                   This value must be a multiple of 0x200. */
#endif
/******************************************************************************/
/**
  * @}
  */

/** @addtogroup STM32L4xx_System_Private_Macros
  * @{
  */

/**
  * @}
  */

/** @addtogroup STM32L4xx_System_Private_Variables
  * @{
  */
  /* The SystemCoreClock variable is updated in three ways:
      1) by calling CMSIS function SystemCoreClockUpdate()
      2) by calling HAL API function HAL_RCC_GetHCLKFreq()
      3) each time HAL_RCC_ClockConfig() is called to configure the system clock frequency
         Note: If you use this function to configure the system clock; then there
               is no need to call the 2 first functions listed above, since SystemCoreClock
               variable is updated automatically.
  */
  uint32_t SystemCoreClock = 4000000U;

  const uint8_t  AHBPrescTable[16] = {0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 1U, 2U, 3U, 4U, 6U, 7U, 8U, 9U};
  const uint8_t  APBPrescTable[8] =  {0U, 0U, 0U, 0U, 1U, 2U, 3U, 4U};
  const uint32_t MSIRangeTable[12] = {100000U,   200000U,   400000U,   800000U,  1000000U,  2000000U, \
                                      4000000U, 8000000U, 16000000U, 24000000U, 32000000U, 48000000U};
/**
  * @}
  */

/** @addtogroup STM32L4xx_System_Private_FunctionPrototypes
  * @{
  */

/**
  * @}
  */

/** @addtogroup STM32L4xx_System_Private_Functions
  * @{
  */

/**
  * @brief  Setup the microcontroller system.
  * @param  None
  * @retval None
  */

#if 0 // Ada picks this up
void SystemInit(void)
{
  /* FPU settings ------------------------------------------------------------*/
  #if (__FPU_PRESENT == 1) && (__FPU_USED == 1)
    SCB->CPACR |= ((3UL << 10*2)|(3UL << 11*2));  /* set CP10 and CP11 Full Access */
  #endif

  /* Reset the RCC clock configuration to the default reset state ------------*/
  /* Set MSION bit */
  RCC->CR |= RCC_CR_MSION;

  /* Reset CFGR register */
  RCC->CFGR = 0x00000000U;

  /* Reset HSEON, CSSON , HSION, and PLLON bits */
  RCC->CR &= 0xEAF6FFFFU;

  /* Reset PLLCFGR register */
  RCC->PLLCFGR = 0x00001000U;

  /* Reset HSEBYP bit */
  RCC->CR &= 0xFFFBFFFFU;

  /* Disable all interrupts */
  RCC->CIER = 0x00000000U;

  /* Configure the Vector Table location add offset address ------------------*/
#ifdef VECT_TAB_SRAM
  SCB->VTOR = SRAM_BASE | VECT_TAB_OFFSET; /* Vector Table Relocation in Internal SRAM */
#else
  SCB->VTOR = FLASH_BASE | VECT_TAB_OFFSET; /* Vector Table Relocation in Internal FLASH */
#endif
}
#endif
/**
  * @brief  Update SystemCoreClock variable according to Clock Register Values.
  *         The SystemCoreClock variable contains the core clock (HCLK), it can
  *         be used by the user application to setup the SysTick timer or configure
  *         other parameters.
  *
  * @note   Each time the core clock (HCLK) changes, this function must be called
  *         to update SystemCoreClock variable value. Otherwise, any configuration
  *         based on this variable will be incorrect.
  *
  * @note   - The system frequency computed by this function is not the real
  *           frequency in the chip. It is calculated based on the predefined
  *           constant and the selected clock source:
  *
  *           - If SYSCLK source is MSI, SystemCoreClock will contain the MSI_VALUE(*)
  *
  *           - If SYSCLK source is HSI, SystemCoreClock will contain the HSI_VALUE(**)
  *
  *           - If SYSCLK source is HSE, SystemCoreClock will contain the HSE_VALUE(***)
  *
  *           - If SYSCLK source is PLL, SystemCoreClock will contain the HSE_VALUE(***)
  *             or HSI_VALUE(*) or MSI_VALUE(*) multiplied/divided by the PLL factors.
  *
  *         (*) MSI_VALUE is a constant defined in stm32l4xx_hal.h file (default value
  *             4 MHz) but the real value may vary depending on the variations
  *             in voltage and temperature.
  *
  *         (**) HSI_VALUE is a constant defined in stm32l4xx_hal.h file (default value
  *              16 MHz) but the real value may vary depending on the variations
  *              in voltage and temperature.
  *
  *         (***) HSE_VALUE is a constant defined in stm32l4xx_hal.h file (default value
  *              8 MHz), user has to ensure that HSE_VALUE is same as the real
  *              frequency of the crystal used. Otherwise, this function may
  *              have wrong result.
  *
  *         - The result of this function could be not correct when using fractional
  *           value for HSE crystal.
  *
  * @param  None
  * @retval None
  */
void SystemCoreClockUpdate(void)
{
  uint32_t tmp = 0U, msirange = 0U, pllvco = 0U, pllr = 2U, pllsource = 0U, pllm = 2U;

  /* Get MSI Range frequency--------------------------------------------------*/
  if((RCC->CR & RCC_CR_MSIRGSEL) == RESET)
  { /* MSISRANGE from RCC_CSR applies */
    msirange = (RCC->CSR & RCC_CSR_MSISRANGE) >> 8U;
  }
  else
  { /* MSIRANGE from RCC_CR applies */
    msirange = (RCC->CR & RCC_CR_MSIRANGE) >> 4U;
  }
  /*MSI frequency range in HZ*/
  msirange = MSIRangeTable[msirange];

  /* Get SYSCLK source -------------------------------------------------------*/
  switch (RCC->CFGR & RCC_CFGR_SWS)
  {
    case 0x00:  /* MSI used as system clock source */
      SystemCoreClock = msirange;
      break;

    case 0x04:  /* HSI used as system clock source */
      SystemCoreClock = HSI_VALUE;
      break;

    case 0x08:  /* HSE used as system clock source */
      SystemCoreClock = HSE_VALUE;
      break;

    case 0x0C:  /* PLL used as system clock  source */
      /* PLL_VCO = (HSE_VALUE or HSI_VALUE or MSI_VALUE/ PLLM) * PLLN
         SYSCLK = PLL_VCO / PLLR
         */
      pllsource = (RCC->PLLCFGR & RCC_PLLCFGR_PLLSRC);
      pllm = ((RCC->PLLCFGR & RCC_PLLCFGR_PLLM) >> 4U) + 1U ;

      switch (pllsource)
      {
        case 0x02:  /* HSI used as PLL clock source */
          pllvco = (HSI_VALUE / pllm);
          break;

        case 0x03:  /* HSE used as PLL clock source */
          pllvco = (HSE_VALUE / pllm);
          break;

        default:    /* MSI used as PLL clock source */
          pllvco = (msirange / pllm);
          break;
      }
      pllvco = pllvco * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 8U);
      pllr = (((RCC->PLLCFGR & RCC_PLLCFGR_PLLR) >> 25U) + 1U) * 2U;
      SystemCoreClock = pllvco/pllr;
      break;

    default:
      SystemCoreClock = msirange;
      break;
  }
  /* Compute HCLK clock frequency --------------------------------------------*/
  /* Get HCLK prescaler */
  tmp = AHBPrescTable[((RCC->CFGR & RCC_CFGR_HPRE) >> 4U)];
  /* HCLK clock frequency */
  SystemCoreClock >>= tmp;
}


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/

int hci_le_read_local_version(uint8_t *hci_version, uint16_t *hci_revision, uint8_t *lmp_pal_version,
                              uint16_t *manufacturer_name, uint16_t *lmp_pal_subversion);

void
glue()
{
    uint8_t hci_version;
    uint16_t hci_revision;
    uint8_t lmp_pal_version;
    uint16_t manufacturer_name;
    uint16_t lmp_pal_subversion;

//  HAL_Init(); Ada does this...?

    //   BLE.HCI_Init;
    HCI_Init();

   InitTargetPlatform(TARGET_SENSORTILE);

    hci_le_read_local_version(&hci_version, &hci_revision, &lmp_pal_version,
                              &manufacturer_name, &lmp_pal_subversion);
}
