package Sensor_Types
is
   type Sensor_Status is (COMPONENT_OK,
                          COMPONENT_ERROR,
                          COMPONENT_TIMEOUT,
                          COMPONENT_NOT_IMPLEMENTED);
end Sensor_Types;
