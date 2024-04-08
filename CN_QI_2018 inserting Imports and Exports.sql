USE [Workbench 2.0]
GO

INSERT INTO [dbo].[CN_Q1_2018]
           ([key_row_id]
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
           ,[Importer_s_Location])
     VALUES
           (<key_row_id, nvarchar(max),>
           ,<Declaration_Date, int,>
           ,<Product_HS, int,>
           ,<Description, nvarchar(max),>
           ,<Country_of_Destination, nvarchar(max),>
           ,<Unit_Type, nvarchar(max),>
           ,<Quantity, float,>
           ,<Unit_Value_FOB__US__, float,>
           ,<FOB_Value__US__, float,>
           ,<Transport_Method, nvarchar(max),>
           ,<Customs_District, nvarchar(max),>
           ,<Exporter_s_City, nvarchar(max),>
           ,<Exporter_s_Location, nvarchar(max),>
           ,<Company_Type, nvarchar(max),>
           ,<Trade_Regime, nvarchar(max),>
           ,<Final_Country_of_Destination, nvarchar(max),>
           ,<Producer_s_City_Province, nvarchar(max),>
           ,<Producer_s_Location, nvarchar(max),>
           ,<Direction, nvarchar(50),>
           ,<Country_of_Origin, nvarchar(50),>
           ,<Origin_Cty_Code, nvarchar(50),>
           ,<Destination_Cty_Code, nvarchar(50),>
           ,<Unit_Value_CIF__US__, float,>
           ,<CIF_Value__US__, float,>
           ,<Consumer_s_City_Province, nvarchar(max),>
           ,<Consumer_s_Location, nvarchar(max),>
           ,<Country_of_Purchase, nvarchar(max),>
           ,<Importer_s_City, nvarchar(max),>
           ,<Importer_s_Location, nvarchar(max),>)
GO


