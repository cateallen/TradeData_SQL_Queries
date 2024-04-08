USE [Datamyne]

SELECT [D_Cty]
      ,[O_Cty]
      ,[Transport Method]
      ,[Weight]
      ,[Value]
      ,[Importer_Customs]
      ,[Exporter_Customs]
      ,[HS6_code]
      ,b.Cty_code [Org_Cty]
      ,c.Cty_code [Des_Cty]
	  ,[Transport_Mode]
INTO [LatamEXIM111]
FROM [LatamEXIM2] a
LEFT OUTER JOIN [Latin_datamyne_geomapping_CA] b
on a.[O_Cty] = b.[Cty_name]
LEFT OUTER JOIN [Latin_datamyne_geomapping_CA] c
on a.[D_Cty] = c.[Cty_name]


