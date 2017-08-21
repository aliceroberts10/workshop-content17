
##############################################################################
# Follwing code converts anon_1N.json.gz to a R data frame new_car_dt2.RData #
##############################################################################

rm(list = ls())

#install.packages("rjson")
library("rjson")
#install.packages("jsonlite")
library("jsonlite")

setwd("Working Directory")

json_file_gz2 = "anon_1N.json.gz"

# This file has 1462146 data records
len    = 1462146

# Extract the data records from JSON file
page2   = readLines(json_file_gz2, n=len)
cardt2 = lapply(page2, fromJSON, flatten=T)

# Saves the extracted data file as RData
save(cardt2, file='cardt2.RData')

# Loading the RData file saved above
load('cardt2.RData')

# Objective of the following section it too convert the data into a matrix format
# Data file above has 1462146 rows and 202 columns after converting it to a matrix
# with the nested varaibles in the JSON File

# Define 202 arrarys representing 202 coulmns/variables 
index = rep(NA, len)
type  = rep(NA, len)
id    = rep(NA, len)
score = rep(NA, len)
source_id                  = rep(NA, len)
source_CreatedOn           = rep(NA, len)
source_LastModified        = rep(NA, len)
source_MessageId           = rep(NA, len)
source_MessageGroupId      = rep(NA, len)
source_DeviceTime_Timestamp = rep(NA, len)
source_DeviceTime_Status    = rep(NA, len)
source_IMEI                = rep(NA, len)
source_EventCode           = rep(NA, len)
source_SequenceNumber      = rep(NA, len)
source_IsFirstMessage      = rep(NA, len)
source_IsLastMessage       = rep(NA, len)
source_GatewayTimeStamp    = rep(NA, len)
source_Vehicle_Id                = rep(NA, len)
source_Vehicle_CreatedOn         = rep(NA, len)
source_Vehicle_LastModified      = rep(NA, len)
source_Vehicle_MojioMessageId    = rep(NA, len)
source_Vehicle_TelematicDeviceId = rep(NA, len)
source_Vehicle_Revision          = rep(NA, len)
source_Vehicle_LastContactTime   = rep(NA, len)
source_Vehicle_VinDetails_Timestamp = rep(NA, len)
source_Vehicle_VinDetails_Year      = rep(NA, len)
source_Vehicle_VinDetails_Make      = rep(NA, len)
source_Vehicle_VinDetails_Model     = rep(NA, len)
source_Vehicle_VinDetails_Engine    = rep(NA, len)
source_Vehicle_VinDetails_Cylinders = rep(NA, len)
source_Vehicle_VinDetails_TotalFuelCapacity_Timestamp = rep(NA, len)
source_Vehicle_VinDetails_TotalFuelCapacity_Unit      = rep(NA, len)
source_Vehicle_VinDetails_TotalFuelCapacity_Value     = rep(NA, len)
source_Vehicle_VinDetails_FuelType               = rep(NA, len)
source_Vehicle_VinDetails_CityFuelEfficiency     = rep(NA, len)
source_Vehicle_VinDetails_HighwayFuelEfficiency  = rep(NA, len)
source_Vehicle_VinDetails_CombinedFuelEfficiency = rep(NA, len)
source_Vehicle_VinDetails_Transmission           = rep(NA, len)
source_Vehicle_VinDetails_Success                = rep(NA, len)
source_Vehicle_Acceleration_Timestamp = rep(NA, len)
source_Vehicle_Acceleration_Unit      = rep(NA, len)
source_Vehicle_Acceleration_Value     = rep(NA, len)
source_Vehicle_Deceleration_Timestamp = rep(NA, len)
source_Vehicle_Deceleration_Unit      = rep(NA, len)
source_Vehicle_Deceleration_Value     = rep(NA, len)
source_Vehicle_RPM_Timestamp = rep(NA, len)
source_Vehicle_RPM_Unit      = rep(NA, len)
source_Vehicle_RPM_Value     = rep(NA, len)
source_Vehicle_Speed_Timestamp = rep(NA, len)
source_Vehicle_Speed_Unit      = rep(NA, len)
source_Vehicle_Speed_Value     = rep(NA, len)
source_Vehicle_FuelEfficiency_Timestamp = rep(NA, len)
source_Vehicle_FuelEfficiency_Unit      = rep(NA, len)
source_Vehicle_FuelEfficiency_Value     = rep(NA, len)
source_Vehicle_FuelLevel_RiskSeverity = rep(NA, len)
source_Vehicle_FuelLevel_Timestamp    = rep(NA, len)
source_Vehicle_FuelLevel_Unit         = rep(NA, len)
source_Vehicle_FuelLevel_Value        = rep(NA, len)
source_Vehicle_Battery_RiskSeverity        = rep(NA, len)
source_Vehicle_Battery_LowVoltageDuration_Timestamp   = rep(NA, len)
source_Vehicle_Battery_LowVoltageDuration_Unit        = rep(NA, len)
source_Vehicle_Battery_LowVoltageDuration_Value       = rep(NA, len)
source_Vehicle_Battery_HighVoltageDuration_Timestamp  = rep(NA, len)
source_Vehicle_Battery_HighVoltageDuration_Unit       = rep(NA, len)
source_Vehicle_Battery_HighVoltageDuration_Value      = rep(NA, len)
source_Vehicle_Battery_Timestamp           = rep(NA, len)
source_Vehicle_Battery_Unit                = rep(NA, len)
source_Vehicle_Battery_Value               = rep(NA, len)
source_Vehicle_Location_Address_HouseNumber           = rep(NA, len)
source_Vehicle_Location_Address_Raod                  = rep(NA, len)
source_Vehicle_Location_Address_City                  = rep(NA, len)
source_Vehicle_Location_Address_County                = rep(NA, len)
source_Vehicle_Location_Address_State                 = rep(NA, len)
source_Vehicle_Location_Address_PostCode              = rep(NA, len)
source_Vehicle_Location_Address_Country               = rep(NA, len)
source_Vehicle_Location_Address_CountryCode           = rep(NA, len)
source_Vehicle_Location_Address_FormattedAddress      = rep(NA, len)
source_Vehicle_Location_Timestamp = rep(NA, len)
source_Vehicle_Location_Lat       = rep(NA, len)
source_Vehicle_Location_Lng       = rep(NA, len)
source_Vehicle_Location_Status    = rep(NA, len)
source_Vehicle_Location_Dilution  = rep(NA, len)
source_Vehicle_Location_Altitude  = rep(NA, len)
source_Vehicle_Location_GeoHash   = rep(NA, len)
source_Vehicle_Location_Accuracy_Timestamp            = rep(NA, len)
source_Vehicle_Location_Accuracy_Unit                 = rep(NA, len)
source_Vehicle_Location_Accuracy_Value                = rep(NA, len)
source_Vehicle_Accelerometer_X_Timestamp              = rep(NA, len)
source_Vehicle_Accelerometer_X_Unit                   = rep(NA, len)
source_Vehicle_Accelerometer_X_Value                  = rep(NA, len)
source_Vehicle_Accelerometer_Y_Timestamp              = rep(NA, len)
source_Vehicle_Accelerometer_Y_Unit                   = rep(NA, len)
source_Vehicle_Accelerometer_Y_Value                  = rep(NA, len)
source_Vehicle_Accelerometer_Z_Timestamp              = rep(NA, len)
source_Vehicle_Accelerometer_Z_Unit                   = rep(NA, len)
source_Vehicle_Accelerometer_Z_Value                  = rep(NA, len)
source_Vehicle_Accelerometer_Magnitude_Timestamp      = rep(NA, len)
source_Vehicle_Accelerometer_Magnitude_Unit           = rep(NA, len)
source_Vehicle_Accelerometer_Magnitude_Value          = rep(NA, len)
source_Vehicle_Heading_Direction = rep(NA, len)  
source_Vehicle_Heading_LeftTurn  = rep(NA, len)  
source_Vehicle_Heading_Timestamp = rep(NA, len)  
source_Vehicle_Heading_Unit      = rep(NA, len)  
source_Vehicle_Heading_Value     = rep(NA, len)  
source_Vehicle_VirtualOdometer_RolloverValue = rep(NA, len)
source_Vehicle_VirtualOdometer_Timestamp     = rep(NA, len)  
source_Vehicle_VirtualOdometer_Unit          = rep(NA, len)  
source_Vehicle_VirtualOdometer_Value         = rep(NA, len)  
source_Vehicle_IgnitionState_Timestamp       = rep(NA, len)
source_Vehicle_IgnitionState_Value           = rep(NA, len)
source_Vehicle_TowState_Timestamp            = rep(NA, len)
source_Vehicle_TowState_Value                = rep(NA, len)
source_Vehicle_AccidentState_TimeStamp       = rep(NA, len)
source_Vehicle_IdleState_Timestamp           = rep(NA, len)
source_Vehicle_IdleState_Value               = rep(NA, len)
source_Vehicle_HarshEventState_Timestamp     = rep(NA, len)
source_Vehicle_ParkedState_Timestamp         = rep(NA, len)
source_Vehicle_ParkedState_Value             = rep(NA, len)
source_Vehicle_SkippedTripGear               = rep(NA, len)
source_TelematicDevice_Id                = rep(NA, len)
source_TelematicDevice_CreatedOn         = rep(NA, len)
source_TelematicDevice_LastModified      = rep(NA, len)
source_TelematicDevice_MojioMessageId    = rep(NA, len)
source_TelematicDevice_VehicleId         = rep(NA, len)
source_TelematicDevice_Revision          = rep(NA, len)
source_TelematicDevice_LastContactTime   = rep(NA, len)
source_TelematicDevice_IMEI              = rep(NA, len)
source_TelematicDevice_GPSRadio_Timestamp                        = rep(NA, len)
source_TelematicDevice_GPSRadio_NumberOfSattelitesForPositionFix = rep(NA, len)
source_TelematicDevice_GPSRadio_HorizontalDilutionOfPrecision    = rep(NA, len)
source_TelematicDevice_GPSRadio_Location_Timestamp               = rep(NA, len)
source_TelematicDevice_GPSRadio_Location_Lat                     = rep(NA, len)
source_TelematicDevice_GPSRadio_Location_Lng                     = rep(NA, len)
source_TelematicDevice_GPSRadio_Location_Status                  = rep(NA, len)
source_TelematicDevice_GPSRadio_Location_Dilution                = rep(NA, len)
source_TelematicDevice_GPSRadio_Location_Altitude                = rep(NA, len)
source_TelematicDevice_GPSRadio_Location_Accuaracy_Timestamp     = rep(NA, len)
source_TelematicDevice_GPSRadio_Location_Accuaracy_Unit          = rep(NA, len)
source_TelematicDevice_GPSRadio_Location_Accuaracy_Value         = rep(NA, len)
source_TelematicDevice_GPSRadio_HardwareAccuracyInMeters         = rep(NA, len)
source_TelematicDevice_GPSRadio_PercentLostGPS                   = rep(NA, len)
source_TelematicDevice_GPSRadio_PercentLostGPSQ                  = rep(NA, len)
source_TelematicDevice_GPSRadio_Status                           = rep(NA, len)
source_TelematicDevice_GPSRadio_LostLockTime_Timestamp           = rep(NA, len)
source_TelematicDevice_GPSRadio_LostLockTime_Unit                = rep(NA, len)
source_TelematicDevice_GPSRadio_LostLockTime_Value               = rep(NA, len)
source_TelematicDevice_CellularRadio_Timestamp                     = rep(NA, len)
source_TelematicDevice_CellularRadio_GSMRegistrationState          = rep(NA, len)
source_TelematicDevice_CellularRadio_ReceiveSignalStrength         = rep(NA, len)
source_TelematicDevice_CellularRadio_ReceiveSignalDecibelMilliwatts = rep(NA, len)
source_TelematicDevice_CellularRadio_ReceiveSignalQualityOfService = rep(NA, len)
source_TelematicDevice_CellularRadio_SMSMessageOutCounter          = rep(NA, len)
source_TelematicDevice_CellularRadio_SMSMessageInCounter           = rep(NA, len)
source_TelematicDevice_CellularRadio_SMSSpamMessageInCounter       = rep(NA, len)
source_TelematicDevice_CellularRadio_PercentLostGSM                = rep(NA, len)
source_TelematicDevice_CellularRadio_DataOutCounter_Timestamp      = rep(NA, len)
source_TelematicDevice_CellularRadio_DataOutCounter_Unit           = rep(NA, len)
source_TelematicDevice_CellularRadio_DataOutCounter_Value          = rep(NA, len)
source_TelematicDevice_CellularRadio_ACKInCounter_Timestamp        = rep(NA, len)
source_TelematicDevice_CellularRadio_ACKInCounter_Unit             = rep(NA, len)
source_TelematicDevice_CellularRadio_ACKInCounter_Value            = rep(NA, len)
source_TelematicDevice_CellularRadioDOTAIn_Timestamp               = rep(NA, len)
source_TelematicDevice_CellularRadioDOTAIn_Unit                    = rep(NA, len)
source_TelematicDevice_CellularRadioDOTAIn_Value                   = rep(NA, len)
source_TelematicDevice_OffDuration_Timestamp                       = rep(NA, len)
source_TelematicDevice_OffDuration_Unit                            = rep(NA, len)
source_TelematicDevice_OffDuration_Value                           = rep(NA, len)
source_TelematicDevice_OnDuration_Timestamp                       = rep(NA, len)
source_TelematicDevice_OnDuration_Unit                            = rep(NA, len)
source_TelematicDevice_OnDuration_Value                           = rep(NA, len)
source_TelematicDevice_PowerUpCounter                             = rep(NA, len)
source_TelematicDevice_ResetCounter                               = rep(NA, len)
source_TelematicDevice_MainFirmware_Timestamp                     = rep(NA, len)
source_TelematicDevice_MainFirmware_Version                       = rep(NA, len)
source_TelematicDevice_OBDFirmware_Timestamp                      = rep(NA, len)
source_TelematicDevice_OBDFirmware_Version                        = rep(NA, len)
source_TelematicDevice_DeviceIdentifiers_Timestamp                  = rep(NA, len)
source_TelematicDevice_DeviceIdentifiers_ScriptConfigurationVersion = rep(NA, len)
source_TelematicDevice_Battery_Connected                            = rep(NA, len)
source_TelematicDevice_Battery_RiskSeverity                         = rep(NA, len)
source_TelematicDevice_Battery_Timestamp                            = rep(NA, len)
source_TelematicDevice_Battery_Unit                                 = rep(NA, len)
source_TelematicDevice_Battery_Value                                = rep(NA, len)
source_TelematicDevice_ConnectedState_Timestamp    = rep(NA, len)
source_TelematicDevice_ConnectedState_Value        = rep(NA, len)
source_TelematicDevice_AwakeState_Timestamp        = rep(NA, len)
source_TelematicDevice_AwakeState_AwakeReason      = rep(NA, len)
source_TelematicDevice_AwakeState_Value            = rep(NA, len)
source_TelematicDevice_SimChangeState_Timestamp    = rep(NA, len)
source_TelematicDevice_SimChangeState_Value        = rep(NA, len)
source_TelematicDevice_PreSleepState_Timestamp     = rep(NA, len)
source_TelematicDevice_PreSleepState_Value         = rep(NA, len)
source_TelematicDevice_ResetState_Timestamp        = rep(NA, len)
source_TelematicDevice_ResetState_Value            = rep(NA, len)
source_TelematicDevice_PowerState_Timestamp        = rep(NA, len)       
source_TelematicDevice_PowerState_Value            = rep(NA, len)
source_TelematicDevice_UnitStatus                  = rep(NA, len)
source_TelematicDevice_InputState                  = rep(NA, len)
source_DeviceConfiguration_Configurations_Timestamp = rep(NA, len)
source_DeviceConfiguration_Configurations_Name      = rep(NA, len)
source_DeviceConfiguration_Configurations_Value     = rep(NA, len)
source_DeviceConfiguration_Configurations_Type      = rep(NA, len)

