/****** Script for SelectTopNRows command from SSMS  ******/
USE [Workbench 2.0]
GO

SELECT [commodity]
      ,[cty_code]
      ,[dist_entry]
      ,[dist_unlad]
      ,[year]
      ,[air_val_yr]
      ,[air_wgt_yr]
      ,[ves_val_yr]
      ,[ves_wgt_yr]
      ,[cnt_val_yr]
      ,[cnt_wgt_yr]
      ,[Dist_Entry_Name]
      ,[Dist_Unlad_Name]
      ,[Origin]
      ,b.[OReg]
  FROM [Workbench 2.0].[dbo].[DOC_HS10_Imports_2010_2017] a
  OUTER APPLY
  (
  SELECT TOP 1*
  FROM [Master_Geo_Mapping] b
  WHERE a.Origin = b.Dcty
  ) B
WHERE a.[year] = '2013'
OR
a.[year] = '2014'
OR
a.[year] = '2015'
OR
a.[year] = '2016'
OR
a.[year] = '2017'
  ORDER BY
  a.commodity ASC