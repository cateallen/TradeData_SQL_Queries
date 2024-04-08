USE [Workbench 2.0]

SELECT [Direction]
      ,b.[OReg] [Origin_Region]
      ,[Destination_Region]
      ,[C2C_Lane]
      ,[Origin_Country]
      ,[Destination_Country]
      ,[Origin_Cty_Code]
      ,[Destination_Cty_Code]
      ,[Customs_District]
      ,[Importer_s_City]
      ,[Importer_s_Location]
      ,[Exporter_s_City]
      ,[Exporter_s_Location]
      ,[Transport_Method]
      ,[Declaration_Date]
      ,[Product_HS]
      ,[Description]
      ,[Unit_Type]
      ,[Quantity]
      ,[Unit_Value_FOB__US__]
      ,[FOB_Value__US__]
      ,[Unit_Value_CIF__US__]
      ,[CIF_Value__US__]
      ,[Company_Type]
      ,[Trade_Regime]
INTO [dbo].[CN_17_2]
FROM [dbo].[CN_17] a
OUTER APPLY
(
SELECT TOP 1*
FROM [Master_Geo_Mapping] b
WHERE a.[Origin_Cty_Code] = b.[OCty]
) B