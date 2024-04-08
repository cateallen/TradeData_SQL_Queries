


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
      ,[Country_of_origin]
      ,[Transport_method]
      ,[Product_HS]	  
      ,[Gross_weight]
      ,[FOB_value]
      ,[Delivery_port]
	  ,NULL
	  ,NULL
	  ,NULL
	  ,NULL
FROM ChileImportExport.dbo.ChileImports2017
