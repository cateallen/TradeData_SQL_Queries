/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [P2C_Lane]
      ,SUM([W2010]) AS [W2010]
      ,SUM([W2011]) AS [W2011]
      ,SUM([W2012]) AS [W2012]
      ,SUM([W2013]) AS [W2013]
      ,SUM([W2014]) AS [W2014]
      ,SUM([W2015]) AS [W2015]
      ,SUM([W2016]) AS [W2016]
      ,SUM([W2017]) AS [W2017]
      ,SUM([W2018]) AS [W2018]
  FROM [Tradecube 3.0 Processed Files].[dbo].[DOC_P2C_2010_2018_VW_4-5_Updated]
  GROUP BY [P2C_Lane]