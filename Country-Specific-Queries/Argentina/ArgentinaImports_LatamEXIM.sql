
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
SELECT [_Destination_Country_]
,[_Country_of_Origin_]
      ,[_Transport_Method_]
      ,[_Product_HS_]
      ,[_Net_Weight__Kg___]
      ,[_Calculated_FOB_Value__US___]
      ,[_Customs_City_]
	  ,NULL
	  ,NULL
	  ,NULL
	  ,NULL
FROM ArgentinaImportExport.dbo.ArgentinaImports2016


