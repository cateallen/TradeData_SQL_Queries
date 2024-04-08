USE [Workbench 2.0]
SELECT [commodity]
	  ,[year]
	  ,[district]
	  ,[Dist_Name]
	  ,[Destination]
      ,SUM([air_val_yr])
      ,SUM([air_wgt_yr])
      ,SUM([ves_val_yr])
      ,SUM([ves_wgt_yr])
      ,SUM([cnt_val_yr])
      ,SUM([cnt_wgt_yr])
FROM [DOC_HS10_Exports_2010_2017]
  WHERE [year] = '2013'
  OR
  [year] = '2014'
  OR
  [year] = '2015'
  OR
  [year] = '2016'
  OR
  [year] = '2017'
GROUP BY [commodity]
,[year]
,[district]
,[Dist_Name]
,[Destination]