/* SQL Script Summary: In this SQL Query I am processing trade data related to exports from Argentina, and categorizing it based on different modes of transport and creating summary tables in SQL Server Management Studio for further analysis. */


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
,[Origin_Country]
,[_transport_via_]
,[_HTS_Code_]
      ,[_Net_Weight_Kg___]
      ,[_Total_FOB__US___]
      ,[_Customs_]
	  ,NULL
	  ,NULL
	  ,NULL
	  ,NULL
FROM ArgentinaImportExport.dbo.ArgentinaExports2016
