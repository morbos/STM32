   --  The UUID
   AccGyroMag_UUid : constant UUidT :=
     (16#00#, 16#E0#, 16#00#, 16#00#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   --  State for the characteristic
   AccGyroMagCharHandle      : UInt16;
   AccGyroMagCharSize        : UInt8 := 2 + 3 * 3 * 2;


      --  Acc+Gyro+Mag declare to stack
      UUid_Copy (UUid, AccGyroMag_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => AccGyroMagCharSize,
         CharProperties => CHAR_PROP_NOTIFY,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => False,
         CharHandle     => AccGyroMagCharHandle);


      --  sending of the sensor data
      Status := Aci_Gatt_Update_Char_Value
        (ServHandle    => HWServW2STHandle,
         CharHandle    => AccGyroMagCharHandle,
         CharValOffset => 0,
         CharValueLen  => AccGyroMagCharSize,
         CharValue     => Buff);
