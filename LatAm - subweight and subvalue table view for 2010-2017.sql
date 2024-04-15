/* Here I am taking the data from the [LatAm Data Tables] and creating a new table that is the sum for each current year, by unique C2C trade lane, HS6 lane, GCKM, and creating a new column in the new table for each of the years 2010 - 2017 for 'subweight' and 'subvalue' */

USE [LatAm Data Tables]
GO

SELECT [Data_Source]
      ,[HS6_Lane]
      ,[C2C_Lane]
      ,[GCKM]
      ,[HS6]
      ,[D_Cty]
      ,[O_Cty]
      ,[D_Reg]
      ,[O_Reg]
	  ,SUM(CASE WHEN [year] = '2010' THEN subweight ELSE NULL END) AS TW2010
	  ,SUM(CASE WHEN [year] = '2011' THEN subweight ELSE NULL END) AS TW2011
	  ,SUM(CASE WHEN [year] = '2012' THEN subweight ELSE NULL END) AS TW2012
	  ,SUM(CASE WHEN [year] = '2013' THEN subweight ELSE NULL END) AS TW2013
	  ,SUM(CASE WHEN [year] = '2014' THEN subweight ELSE NULL END) AS TW2014
	  ,SUM(CASE WHEN [year] = '2015' THEN subweight ELSE NULL END) AS TW2015
	  ,SUM(CASE WHEN [year] = '2016' THEN subweight ELSE NULL END) AS TW2016
	  ,SUM(CASE WHEN [year] = '2017' THEN subweight ELSE NULL END) AS TW2017
	  ,SUM(CASE WHEN [year] = '2010' THEN Subvalue ELSE NULL END) AS TV2010
	  ,SUM(CASE WHEN [year] = '2011' THEN Subvalue ELSE NULL END) AS TV2011
	  ,SUM(CASE WHEN [year] = '2012' THEN Subvalue ELSE NULL END) AS TV2012
	  ,SUM(CASE WHEN [year] = '2013' THEN Subvalue ELSE NULL END) AS TV2013
	  ,SUM(CASE WHEN [year] = '2014' THEN Subvalue ELSE NULL END) AS TV2014
	  ,SUM(CASE WHEN [year] = '2015' THEN Subvalue ELSE NULL END) AS TV2015
	  ,SUM(CASE WHEN [year] = '2016' THEN Subvalue ELSE NULL END) AS TV2016
	  ,SUM(CASE WHEN [year] = '2017' THEN Subvalue ELSE NULL END) AS TV2017
INSERT INTO 'xxxx'
FROM (
SELECT [Data_Source]
      ,[HS6_Lane]
      ,[C2C_Lane]
      ,[Year] AS [year]
      ,SUM([Netweight (kg)]) AS SubWeight
      ,SUM([Value]) AS SubValue
      ,[GCKM]
      ,[HS6]
      ,[D_Cty]
      ,[O_Cty]
      ,[D_Reg]
      ,[O_Reg]
FROM [dbo].[Latam]
GROUP BY [Data_Source]
      ,[HS6_Lane]
      ,[C2C_Lane]
      ,[Year]
	  ,[GCKM]
      ,[HS6]
      ,[D_Cty]
      ,[O_Cty]
      ,[D_Reg]
      ,[O_Reg]
) sub
GROUP BY [Data_Source]
      ,[HS6_Lane]
      ,[C2C_Lane]
      ,[GCKM]
      ,[HS6]
      ,[D_Cty]
      ,[O_Cty]
      ,[D_Reg]
      ,[O_Reg]
