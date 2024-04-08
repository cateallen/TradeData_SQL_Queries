
INSERT INTO Datamyne.dbo.LatamEXIM
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
,[Transport method]
,[HS6]
,[Weight]
,[Value]
,[City]
,NULL
,NULL
,NULL
,NULL
FROM MexicoExportImport.dbo.MexicoImportsExports2017
