

INSERT INTO Datamyne.dbo.LatAmEXIM
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
      ,[Transport Method]
      ,[HS6]
      ,[Weight]
      ,[Value]
      ,NULL
	  ,NULL
	  ,NULL
	  ,NULL
	  ,NULL
FROM BoliviaImportExport.dbo.BoliviaEXIM