USE [Workbench 2.0]

ALTER TABLE CN_IM17
ADD [Origin_Cty] nvarchar(50)
GO

ALTER TABLE CN_IM17
ADD [Destination_Cty] nvarchar(50)
GO


SELECT [dbo].[CN_IM17]
           ([key_row_id]
           ,[Declaration_Date]
           ,[Product_HS]
           ,[Description]
           ,[Country_of_Origin]
           ,[Unit_Type]
           ,[Quantity]
           ,[Unit_Value_CIF__US__]
           ,[CIF_Value__US__]
           ,[Country_of_Purchase]
           ,[Transport_Method]
           ,[Customs_District]
           ,[Importer_s_City]
           ,[Importer_s_Location]
           ,[Company_Type]
           ,[Trade_Regime]
           ,[Consumer_s_City_Province]
           ,[Consumer_s_Location]
           ,[Direction]
           ,[Country_of_Destination]
		   ,[Origin_Cty]
		   ,[Destination_Cty])
INTO [CN_IM17_2]
FROM 
		 