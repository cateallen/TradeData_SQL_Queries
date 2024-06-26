/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Pax]
      ,[_FREIGHT_]
      ,[_MAIL_]
      ,[_DISTANCE_]
      ,[Carrier_code]
      ,[O_Apt]
      ,[_ORIGIN_CITY_NAME_]
      ,[_ORIGIN_STATE_ABR_]
      ,[_ORIGIN_STATE_FIPS_]
      ,[O_Cty]
      ,[D_Apt]
      ,[_DEST_CITY_NAME_]
      ,[_DEST_STATE_ABR_]
      ,[_DEST_STATE_FIPS_]
      ,[D_Cty]
      ,[Year]
      ,[Month]
      ,[GCKM]
      ,b.[Region] [O_Reg]
      ,c.[Region] [D_Reg]
INTO [US_T-100_Market_2010-2018].[dbo].[T-100_market_2010-2018_processed_file_V2]
  FROM [US_T-100_Market_2010-2018].[dbo].[T-100_market_2010-2018_processed_file] a
OUTER APPLY 
(
SELECT TOP 1*
FROM [US_T-100_Market_2010-2018].[dbo].[T-100_geomap] b
WHERE a.[O_Cty] = b.[Country]
) B
OUTER APPLY
(
SELECT TOP 1*
FROM [US_T-100_Market_2010-2018].[dbo].[T-100_geomap] c
WHERE a.[D_Cty] = c.[Country]
) C