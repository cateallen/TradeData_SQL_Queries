

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
SELECT [Country of Destination]
      ,[_Country_of_Origin_]
      ,[_Transport_Method_]
      ,[_Product_HS_]
      ,[_Gross_Weight_]
      ,[_FOB_Value__US___]
	  ,[_Customs_City_]
	  ,[_Port_of_Shipment_]
	  ,NULL
	  ,NULL
	  ,NULL
FROM EcuadorImportExport.dbo.EcuadorIE2017
