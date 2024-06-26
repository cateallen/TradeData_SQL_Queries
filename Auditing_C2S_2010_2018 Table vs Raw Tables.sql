/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [LANE]
      ,SUM([air_swt_yr]+[ves_swt_yr]+[cnt_swt_yr]+[bulk_swt_yr]) AS [WeightSum]
  FROM [Tradecube 3.0 Raw Files].[dbo].[DOC_C2S-HS6-M_US_2016A]
  WHERE [month] = '12' AND [Lane] = 'EE_CA'
  GROUP BY [Lane]