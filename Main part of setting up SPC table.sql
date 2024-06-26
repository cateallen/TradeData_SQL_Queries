/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [state]
      ,[district]
      ,[port]
      ,[country]
      ,[air_val]
      ,[air_swt]
      ,[stat_year]
  FROM [Tradecube 3.0 Processed Files].[dbo].[STPORTA_2010_2016_Air]



  /******Start Code*******/
 USE [Tradecube 3.0 Processed Files]
 GO


  SELECT  [state]
      ,[district]
      ,[port]
      ,[country]
      ,[air_val] AS [Value]
      ,[stat_year]
INTO [SPC_2010_2016_Air_Value_3]
  FROM [STPORTA_2010_2016_Air]
  WHERE [air_val] > 0


  SELECT  [state]
      ,[district]
      ,[port]
      ,[country]
      ,[air_swt] AS [Weight]
      ,[stat_year]
INTO [SPC_2010_2016_Air_Weight_3]
  FROM [STPORTA_2010_2016_Air]
  WHERE [air_swt] > 0

ALTER TABLE [SPC_2010_2016_Air_Value_3] ADD [Mode] nvarchar(50);
ALTER TABLE [SPC_2010_2016_Air_Weight_3] ADD [Mode] nvarchar(50);

UPDATE [SPC_2010_2016_Air_Value_3] SET [Mode] = 'Air'
UPDATE [SPC_2010_2016_Air_Weight_3] SET [Mode] = 'Air'

ALTER TABLE [SPC_2010_2016_Air_Value_3] ADD [V2010] float;
ALTER TABLE [SPC_2010_2016_Air_Value_3] ADD [V2011] float;
ALTER TABLE [SPC_2010_2016_Air_Value_3] ADD [V2012] float;
ALTER TABLE [SPC_2010_2016_Air_Value_3] ADD [V2013] float;
ALTER TABLE [SPC_2010_2016_Air_Value_3] ADD [V2014] float;
ALTER TABLE [SPC_2010_2016_Air_Value_3] ADD [V2015] float;
ALTER TABLE [SPC_2010_2016_Air_Value_3] ADD [V2016] float;

ALTER TABLE [SPC_2010_2016_Air_Weight_3] ADD [W2010] float;
ALTER TABLE [SPC_2010_2016_Air_Weight_3] ADD [W2011] float;
ALTER TABLE [SPC_2010_2016_Air_Weight_3] ADD [W2012] float;
ALTER TABLE [SPC_2010_2016_Air_Weight_3] ADD [W2013] float;
ALTER TABLE [SPC_2010_2016_Air_Weight_3] ADD [W2014] float;
ALTER TABLE [SPC_2010_2016_Air_Weight_3] ADD [W2015] float;
ALTER TABLE [SPC_2010_2016_Air_Weight_3] ADD [W2016] float;





UPDATE [SPC_2010_2016_Air_Value_3]
SET [V2010] =
CASE WHEN [Stat_year] = '2010
'
then [Value]
ELSE '0'
end

UPDATE [SPC_2010_2016_Air_Value_3]
SET [V2011] =
CASE WHEN [Stat_year] = '2011'
then [Value]
ELSE '0'
end

UPDATE [SPC_2010_2016_Air_Value_3]
SET [V2012] =
CASE WHEN [Stat_year] = '2012'
then [Value]
ELSE '0'
end

UPDATE [SPC_2010_2016_Air_Value_3]
SET [V2013] =
CASE WHEN [Stat_year] = '2013'
then [Value]
ELSE '0'
end

UPDATE [SPC_2010_2016_Air_Value_3]
SET [V2014] =
CASE WHEN [Stat_year] = '2014'
then [Value]
ELSE '0'
end

UPDATE [SPC_2010_2016_Air_Value_3]
SET [V2015] =
CASE WHEN [Stat_year] = '2015'
then [Value]
ELSE '0'
end

UPDATE [SPC_2010_2016_Air_Value_3]
SET [V2016] =
CASE WHEN [Stat_year] = '2016'
then [Value]
ELSE '0'
end





UPDATE [SPC_2010_2016_Air_Weight_3]
SET [W2010] =
CASE WHEN [Stat_year] = '2010
'
then [Weight]
ELSE '0'
end

UPDATE [SPC_2010_2016_Air_Weight_3]
SET [W2011] =
CASE WHEN [Stat_year] = '2011'
then [Weight]
ELSE '0'
end

UPDATE [SPC_2010_2016_Air_Weight_3]
SET [W2012] =
CASE WHEN [Stat_year] = '2012'
then [Weight]
ELSE '0'
end

UPDATE [SPC_2010_2016_Air_Weight_3]
SET [W2013] =
CASE WHEN [Stat_year] = '2013'
then [Weight]
ELSE '0'
end

UPDATE [SPC_2010_2016_Air_Weight_3]
SET [W2014] =
CASE WHEN [Stat_year] = '2014'
then [Weight]
ELSE '0'
end

UPDATE [SPC_2010_2016_Air_Weight_3]
SET [W2015] =
CASE WHEN [Stat_year] = '2015'
then [Weight]
ELSE '0'
end

UPDATE [SPC_2010_2016_Air_Weight_3]
SET [W2016] =
CASE WHEN [Stat_year] = '2016'
then [Weight]
ELSE '0'
end



