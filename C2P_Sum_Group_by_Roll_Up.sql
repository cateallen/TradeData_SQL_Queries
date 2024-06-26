/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Mode]
      ,[cty_code]
      ,[port_code]
      ,SUM([V2010]) AS [V2010]
      ,SUM([V2011])AS [V2011]
      ,SUM([V2012])AS [V2012]
      ,SUM([V2013])AS [V2013]
      ,SUM([V2014])AS [V2014]
      ,SUM([V2015])AS [V2015]
      ,SUM([V2016])AS [V2016]
      ,SUM([V2017])AS [V2017]
      ,SUM([V2018])AS [V2018]
      ,SUM([W2010])AS [W2010]
      ,SUM([W2011])AS [W2011]
      ,SUM([W2012])AS [W2012]
      ,SUM([W2013])AS [W2013]
      ,SUM([W2014])AS [W2014]
      ,SUM([W2015])AS [W2015]
      ,SUM([W2016])AS [W2016]
      ,SUM([W2017])AS [W2017]
      ,SUM([W2018])AS [W2018]
  FROM [Tradecube 3.0 Processed Files].[dbo].[DOC_C2P_2010_2017_Value_Weight_Rolled_Up]
  GROUP BY [Mode]
      ,[cty_code]
      ,[port_code]