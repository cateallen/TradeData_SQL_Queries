

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
SELECT [_Country_of_Destination_]
      ,[O_Cty]
      ,[_Transport_method_]
      ,[_Product_HS_]
      ,[_Gross_weight_Clearance_Total__]
      ,[_FOB_Value_US__]
	  ,NULL
      ,[_Shipping_Port_]
	  ,NULL
	  ,NULL
	  ,NULL
FROM ChileImportExport.dbo.ChileExports2017