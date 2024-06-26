/****** Script for SelectTopNRows command from SSMS  ******/
USE [CASS]
SELECT [_CASS_COUNTRY_CODE_]
      ,[_CASS_COUNTRY_NAME_]
      ,[_ORIG_CITY_CODE_]
      ,[_DEST_CITY_CODE_]
      ,[_ORIG_STATION_CODE_]
      ,[_ORIG_AIRPORT_NAME_]
      ,[_ORIG_CITY_NAME_]
      ,[_ORIG_STATE_CODE_]
      ,[_DEST_STATION_CODE_]
      ,[_DEST_AIRPORT_NAME_]
      ,[_DEST_CITY_NAME_]
      ,[_DEST_STATE_CODE_]
      ,[_IATA_UPS_CASS_CODE_]
      ,[_CASS_UPS_CASS_CODE_]
      ,[_MARKET_LINEHAUL_USD_WB_]
      ,[_UPS_CASS_LINEHAUL_USD_WB_]
      ,[_MARKET_WGT_WB_]
      ,[_UPS_CASS_WGT_WB_]
      ,[_MARKET_AWB_CNT_WB_]
      ,[_UPS_CASS_AWB_CNT_WB_]
      ,[_MARKET_OTHER_CHGS_USD_WB_]
      ,[_UPS_CASS_OTHER_CHGS_USD_WB_]
      ,[_MARKET_LINEHAUL_USD_WB1_]
      ,[_UPS_CASS_LINEHAUL_USD_WB1_]
      ,[_MARKET_WGT_WB1_]
      ,[_UPS_CASS_WGT_WB1_]
      ,[_MARKET_AWB_CNT_WB1_]
      ,[_UPS_CASS_AWB_CNT_WB1_]
      ,[_MARKET_OTHER_CHGS_USD_WB1_]
      ,[_UPS_CASS_OTHER_CHGS_USD_WB1_]
  FROM [CASS].[dbo].[2017 CASS DATA]
WHERE [_Dest_City_Code_] = 'CHI' 
OR 
[_Dest_City_Code_] = 'HOU'
OR 
[_Dest_City_Code_] = 'DAL'
OR 
[_Dest_City_Code_] = 'DEN'
OR 
[_Dest_City_Code_] = 'IND'
OR 
[_Dest_City_Code_] = 'MSP'
OR 
[_Dest_City_Code_] = 'SDF'
OR
[_Orig_City_Code_] = 'CHI' 
OR 
[_Orig_City_Code_] = 'HOU'
OR 
[_Orig_City_Code_] = 'DAL'
OR 
[_Orig_City_Code_] = 'DEN'
OR 
[_Orig_City_Code_] = 'IND'
OR 
[_Orig_City_Code_] = 'MSP'
OR 
[_Orig_City_Code_] = 'SDF'
OR
[_Orig_Station_Code_] = 'ORD'
OR
[_Orig_Station_Code_] = 'IAH'
OR
[_Orig_Station_Code_] = 'DFW'
OR
[_Orig_Station_Code_] = 'DEN'
OR
[_Orig_Station_Code_] = 'SDF'
OR
[_Orig_Station_Code_] = 'IND'
OR
[_Orig_Station_Code_] = 'MSP'
OR
[_Dest_Station_Code_] = 'ORD'
OR
[_Dest_Station_Code_] = 'IAH'
OR
[_Dest_Station_Code_] = 'DFW'
OR
[_Dest_Station_Code_] = 'DEN'
OR
[_Dest_Station_Code_] = 'SDF'
OR
[_Dest_Station_Code_] = 'IND'
OR
[_Dest_Station_Code_] = 'MSP'

  