# Reads data into each of the 202 arrays using a loop which runs over cardt2.RData files
for (i in 1:len)
{ 
  if (i %% 10000==0)
  {
    print(i)
  }
  
  index[i] = cardt2[[i]]$`_index`
  type[i]  = cardt2[[i]]$`_type`
  id[i]    = cardt2[[i]]$`_id`
  score[i] = cardt2[[i]]$`_score`
  
  source_id[i]                  = cardt2[[i]]$`_source`$id
  source_CreatedOn[i]           = cardt2[[i]]$`_source`$CreatedOn
  source_LastModified[i]        = cardt2[[i]]$`_source`$LastModified
  source_MessageId[i]           = cardt2[[i]]$`_source`$MessageId
  source_MessageGroupId[i]      = cardt2[[i]]$`_source`$MessageGroupId
  source_DeviceTime_Timestamp[i]  = cardt2[[i]]$`_source`$DeviceTime$Timestamp
  source_DeviceTime_Status[i]  = cardt2[[i]]$`_source`$DeviceTime$Status
  source_IMEI[i]                = cardt2[[i]]$`_source`$IMEI
  source_EventCode[i]           = cardt2[[i]]$`_source`$EventCode
  source_SequenceNumber[i]      = cardt2[[i]]$`_source`$SequenceNumber
  source_IsFirstMessage[i]      = cardt2[[i]]$`_source`$IsFirstMessage
  source_IsLastMessage[i]       = cardt2[[i]]$`_source`$IsLastMessage
  source_GatewayTimeStamp[i]    = cardt2[[i]]$`_source`$GatewayTimeStamp
  
  source_Vehicle_Id[i]                                     = if(is.null(cardt2[[i]]$`_source`$Vehicle$Id)==FALSE) cardt2[[i]]$`_source`$Vehicle$Id else NA 
  source_Vehicle_CreatedOn[i]                              = if(is.null(cardt2[[i]]$`_source`$Vehicle$CreatedOn)==FALSE) cardt2[[i]]$`_source`$Vehicle$CreatedOn else NA
  source_Vehicle_LastModified[i]                           = if(is.null(cardt2[[i]]$`_source`$Vehicle$LastModified)==FALSE) cardt2[[i]]$`_source`$Vehicle$LastModified else NA
  source_Vehicle_MojioMessageId[i]                         = if(is.null(cardt2[[i]]$`_source`$Vehicle$MojioMessageId)==FALSE) cardt2[[i]]$`_source`$Vehicle$MojioMessageId else NA
  source_Vehicle_TelematicDeviceId[i]                      = if(is.null(cardt2[[i]]$`_source`$Vehicle$TelematicDeviceId)==FALSE) cardt2[[i]]$`_source`$Vehicle$TelematicDeviceId else NA
  source_Vehicle_Revision[i]                               = if(is.null(cardt2[[i]]$`_source`$Vehicle$Revision)==FALSE) cardt2[[i]]$`_source`$Vehicle$Revision else NA
  source_Vehicle_LastContactTime[i]                        = if(is.null(cardt2[[i]]$`_source`$Vehicle$LastContactTime)==FALSE) cardt2[[i]]$`_source`$Vehicle$LastContactTime else NA
  source_Vehicle_VinDetails_Timestamp[i]                   = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$Timestamp else NA
  source_Vehicle_VinDetails_Year[i]                        = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$Year)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$Year else NA
  source_Vehicle_VinDetails_Make[i]                        = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$Make)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$Make else NA
  source_Vehicle_VinDetails_Model[i]                       = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$Model)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$Model else NA
  source_Vehicle_VinDetails_Engine[i]                      = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$Engine)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$Engine else NA
  source_Vehicle_VinDetails_Cylinders[i]                   = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$Cylinders)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$Cylinders else NA
  source_Vehicle_VinDetails_TotalFuelCapacity_Timestamp[i] = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$TotalFuelCapacity$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$TotalFuelCapacity$Timestamp else NA
  source_Vehicle_VinDetails_TotalFuelCapacity_Unit[i]      = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$TotalFuelCapacity$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$TotalFuelCapacity$Unit else NA
  source_Vehicle_VinDetails_TotalFuelCapacity_Value[i]     = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$TotalFuelCapacity$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$TotalFuelCapacity$Value else NA
  source_Vehicle_VinDetails_FuelType[i]                    = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$FuelType)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$FuelType else NA
  source_Vehicle_VinDetails_CityFuelEfficiency[i]          = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$CityFuelEfficiency)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$CityFuelEfficiency else NA
  source_Vehicle_VinDetails_HighwayFuelEfficiency[i]       = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$HighwayFuelEfficiency)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$HighwayFuelEfficiency else NA
  source_Vehicle_VinDetails_CombinedFuelEfficiency[i]      = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$CombinedFuelEfficiency)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$CombinedFuelEfficiency else NA
  source_Vehicle_VinDetails_Transmission[i]                = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$Transmission)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$Transmission else NA
  source_Vehicle_VinDetails_Success[i]                     = if(is.null(cardt2[[i]]$`_source`$Vehicle$VinDetails$Success)==FALSE) cardt2[[i]]$`_source`$Vehicle$VinDetails$Success else NA
  source_Vehicle_Acceleration_Timestamp[i]                 = if(is.null(cardt2[[i]]$`_source`$Vehicle$Acceleration$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$Acceleration$Timestamp else NA
  source_Vehicle_Acceleration_Unit[i]                      = if(is.null(cardt2[[i]]$`_source`$Vehicle$Acceleration$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$Acceleration$Unit else NA
  source_Vehicle_Acceleration_Value[i]                     = if(is.null(cardt2[[i]]$`_source`$Vehicle$Acceleration$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$Acceleration$Value else NA
  source_Vehicle_Deceleration_Timestamp[i]                 = if(is.null(cardt2[[i]]$`_source`$Vehicle$Deceleration$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$Deceleration$Timestamp else NA
  source_Vehicle_Deceleration_Unit[i]                      = if(is.null(cardt2[[i]]$`_source`$Vehicle$Deceleration$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$Deceleration$Unit else NA
  source_Vehicle_Deceleration_Value[i]                     = if(is.null(cardt2[[i]]$`_source`$Vehicle$Deceleration$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$Deceleration$Value else NA
  source_Vehicle_RPM_Timestamp[i]                          = if(is.null(cardt2[[i]]$`_source`$Vehicle$RPM$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$RPM$Timestamp else NA
  source_Vehicle_RPM_Unit[i]                               = if(is.null(cardt2[[i]]$`_source`$Vehicle$RPM$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$RPM$Unit else NA
  source_Vehicle_RPM_Value[i]                              = if(is.null(cardt2[[i]]$`_source`$Vehicle$RPM$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$RPM$Value else NA
  source_Vehicle_Speed_Timestamp[i]                        = if(is.null(cardt2[[i]]$`_source`$Vehicle$Speed$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$Speed$Timestamp else NA
  source_Vehicle_Speed_Unit[i]                             = if(is.null(cardt2[[i]]$`_source`$Vehicle$Speed$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$Speed$Unit else NA
  source_Vehicle_Speed_Value[i]                            = if(is.null(cardt2[[i]]$`_source`$Vehicle$Speed$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$Speed$Value else NA
  source_Vehicle_FuelEfficiency_Timestamp[i]               = if(is.null(cardt2[[i]]$`_source`$Vehicle$FuelEfficiency$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$FuelEfficiency$Timestamp else NA
  source_Vehicle_FuelEfficiency_Unit[i]                    = if(is.null(cardt2[[i]]$`_source`$Vehicle$FuelEfficiency$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$FuelEfficiency$Unit else NA
  source_Vehicle_FuelEfficiency_Value[i]                   = if(is.null(cardt2[[i]]$`_source`$Vehicle$FuelEfficiency$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$FuelEfficiency$Value else NA
  source_Vehicle_FuelLevel_RiskSeverity[i]                 = if(is.null(cardt2[[i]]$`_source`$Vehicle$FuelLevel$RiskSeverity)==FALSE) cardt2[[i]]$`_source`$Vehicle$FuelLevel$RiskSeverity else NA
  source_Vehicle_FuelLevel_Timestamp[i]                    = if(is.null(cardt2[[i]]$`_source`$Vehicle$FuelLevel$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$FuelLevel$Timestamp else NA
  source_Vehicle_FuelLevel_Unit[i]                         = if(is.null(cardt2[[i]]$`_source`$Vehicle$FuelLevel$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$FuelLevel$Unit else NA
  source_Vehicle_FuelLevel_Value[i]                        = if(is.null(cardt2[[i]]$`_source`$Vehicle$FuelLevel$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$FuelLevel$Value else NA
  source_Vehicle_Battery_RiskSeverity[i]                   = if(is.null(cardt2[[i]]$`_source`$Vehicle$Battery$RiskSeverity)==FALSE) cardt2[[i]]$`_source`$Vehicle$Battery$RiskSeverity else NA
  source_Vehicle_Battery_LowVoltageDuration_Timestamp[i]   = if(is.null(cardt2[[i]]$`_source`$Vehicle$Battery$LowVoltageDuration$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$Battery$LowVoltageDuration$Timestamp else NA
  source_Vehicle_Battery_LowVoltageDuration_Unit[i]        = if(is.null(cardt2[[i]]$`_source`$Vehicle$Battery$LowVoltageDuration$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$Battery$LowVoltageDuration$Unit else NA
  source_Vehicle_Battery_LowVoltageDuration_Value[i]       = if(is.null(cardt2[[i]]$`_source`$Vehicle$Battery$LowVoltageDuration$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$Battery$LowVoltageDuration$Value else NA
  source_Vehicle_Battery_HighVoltageDuration_Timestamp[i]  = if(is.null(cardt2[[i]]$`_source`$Vehicle$Battery$HighVoltageDuration$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$Battery$HighVoltageDuration$Timestamp else NA
  source_Vehicle_Battery_HighVoltageDuration_Unit[i]       = if(is.null(cardt2[[i]]$`_source`$Vehicle$Battery$HighVoltageDuration$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$Battery$HighVoltageDuration$Unit else NA
  source_Vehicle_Battery_HighVoltageDuration_Value[i]      = if(is.null(cardt2[[i]]$`_source`$Vehicle$Battery$HighVoltageDuration$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$Battery$HighVoltageDuration$Value else NA
  source_Vehicle_Battery_Timestamp[i]                      = if(is.null(cardt2[[i]]$`_source`$Vehicle$Battery$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$Battery$Timestamp else NA
  source_Vehicle_Battery_Unit[i]                           = if(is.null(cardt2[[i]]$`_source`$Vehicle$Battery$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$Battery$Unit else NA
  source_Vehicle_Battery_Value[i]                          = if(is.null(cardt2[[i]]$`_source`$Vehicle$Battery$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$Battery$Value else NA
  source_Vehicle_Location_Address_HouseNumber[i]           = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Address$HouseNumber)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Address$HouseNumber else NA
  source_Vehicle_Location_Address_Raod[i]                  = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Address$Road)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Address$Road else NA
  source_Vehicle_Location_Address_City[i]                  = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Address$City)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Address$City else NA
  source_Vehicle_Location_Address_County[i]                = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Address$County)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Address$County else NA
  source_Vehicle_Location_Address_State[i]                 = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Address$State)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Address$State else NA
  source_Vehicle_Location_Address_PostCode[i]              = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Address$PostCode)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Address$PostCode else NA
  source_Vehicle_Location_Address_Country[i]               = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Address$Country)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Address$Country else NA
  source_Vehicle_Location_Address_CountryCode[i]           = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Address$CountryCode)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Address$CountryCode else NA
  source_Vehicle_Location_Address_FormattedAddress[i]      = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Address$FormattedAddress)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Address$FormattedAddress else NA
  source_Vehicle_Location_Timestamp[i]                     = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Timestamp else NA
  source_Vehicle_Location_Lat[i]                           = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Lat)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Lat else NA
  source_Vehicle_Location_Lng[i]                           = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Lng)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Lng else NA
  source_Vehicle_Location_Status[i]                        = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Status)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Status else NA
  source_Vehicle_Location_Dilution[i]                      = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Dilution)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Dilution else NA
  source_Vehicle_Location_Altitude[i]                      = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Altitude)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Altitude else NA
  source_Vehicle_Location_GeoHash[i]                       = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$GeoHash)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$GeoHash else NA
  source_Vehicle_Location_Accuracy_Timestamp[i]            = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Accuracy$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Accuracy$Timestamp else NA
  source_Vehicle_Location_Accuracy_Unit[i]                 = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Accuracy$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Accuracy$Unit else NA
  source_Vehicle_Location_Accuracy_Value[i]                = if(is.null(cardt2[[i]]$`_source`$Vehicle$Location$Accuracy$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$Location$Accuracy$Value else NA
  source_Vehicle_Accelerometer_X_Timestamp[i]              = if(is.null(cardt2[[i]]$`_source`$Vehicle$Accelerometer$X$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$Accelerometer$X$Timestamp else NA
  source_Vehicle_Accelerometer_X_Unit[i]                   = if(is.null(cardt2[[i]]$`_source`$Vehicle$Accelerometer$X$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$Accelerometer$X$Unit else NA
  source_Vehicle_Accelerometer_X_Value[i]                  = if(is.null(cardt2[[i]]$`_source`$Vehicle$Accelerometer$X$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$Accelerometer$X$Value else NA
  source_Vehicle_Accelerometer_Y_Timestamp[i]              = if(is.null(cardt2[[i]]$`_source`$Vehicle$Accelerometer$Y$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$Accelerometer$Y$Timestamp else NA
  source_Vehicle_Accelerometer_Y_Unit[i]                   = if(is.null(cardt2[[i]]$`_source`$Vehicle$Accelerometer$Y$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$Accelerometer$Y$Unit else NA
  source_Vehicle_Accelerometer_Y_Value[i]                  = if(is.null(cardt2[[i]]$`_source`$Vehicle$Accelerometer$Y$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$Accelerometer$Y$Value else NA
  source_Vehicle_Accelerometer_Z_Timestamp[i]              = if(is.null(cardt2[[i]]$`_source`$Vehicle$Accelerometer$Z$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$Accelerometer$Z$Timestamp else NA
  source_Vehicle_Accelerometer_Z_Unit[i]                   = if(is.null(cardt2[[i]]$`_source`$Vehicle$Accelerometer$Z$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$Accelerometer$Z$Unit else NA
  source_Vehicle_Accelerometer_Z_Value[i]                  = if(is.null(cardt2[[i]]$`_source`$Vehicle$Accelerometer$Z$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$Accelerometer$Z$Value else NA
  source_Vehicle_Accelerometer_Magnitude_Timestamp[i]      = if(is.null(cardt2[[i]]$`_source`$Vehicle$Accelerometer$Magnitude$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$Accelerometer$Magnitude$Timestamp else NA
  source_Vehicle_Accelerometer_Magnitude_Unit[i]           = if(is.null(cardt2[[i]]$`_source`$Vehicle$Accelerometer$Magnitude$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$Accelerometer$Magnitude$Unit else NA
  source_Vehicle_Accelerometer_Magnitude_Value[i]          = if(is.null(cardt2[[i]]$`_source`$Vehicle$Accelerometer$Magnitude$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$Accelerometer$Magnitude$Value else NA
  source_Vehicle_Heading_Direction[i]                      = if(is.null(cardt2[[i]]$`_source`$Vehicle$Heading$Direction)==FALSE) cardt2[[i]]$`_source`$Vehicle$Heading$Direction else NA
  source_Vehicle_Heading_LeftTurn[i]                       = if(is.null(cardt2[[i]]$`_source`$Vehicle$Heading$LeftTurn)==FALSE) cardt2[[i]]$`_source`$Vehicle$Heading$LeftTurn else NA
  source_Vehicle_Heading_Timestamp[i]                      = if(is.null(cardt2[[i]]$`_source`$Vehicle$Heading$Timestamp)==FALSE)cardt2[[i]]$`_source`$Vehicle$Heading$Timestamp else NA
  source_Vehicle_Heading_Unit[i]                           = if(is.null(cardt2[[i]]$`_source`$Vehicle$Heading$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$Heading$Unit else NA
  source_Vehicle_Heading_Value[i]                          = if(is.null(cardt2[[i]]$`_source`$Vehicle$Heading$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$Heading$Value else NA
  source_Vehicle_VirtualOdometer_RolloverValue[i]          = if(is.null(cardt2[[i]]$`_source`$Vehicle$VirtualOdometer$RolloverValue)==FALSE) cardt2[[i]]$`_source`$Vehicle$VirtualOdometer$RolloverValue else NA
  source_Vehicle_VirtualOdometer_Timestamp[i]              = if(is.null(cardt2[[i]]$`_source`$Vehicle$VirtualOdometer$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$VirtualOdometer$Timestamp  else NA 
  source_Vehicle_VirtualOdometer_Unit[i]                   = if(is.null(cardt2[[i]]$`_source`$Vehicle$VirtualOdometer$Unit)==FALSE) cardt2[[i]]$`_source`$Vehicle$VirtualOdometer$Unit else NA
  source_Vehicle_VirtualOdometer_Value[i]                  = if(is.null(cardt2[[i]]$`_source`$Vehicle$VirtualOdometer$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$VirtualOdometer$Value else NA
  source_Vehicle_IgnitionState_Timestamp[i]                = if(is.null(cardt2[[i]]$`_source`$Vehicle$IgnitionState$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$IgnitionState$Timestamp else NA
  source_Vehicle_IgnitionState_Value[i]                    = if(is.null(cardt2[[i]]$`_source`$Vehicle$IgnitionState$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$IgnitionState$Value else NA
  source_Vehicle_TowState_Timestamp[i]                     = if(is.null(cardt2[[i]]$`_source`$Vehicle$TowState$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$TowState$Timestamp else NA
  source_Vehicle_TowState_Value[i]                         = if(is.null(cardt2[[i]]$`_source`$Vehicle$TowState$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$TowState$Value else NA
  source_Vehicle_AccidentState_TimeStamp[i]                = if(is.null(cardt2[[i]]$`_source`$Vehicle$AccidentState$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$AccidentState$Timestamp else NA
  source_Vehicle_IdleState_Timestamp[i]                    = if(is.null(cardt2[[i]]$`_source`$Vehicle$IdleState$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$IdleState$Timestamp else NA
  source_Vehicle_IdleState_Value[i]                        = if(is.null(cardt2[[i]]$`_source`$Vehicle$IdleState$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$IdleState$Value else NA
  source_Vehicle_HarshEventState_Timestamp[i]              = if(is.null(cardt2[[i]]$`_source`$Vehicle$HarshEventState$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$HarshEventState$Timestamp else NA
  source_Vehicle_ParkedState_Timestamp[i]                  = if(is.null(cardt2[[i]]$`_source`$Vehicle$ParkedState$Timestamp)==FALSE) cardt2[[i]]$`_source`$Vehicle$ParkedState$Timestamp else NA
  source_Vehicle_ParkedState_Value[i]                      = if(is.null(cardt2[[i]]$`_source`$Vehicle$ParkedState$Value)==FALSE) cardt2[[i]]$`_source`$Vehicle$ParkedState$Value else NA
  source_TelematicDevice_Id[i]                             = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$Id)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$Id else NA
  source_TelematicDevice_CreatedOn[i]                      = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CreatedOn)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CreatedOn else NA
  source_TelematicDevice_LastModified[i]                   = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$LastModified)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$LastModified else NA
  source_TelematicDevice_MojioMessageId[i]                 = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$MojioMessageId)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$MojioMessageId else NA
  source_TelematicDevice_VehicleId[i]                      = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$VehicleId)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$VehicleId else NA
  source_TelematicDevice_Revision[i]                       = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$Revision)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$Revision else NA
  source_TelematicDevice_LastContactTime[i]                = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$LastContactTime)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$LastContactTime else NA
  source_TelematicDevice_IMEI[i]                           = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$IMEI)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$IMEI else NA
  source_TelematicDevice_GPSRadio_Timestamp[i]                        = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Timestamp else NA
  source_TelematicDevice_GPSRadio_NumberOfSattelitesForPositionFix[i] = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$NumberOfSattelitesForPositionFix)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$NumberOfSattelitesForPositionFix else NA
  source_TelematicDevice_GPSRadio_HorizontalDilutionOfPrecision[i]    = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$HorizontalDilutionOfPrecision)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$HorizontalDilutionOfPrecision else NA
  source_TelematicDevice_GPSRadio_Location_Timestamp[i]               = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Timestamp else NA
  source_TelematicDevice_GPSRadio_Location_Lat[i]                     = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Lat)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Lat else NA
  source_TelematicDevice_GPSRadio_Location_Lng[i]                     = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Lng)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Lng else NA
  source_TelematicDevice_GPSRadio_Location_Status[i]                  = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Status)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Status else NA
  source_TelematicDevice_GPSRadio_Location_Dilution[i]                = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Dilution)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Dilution else NA
  source_TelematicDevice_GPSRadio_Location_Altitude[i]                = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Altitude)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Altitude else NA
  source_TelematicDevice_GPSRadio_Location_Accuaracy_Timestamp[i]     = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Accuracy$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Accuracy$Timestamp else NA
  source_TelematicDevice_GPSRadio_Location_Accuaracy_Unit[i]          = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Accuracy$Unit)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Accuracy$Unit else NA
  source_TelematicDevice_GPSRadio_Location_Accuaracy_Value[i]         = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Accuracy$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Location$Accuracy$Value else NA
  source_TelematicDevice_GPSRadio_HardwareAccuracyInMeters[i]         = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$HardwareAccuracyInMeters)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$HardwareAccuracyInMeters else NA
  source_TelematicDevice_GPSRadio_PercentLostGPS[i]                   = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$PercentLostGPS)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$PercentLostGPS else NA
  source_TelematicDevice_GPSRadio_PercentLostGPSQ[i]                  = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$PercentLostGPSQ)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$PercentLostGPSQ else NA
  source_TelematicDevice_GPSRadio_Status[i]                           = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Status)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$Status else NA
  source_TelematicDevice_GPSRadio_LostLockTime_Timestamp[i]           = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$LostLockTime$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$LostLockTime$Timestamp else NA
  source_TelematicDevice_GPSRadio_LostLockTime_Unit[i]                = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$LostLockTime$Unit)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$LostLockTime$Unit else NA
  source_TelematicDevice_GPSRadio_LostLockTime_Value[i]               = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$LostLockTime$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$GPSRadio$LostLockTime$Value else NA
  source_TelematicDevice_CellularRadio_Timestamp[i]                     = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$Timestamp else NA
  source_TelematicDevice_CellularRadio_GSMRegistrationState[i]          = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$GSMRegistrationState)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$GSMRegistrationState else NA
  source_TelematicDevice_CellularRadio_ReceiveSignalStrength[i]         = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$ReceiveSignalStrength)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$ReceiveSignalStrength else NA
  source_TelematicDevice_CellularRadio_ReceiveSignalDecibelMilliwatts[i] = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$ReceiveSignalDecibelMilliwatts)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$ReceiveSignalDecibelMilliwatts else NA
  source_TelematicDevice_CellularRadio_ReceiveSignalQualityOfService[i] = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$ReceiveSignalQualityOfService)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$ReceiveSignalQualityOfService else NA
  source_TelematicDevice_CellularRadio_SMSMessageOutCounter[i]          = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$SMSMessageOutCounter)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$SMSMessageOutCounter else NA
  source_TelematicDevice_CellularRadio_SMSMessageInCounter[i]           = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$SMSMessageInCounter)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$SMSMessageInCounter else NA
  source_TelematicDevice_CellularRadio_SMSSpamMessageInCounter[i]       = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$SMSSpamMessageInCounter)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$SMSSpamMessageInCounter else NA
  source_TelematicDevice_CellularRadio_PercentLostGSM[i]                = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$PercentLostGSM)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$PercentLostGSM else NA
  source_TelematicDevice_CellularRadio_DataOutCounter_Timestamp[i]      = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$DataOutCounter$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$DataOutCounter$Timestamp else NA
  source_TelematicDevice_CellularRadio_DataOutCounter_Unit[i]           = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$DataOutCounter$Unit)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$DataOutCounter$Unit else NA
  source_TelematicDevice_CellularRadio_DataOutCounter_Value[i]          = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$DataOutCounter$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$DataOutCounter$Value else NA
  source_TelematicDevice_CellularRadio_ACKInCounter_Timestamp[i]        = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$ACKInCounter$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$ACKInCounter$Timestamp else NA
  source_TelematicDevice_CellularRadio_ACKInCounter_Unit[i]             = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$ACKInCounter$Unit)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$ACKInCounter$Unit else NA
  source_TelematicDevice_CellularRadio_ACKInCounter_Value[i]            = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$ACKInCounter$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$ACKInCounter$Value else NA
  source_TelematicDevice_CellularRadioDOTAIn_Timestamp[i]               = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$DOTAIn$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$DOTAIn$Timestamp else NA
  source_TelematicDevice_CellularRadioDOTAIn_Unit[i]                    = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$DOTAIn$Unit)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$DOTAIn$Unit else NA
  source_TelematicDevice_CellularRadioDOTAIn_Value[i]                   = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$DOTAIn$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$CellularRadio$DOTAIn$Value else NA
  source_TelematicDevice_OffDuration_Timestamp[i]                       = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$OffDuration$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$OffDuration$Timestamp else NA
  source_TelematicDevice_OffDuration_Unit[i]                            = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$OffDuration$Unit)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$OffDuration$Unit else NA
  source_TelematicDevice_OffDuration_Value[i]                           = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$OffDuration$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$OffDuration$Value else NA
  source_TelematicDevice_OnDuration_Timestamp[i]                        = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$OnDuration$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$OnDuration$Timestamp else NA
  source_TelematicDevice_OnDuration_Unit[i]                             = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$OnDuration$Unit)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$OnDuration$Unit else NA
  source_TelematicDevice_OnDuration_Value[i]                            = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$OnDuration$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$OnDuration$Value else NA
  source_TelematicDevice_PowerUpCounter[i]                              = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$PowerUpCounter)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$PowerUpCounter else NA
  source_TelematicDevice_ResetCounter[i]                                = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$ResetCounter)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$ResetCounter else NA
  source_TelematicDevice_MainFirmware_Timestamp[i]                      = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$MainFirmware$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$MainFirmware$Timestamp else NA
  source_TelematicDevice_MainFirmware_Version[i]                        = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$MainFirmware$Version)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$MainFirmware$Version else NA
  source_TelematicDevice_OBDFirmware_Timestamp[i]                       = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$OBDFirmware$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$OBDFirmware$Timestamp else NA
  source_TelematicDevice_OBDFirmware_Version[i]                         = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$OBDFirmware$Version)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$OBDFirmware$Version else NA
  source_TelematicDevice_DeviceIdentifiers_Timestamp[i]                  = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$DeviceIdentifiers$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$DeviceIdentifiers$Timestamp else NA
  source_TelematicDevice_DeviceIdentifiers_ScriptConfigurationVersion[i] = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$DeviceIdentifiers$ScriptConfigurationVersion)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$DeviceIdentifiers$ScriptConfigurationVersion else NA
  source_TelematicDevice_Battery_Connected[i]                            = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$Battery$Connected)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$Battery$Connected else NA
  source_TelematicDevice_Battery_RiskSeverity[i]                         = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$Battery$RiskSeverity)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$Battery$RiskSeverity else NA
  source_TelematicDevice_Battery_Timestamp[i]                            = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$Battery$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$Battery$Timestamp else NA
  source_TelematicDevice_Battery_Unit[i]                                 = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$Battery$Unit)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$Battery$Unit else NA
  source_TelematicDevice_Battery_Value[i]                                = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$Battery$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$Battery$Value else NA
  source_TelematicDevice_ConnectedState_Timestamp[i]     = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$ConnectedState$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$ConnectedState$Timestamp else NA
  source_TelematicDevice_ConnectedState_Value[i]         = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$ConnectedState$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$ConnectedState$Value else NA
  source_TelematicDevice_AwakeState_Timestamp[i]         = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$AwakeState$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$AwakeState$Timestamp else NA
  source_TelematicDevice_AwakeState_AwakeReason[i]       = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$AwakeState$AwakeReason)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$AwakeState$AwakeReason else NA
  source_TelematicDevice_AwakeState_Value[i]             = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$AwakeState$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$AwakeState$Value else NA
  source_TelematicDevice_SimChangeState_Timestamp[i]     = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$SimChangeState$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$SimChangeState$Timestamp else NA
  source_TelematicDevice_SimChangeState_Value[i]         = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$SimChangeState$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$SimChangeState$Value else NA
  source_TelematicDevice_PreSleepState_Timestamp[i]      = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$PreSleepState$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$PreSleepState$Timestamp else NA
  source_TelematicDevice_PreSleepState_Value[i]          = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$PreSleepState$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$PreSleepState$Value else NA
  source_TelematicDevice_ResetState_Timestamp[i]         = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$ResetState$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$ResetState$Timestamp else NA
  source_TelematicDevice_ResetState_Value[i]             = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$ResetState$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$ResetState$Value else NA
  source_TelematicDevice_PowerState_Timestamp[i]         = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$PowerState$Timestamp)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$PowerState$Timestamp else NA
  source_TelematicDevice_PowerState_Value[i]             = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$PowerState$Value)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$PowerState$Value else NA
  source_TelematicDevice_UnitStatus[i]                   = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$UnitStatus)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$UnitStatus else NA
  source_TelematicDevice_InputState[i]                   = if(is.null(cardt2[[i]]$`_source`$TelematicDevice$InputState)==FALSE) cardt2[[i]]$`_source`$TelematicDevice$InputState else NA
  source_DeviceConfiguration_Configurations_Timestamp[i] = if(is.null(cardt2[[i]]$`_source`$DeviceConfiguration$Configurations$Timestamp)==FALSE) cardt2[[i]]$`_source`$DeviceConfiguration$Configurations$Timestamp else NA
  source_DeviceConfiguration_Configurations_Name[i]      = if(is.null(cardt2[[i]]$`_source`$DeviceConfiguration$Configurations$Name)==FALSE) cardt2[[i]]$`_source`$DeviceConfiguration$Configurations$Name else NA
  source_DeviceConfiguration_Configurations_Value[i]     = if(is.null(cardt2[[i]]$`_source`$DeviceConfiguration$Configurations$Value)==FALSE) cardt2[[i]]$`_source`$DeviceConfiguration$Configurations$Value else NA
  source_DeviceConfiguration_Configurations_Type[i]      = if(is.null(cardt2[[i]]$`_source`$DeviceConfiguration$Configurations$Type)==FALSE) cardt2[[i]]$`_source`$DeviceConfiguration$Configurations$Type else NA
}

# Creates a data frame using the 202 data columns extracted from cardt2.RData file
new_car_dt2 = data.frame(cbind(index, type, id, score, source_id, source_CreatedOn, 
                              source_LastModified, source_MessageId, 
                              source_MessageGroupId, source_DeviceTime_Timestamp, source_DeviceTime_Status, source_IMEI, source_EventCode, 
                              source_SequenceNumber, source_IsFirstMessage, 
                              source_IsLastMessage, source_GatewayTimeStamp,
                              source_Vehicle_Id,  source_Vehicle_CreatedOn, source_Vehicle_LastModified, source_Vehicle_MojioMessageId,
                              source_Vehicle_TelematicDeviceId, source_Vehicle_Revision, source_Vehicle_LastContactTime,
                              source_Vehicle_VinDetails_Timestamp,
                              source_Vehicle_VinDetails_Year,
                              source_Vehicle_VinDetails_Make,
                              source_Vehicle_VinDetails_Model,
                              source_Vehicle_VinDetails_Engine,
                              source_Vehicle_VinDetails_Cylinders,
                              source_Vehicle_VinDetails_TotalFuelCapacity_Timestamp,
                              source_Vehicle_VinDetails_TotalFuelCapacity_Unit,
                              source_Vehicle_VinDetails_TotalFuelCapacity_Value,
                              source_Vehicle_VinDetails_FuelType,
                              source_Vehicle_VinDetails_CityFuelEfficiency,
                              source_Vehicle_VinDetails_HighwayFuelEfficiency,
                              source_Vehicle_VinDetails_CombinedFuelEfficiency,
                              source_Vehicle_VinDetails_Transmission,
                              source_Vehicle_VinDetails_Success,
                              source_Vehicle_Acceleration_Timestamp,
                              source_Vehicle_Acceleration_Unit,
                              source_Vehicle_Acceleration_Value,
                              source_Vehicle_Deceleration_Timestamp,
                              source_Vehicle_Deceleration_Unit,
                              source_Vehicle_Deceleration_Value,
                              source_Vehicle_RPM_Timestamp,
                              source_Vehicle_RPM_Unit,
                              source_Vehicle_RPM_Value,
                              source_Vehicle_Speed_Timestamp,
                              source_Vehicle_Speed_Unit,
                              source_Vehicle_Speed_Value,
                              source_Vehicle_FuelEfficiency_Timestamp,
                              source_Vehicle_FuelEfficiency_Unit,
                              source_Vehicle_FuelEfficiency_Value,
                              source_Vehicle_FuelLevel_RiskSeverity,
                              source_Vehicle_FuelLevel_Timestamp,
                              source_Vehicle_FuelLevel_Unit,
                              source_Vehicle_FuelLevel_Value,
                              source_Vehicle_Battery_RiskSeverity,
                              source_Vehicle_Battery_LowVoltageDuration_Timestamp,
                              source_Vehicle_Battery_LowVoltageDuration_Unit,
                              source_Vehicle_Battery_LowVoltageDuration_Value,
                              source_Vehicle_Battery_HighVoltageDuration_Timestamp,
                              source_Vehicle_Battery_HighVoltageDuration_Unit,
                              source_Vehicle_Battery_HighVoltageDuration_Value,
                              source_Vehicle_Battery_Timestamp,
                              source_Vehicle_Battery_Unit,
                              source_Vehicle_Battery_Value,
                              source_Vehicle_Location_Address_HouseNumber,
                              source_Vehicle_Location_Address_Raod,
                              source_Vehicle_Location_Address_City,
                              source_Vehicle_Location_Address_County,
                              source_Vehicle_Location_Address_State,
                              source_Vehicle_Location_Address_PostCode,
                              source_Vehicle_Location_Address_Country,
                              source_Vehicle_Location_Address_CountryCode,
                              source_Vehicle_Location_Address_FormattedAddress,
                              source_Vehicle_Location_Timestamp,
                              source_Vehicle_Location_Lat,
                              source_Vehicle_Location_Lng,
                              source_Vehicle_Location_Status,
                              source_Vehicle_Location_Dilution,
                              source_Vehicle_Location_Altitude,
                              source_Vehicle_Location_GeoHash,
                              source_Vehicle_Location_Accuracy_Timestamp,
                              source_Vehicle_Location_Accuracy_Unit,
                              source_Vehicle_Location_Accuracy_Value,
                              source_Vehicle_Accelerometer_X_Timestamp,
                              source_Vehicle_Accelerometer_X_Unit,
                              source_Vehicle_Accelerometer_X_Value,
                              source_Vehicle_Accelerometer_Y_Timestamp,
                              source_Vehicle_Accelerometer_Y_Unit,
                              source_Vehicle_Accelerometer_Y_Value,
                              source_Vehicle_Accelerometer_Z_Timestamp,
                              source_Vehicle_Accelerometer_Z_Unit,
                              source_Vehicle_Accelerometer_Z_Value,
                              source_Vehicle_Accelerometer_Magnitude_Timestamp,
                              source_Vehicle_Accelerometer_Magnitude_Unit,
                              source_Vehicle_Accelerometer_Magnitude_Value,
                              source_Vehicle_Heading_Direction,  
                              source_Vehicle_Heading_LeftTurn,  
                              source_Vehicle_Heading_Timestamp,  
                              source_Vehicle_Heading_Unit,  
                              source_Vehicle_Heading_Value,  
                              source_Vehicle_VirtualOdometer_RolloverValue,
                              source_Vehicle_VirtualOdometer_Timestamp,  
                              source_Vehicle_VirtualOdometer_Unit,            
                              source_Vehicle_VirtualOdometer_Value, 
                              source_Vehicle_IgnitionState_Timestamp,     
                              source_Vehicle_IgnitionState_Value,       
                              source_Vehicle_TowState_Timestamp,        
                              source_Vehicle_TowState_Value,                
                              source_Vehicle_AccidentState_TimeStamp,
                              source_Vehicle_IdleState_Timestamp,           
                              source_Vehicle_IdleState_Value,               
                              source_Vehicle_HarshEventState_Timestamp,     
                              source_Vehicle_ParkedState_Timestamp,         
                              source_Vehicle_ParkedState_Value,             
                              source_Vehicle_SkippedTripGear,             
                              source_TelematicDevice_Id,              
                              source_TelematicDevice_CreatedOn,       
                              source_TelematicDevice_LastModified,      
                              source_TelematicDevice_MojioMessageId,  
                              source_TelematicDevice_VehicleId,       
                              source_TelematicDevice_Revision,        
                              source_TelematicDevice_LastContactTime, 
                              source_TelematicDevice_IMEI,            
                              source_TelematicDevice_GPSRadio_Timestamp,                      
                              source_TelematicDevice_GPSRadio_NumberOfSattelitesForPositionFix, 
                              source_TelematicDevice_GPSRadio_HorizontalDilutionOfPrecision,    
                              source_TelematicDevice_GPSRadio_Location_Timestamp,               
                              source_TelematicDevice_GPSRadio_Location_Lat,                     
                              source_TelematicDevice_GPSRadio_Location_Lng,                     
                              source_TelematicDevice_GPSRadio_Location_Status,                  
                              source_TelematicDevice_GPSRadio_Location_Dilution,                
                              source_TelematicDevice_GPSRadio_Location_Altitude,                
                              source_TelematicDevice_GPSRadio_Location_Accuaracy_Timestamp,     
                              source_TelematicDevice_GPSRadio_Location_Accuaracy_Unit,          
                              source_TelematicDevice_GPSRadio_Location_Accuaracy_Value,         
                              source_TelematicDevice_GPSRadio_HardwareAccuracyInMeters,         
                              source_TelematicDevice_GPSRadio_PercentLostGPS,                   
                              source_TelematicDevice_GPSRadio_PercentLostGPSQ,                  
                              source_TelematicDevice_GPSRadio_Status,                           
                              source_TelematicDevice_GPSRadio_LostLockTime_Timestamp,           
                              source_TelematicDevice_GPSRadio_LostLockTime_Unit,                
                              source_TelematicDevice_GPSRadio_LostLockTime_Value,
                              source_TelematicDevice_CellularRadio_Timestamp,
                              source_TelematicDevice_CellularRadio_GSMRegistrationState,
                              source_TelematicDevice_CellularRadio_ReceiveSignalStrength,
                              source_TelematicDevice_CellularRadio_ReceiveSignalDecibelMilliwatts,
                              source_TelematicDevice_CellularRadio_ReceiveSignalQualityOfService,
                              source_TelematicDevice_CellularRadio_SMSMessageOutCounter,
                              source_TelematicDevice_CellularRadio_SMSMessageInCounter,
                              source_TelematicDevice_CellularRadio_SMSSpamMessageInCounter,
                              source_TelematicDevice_CellularRadio_PercentLostGSM,
                              source_TelematicDevice_CellularRadio_DataOutCounter_Timestamp,
                              source_TelematicDevice_CellularRadio_DataOutCounter_Unit,
                              source_TelematicDevice_CellularRadio_DataOutCounter_Value,
                              source_TelematicDevice_CellularRadio_ACKInCounter_Timestamp,
                              source_TelematicDevice_CellularRadio_ACKInCounter_Unit,
                              source_TelematicDevice_CellularRadio_ACKInCounter_Value,
                              source_TelematicDevice_CellularRadioDOTAIn_Timestamp,
                              source_TelematicDevice_CellularRadioDOTAIn_Unit,
                              source_TelematicDevice_CellularRadioDOTAIn_Value,
                              source_TelematicDevice_OffDuration_Timestamp,
                              source_TelematicDevice_OffDuration_Unit,
                              source_TelematicDevice_OffDuration_Value,
                              source_TelematicDevice_OnDuration_Timestamp,
                              source_TelematicDevice_OnDuration_Unit,
                              source_TelematicDevice_OnDuration_Value,
                              source_TelematicDevice_PowerUpCounter,
                              source_TelematicDevice_ResetCounter,
                              source_TelematicDevice_MainFirmware_Timestamp,
                              source_TelematicDevice_MainFirmware_Version,
                              source_TelematicDevice_OBDFirmware_Timestamp,
                              source_TelematicDevice_OBDFirmware_Version,
                              source_TelematicDevice_DeviceIdentifiers_Timestamp,
                              source_TelematicDevice_DeviceIdentifiers_ScriptConfigurationVersion,
                              source_TelematicDevice_Battery_Connected,
                              source_TelematicDevice_Battery_RiskSeverity,
                              source_TelematicDevice_Battery_Timestamp,
                              source_TelematicDevice_Battery_Unit,
                              source_TelematicDevice_Battery_Value,
                              source_TelematicDevice_ConnectedState_Timestamp,
                              source_TelematicDevice_ConnectedState_Value,
                              source_TelematicDevice_AwakeState_Timestamp,
                              source_TelematicDevice_AwakeState_AwakeReason,
                              source_TelematicDevice_AwakeState_Value,
                              source_TelematicDevice_SimChangeState_Timestamp,
                              source_TelematicDevice_SimChangeState_Value,
                              source_TelematicDevice_PreSleepState_Timestamp,
                              source_TelematicDevice_PreSleepState_Value,
                              source_TelematicDevice_ResetState_Timestamp,
                              source_TelematicDevice_ResetState_Value,
                              source_TelematicDevice_PowerState_Timestamp,
                              source_TelematicDevice_PowerState_Value,
                              source_TelematicDevice_UnitStatus,
                              source_TelematicDevice_InputState,
                              source_DeviceConfiguration_Configurations_Timestamp,
                              source_DeviceConfiguration_Configurations_Name,
                              source_DeviceConfiguration_Configurations_Value,
                              source_DeviceConfiguration_Configurations_Type)) 

# Saves the data frame as "new_car_dt2.RData"
save(new_car_dt2, file="new_car_dt2.RData")

