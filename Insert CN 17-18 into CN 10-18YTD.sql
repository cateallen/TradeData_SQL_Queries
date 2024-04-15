USE [Workbench 2.0]
GO

INSERT INTO [dbo].[CN_10_18YTD]
           ([Direction]
           ,[Declaration Date]
           ,[Product HS]
           ,[Description]
           ,[Country of Origin]
           ,[Country of Destination]
           ,[Unit Type]
           ,[Quantity]
           ,[Unit Value FOB (US$)]
           ,[FOB Value (US$)]
           ,[Unit Value CIF (US$)]
           ,[CIF Value (US$)]
           ,[Transport Method]
           ,[Customs District]
           ,[Importer�s City]
           ,[Importer�s Location]
           ,[Exporter�s City]
           ,[Exporter�s Location]
           ,[Company Type]
           ,[Trade Regime]
           ,[Final Country of Destination]
           ,[Producer�s City Province]
           ,[Producer�s Location]
           ,[Destination]
           ,[Origin]
           ,[Weight (kg)]
           ,[Unit Value]
           ,[Harmonized Transport Method]
           ,[corrected Unit Value]
           ,[corrected weight]
           ,[UPS Region]
           ,[Origin Region]
           ,[Destination Region]
           ,[C2C_Lane])
SELECT [Direction]
      ,[Declaration_Date]
      ,[Product_HS]
      ,[Description]
      ,[Origin_Country]
      ,[Destination_Country]
      ,[Unit_Type]
      ,[Quantity]
      ,[Unit_Value_FOB__US__]
      ,[FOB_Value__US__]
      ,[Unit_Value_CIF__US__]
      ,[CIF_Value__US__]
      ,[Transport_Method]
      ,[Customs_District]
      ,[Importer_s_City]
      ,[Importer_s_Location]
      ,[Exporter_s_City]
      ,[Exporter_s_Location]
      ,[Company_Type]
      ,[Trade_Regime]
,NULL
,NULL
,NULL
      ,[Origin_Cty_Code]
      ,[Destination_Cty_Code]
,NULL
,NULL
,NULL
,NULL
,NULL
,NULL
      ,[Origin_Region]
      ,[Destination_Region]
      ,[C2C_Lane]
  FROM [dbo].[CN_17_18]
GO