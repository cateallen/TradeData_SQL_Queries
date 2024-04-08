USE [Workbench 2.0]
GO

SELECT [key_row_id]
      ,[Declaration_Date]
      ,[Product_HS]
      ,[Description]
      ,[Country_of_Destination]
      ,[Unit_Type]
      ,[Quantity]
      ,[Unit_Value_FOB__US__]
      ,[FOB_Value__US__]
      ,[Transport_Method]
      ,[Customs_District]
      ,[Exporter_s_City]
      ,[Exporter_s_Location]
      ,[Company_Type]
      ,[Trade_Regime]
      ,[Final_Country_of_Destination]
      ,[Producer_s_City_Province]
      ,[Producer_s_Location]
      ,[Direction]
      ,[Country_of_Origin]
      ,[Origin_Cty_Code]
      ,[Destination_Cty_Code]
      ,[Unit_Value_CIF__US__]
      ,[CIF_Value__US__]
      ,[Consumer_s_City_Province]
      ,[Consumer_s_Location]
      ,[Country_of_Purchase]
      ,[Importer_s_City]
      ,[Importer_s_Location]
      ,b.[Region] [Origin_Region]
      ,[Destination_Region]
INTO [CN_Q1_2018_2]
FROM [dbo].[CN_Q1_2018] a
OUTER APPLY
(
SELECT TOP 1*
FROM [LCS_Cty_Region] b
WHERE a.[Origin_Cty_Code] = b.[Cty]
) B
GO



SELECT [key_row_id]
      ,[Declaration_Date]
      ,[Product_HS]
      ,[Description]
      ,[Country_of_Destination]
      ,[Unit_Type]
      ,[Quantity]
      ,[Unit_Value_FOB__US__]
      ,[FOB_Value__US__]
      ,[Transport_Method]
      ,[Customs_District]
      ,[Exporter_s_City]
      ,[Exporter_s_Location]
      ,[Company_Type]
      ,[Trade_Regime]
      ,[Final_Country_of_Destination]
      ,[Producer_s_City_Province]
      ,[Producer_s_Location]
      ,[Direction]
      ,[Country_of_Origin]
      ,[Origin_Cty_Code]
      ,[Destination_Cty_Code]
      ,[Unit_Value_CIF__US__]
      ,[CIF_Value__US__]
      ,[Consumer_s_City_Province]
      ,[Consumer_s_Location]
      ,[Country_of_Purchase]
      ,[Importer_s_City]
      ,[Importer_s_Location]
      ,[Origin_Region]
      ,b.[Region] [Destination_Region]
INTO [CN_Q1_2018_3]
FROM [CN_Q1_2018_2] a
OUTER APPLY
(
SELECT TOP 1*
FROM [LCS_Cty_Region] b
WHERE a.[Destination_Cty_Code] = b.[Cty]
) B
GO




