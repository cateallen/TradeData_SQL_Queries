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
FROM [DOC_HS10_Exports_2010_2017] a
LEFT OUTER JOIN [Master_Geo_Mapping] b
on a.Destination = b.Dcty
GROUP BY
      a. [commodity]
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
ORDER BY 
      a.[commodity] ASC