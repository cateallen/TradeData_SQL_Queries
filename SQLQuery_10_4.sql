/****** Script for SelectTopNRows command from SSMS  ******/
SELECT Direction]
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
      ,[O_Mkt]
      ,[D_Mkt]
      ,[QTY1]
      ,[QTY13]
      ,[QTY14]
      ,[QTY15]
      ,[QTY16]
      ,[QTY17]
      ,[Cty_code]
      ,[Dirstrict]
	  ,SUM(CASE WHEN [year] = '2013' THEN subairweight ELSE NULL END) AS AW2013
	  ,SUM(CASE WHEN [year] = '2014' THEN subairweight ELSE NULL END) AS AW2014
	  ,SUM(CASE WHEN [year] = '2015' THEN subairweight ELSE NULL END) AS AW2015
	  ,SUM(CASE WHEN [year] = '2016' THEN subairweight ELSE NULL END) AS AW2016
	  ,SUM(CASE WHEN [year] = '2017' THEN subairweight ELSE NULL END) AS AW2017
	  ,SUM(CASE WHEN [year] = '2013' THEN subairvalue ELSE NULL END) AS AV2013
	  ,SUM(CASE WHEN [year] = 
      ,[Air_value]
      ,[Cnt_value]
      ,[Cnt_weight]
      ,[Ves_weight]
      ,[Ves_vaule]
INSERT INTO DOCSEXPORTSNEW
 FROM ([Direction]
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
      ,[O_Mkt]
      ,[D_Mkt]
      ,[QTY1]
      ,[QTY13]
      ,[QTY14]
      ,[QTY15]
      ,[QTY16]
      ,[QTY17]
      ,[Cty_code]
      ,[Dirstrict]
	  ,SUM([Air_Weight]) AS subairweight
	  ,SUM([ 

 [Workbench 2.0].[dbo].[DOC_HS10_Imports_Exports_Imports_Together]