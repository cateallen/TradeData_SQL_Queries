/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Commodity]
,[country_name]
,[state]
      ,[AV]
      ,[AW]
      ,[VV]
      ,[VW]
      ,[CV]
      ,[CW]
,CASE WHEN AV > 0 THEN 'Value' WHEN CV > 0 THEN 'Value' WHEN VV > 0 THEN 'Value' ELSE 'Weight' END AS Concept2
INTO [Tradecube 3.0 Raw Files].[dbo].[DOC_S2C_HS6_2018_Month_9_Sums_4]
FROM [Tradecube 3.0 Raw Files].[dbo].[DOC_S2C_HS6_2018_Month_9_Sums_3]
