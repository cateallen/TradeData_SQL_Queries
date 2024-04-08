USE [Workbench 2.0]
GO

SELECT a. [commodity]
      ,a. [cty_code]
      ,a. [district]
      ,a. [year]
      ,a. [air_val_yr]
      ,a. [air_wgt_yr]
      ,a. [ves_val_yr]
      ,a. [ves_wgt_yr]
      ,a. [cnt_val_yr]
      ,a. [cnt_wgt_yr]
      ,a. [Dist_Name]
      ,a. [Destination]
	  ,b. [Dreg]
INTO NewTable2
FROM [DOC_HS10_Exports_2010_2017] a
OUTER APPLY
(
SELECT TOP 1 *
FROM [Master_Geo_Mapping] b
WHERE a.Destination = b.Dcty
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

