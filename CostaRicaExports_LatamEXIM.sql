
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
SELECT [Column6]
,[O_Cty]
,[Column7]
,[Column9]
,[Column13]
,[Column16]
,NULL
,[Column8]
,NULL
,NULL
,NULL
FROM [CostaRicaExportImport].dbo.CostaRicaExports2017