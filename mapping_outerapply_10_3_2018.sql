/****** Script for SelectTopNRows command from SSMS  ******/
USE [Workbench 2.0]
GO

SELECT [Direction]
      ,[OrgReg]
      ,[DesReg]
      ,[OrgCty]
      ,[DesCty]
      ,[O_City_name]
      ,[O_Cty]
      ,[D_City_name]
      ,[D_City]
      ,[Commodity4]
      ,[Commodity6]
      ,[Commodity10]
	  ,b.[D Centroid] [O_Mkt]
	  ,[D_Mkt]
      ,[QTY1]
      ,[QTY13]
      ,[QTY14]
      ,[QTY15]
      ,[QTY16]
      ,[QTY17]
      ,[Cty_code]
      ,[Dirstrict]
      ,[Year]
      ,[Air_Weight]
      ,[Air_value]
      ,[Cnt_value]
      ,[Cnt_weight]
      ,[Ves_weight]
      ,[Ves_vaule]
INTO DOC_HS10_Imports_Exports_Imports1
  FROM [dbo].[DOC_HS10_Imports_Exports_8] a
  OUTER APPLY
  (
  SELECT TOP 1*
  FROM [Master_Geo_Mapping] b
  WHERE a.[DesCty] = b.[Dcty]
  ) B