
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
,[Column6]
,[Column9]
,[column11]
,[Column15]
,[Column18]
,[Column10]
,NULL
,NULL
,NULL
,NULL
FROM CostaRicaExportImport.dbo.CostaImports2017