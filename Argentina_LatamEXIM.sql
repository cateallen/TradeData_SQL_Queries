
INSERT INTO Dataymne.[dbo].[LatAmEXIM]
           ([D_Cty]
           ,[O_Cty]
           ,[Transport Method]
           ,[HS6]
           ,[Weight]
           ,[Value]
           ,[Importer_Customs]
           ,[Exporter_Customs]
           ,[HS6_code]
           ,[Org_Cty]
           ,[Des_Cty])
SELECT [D_Cty]
           ,[O_Cty]
           ,[Transport_Method]
           ,[HS6_code]
		   ,[Weight]
           ,[Trade_Value]
		   ,[Importer_Customs]
           ,[Exporter_Customs]
		   ,NULL
		   ,NULL
		   ,NULL
FROM ArgentinaImportExport.dbo.ArgentinaEXIM3

