USE [Tradecube 3.0 Processed Files]
GO

/******Value***********/

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[air_val_yr] AS [Value]
INTO [DOC_C2P_2010_2017_Air_Value]
FROM [DOC_C2P_2010-2017A] 
WHERE [Air_Val_yr] > 0


SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]     
 ,[ves_val_yr] AS [Value]
INTO [DOC_C2P_2010_2017_Vessel_Value]
FROM [DOC_C2P_2010-2017A] 
WHERE [ves_val_yr] > 0

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[cnt_val_yr] AS [Value]
INTO [DOC_C2P_2010_2017_Container_Value]
FROM [DOC_C2P_2010-2017A] 
WHERE [cnt_val_yr] > 0

/*****Weight*********/

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[air_swt_yr] AS [Weight]
INTO [DOC_C2P_2010_2017_Air_Weight]
FROM [DOC_C2P_2010-2017A] 
WHERE [Air_swt_yr] > 0


SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[ves_swt_yr] AS [Weight]
INTO [DOC_C2P_2010_2017_Vessel_Weight]
FROM [DOC_C2P_2010-2017A] 
WHERE [ves_swt_yr] > 0

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[cnt_swt_yr] AS [Weight]
INTO [DOC_C2P_2010_2017_Container_Weight]
FROM [DOC_C2P_2010-2017A] 
WHERE [cnt_swt_yr] > 0

/***Add mode column to each of the weight tables***/
ALTER TABLE [DOC_C2P_2010_2017_Air_Weight] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_C2P_2010_2017_Vessel_Weight] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_C2P_2010_2017_Container_Weight] ADD [Mode] nvarchar(50);


/**Fill in mode column to the weight tables**/
UPDATE [DOC_C2P_2010_2017_Air_Weight] SET [Mode] = 'Air';
UPDATE [DOC_C2P_2010_2017_Container_Weight] SET [Mode] = 'Container';
UPDATE [DOC_C2P_2010_2017_Vessel_Weight] SET [Mode] = 'Vessel';


/***Union all the weight modes together**/
SELECT * INTO [DOC_C2P_2010_2017_AW_CW_VW] FROM
(
SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[Weight]
FROM [DOC_C2P_2010_2017_Air_Weight]

UNION

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[Weight]
FROM [DOC_C2P_2010_2017_Container_Weight]

UNION

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[Weight]
FROM [DOC_C2P_2010_2017_Vessel_Weight]
) UnionedTables

/**Add 201N weight columns**/
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW] ADD [W2010] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW] ADD [W2011] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW] ADD [W2012] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW] ADD [W2013] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW] ADD [W2014] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW] ADD [W2015] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW] ADD [W2016] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW] ADD [W2017] float;

/**Fill in 201N weight columns**/
UPDATE [DOC_C2P_2010_2017_AW_CW_VW]
SET [W2010] =
CASE WHEN [Year] = '2010'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW]
SET [W2011] =
CASE WHEN [Year] = '2011'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW]
SET [W2012] =
CASE WHEN [Year] = '2012'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW]
SET [W2013] =
CASE WHEN [Year] = '2013'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW]
SET [W2014] =
CASE WHEN [Year] = '2014'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW]
SET [W2015] =
CASE WHEN [Year] = '2015'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW]
SET [W2016] =
CASE WHEN [Year] = '2016'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW]
SET [W2017] =
CASE WHEN [Year] = '2017'
then [Weight]
ELSE '0'
end

/**Select into new table**/

SELECT * 
INTO [DOC_C2P_2010_2017_AW_CW_VW.V2]
FROM [DOC_C2P_2010_2017_AW_CW_VW]
WHERE [year] >= '2010'


/***START OF SAME PROCESS FOR VALUE**/
/**********************************************************************************************/

/***Add mode column to each of the value tables***/
ALTER TABLE [DOC_C2P_2010_2017_Air_Value] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_C2P_2010_2017_Vessel_Value] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_C2P_2010_2017_Container_Value] ADD [Mode] nvarchar(50);


/**Fill in mode column to the value tables**/
UPDATE [DOC_C2P_2010_2017_Air_Value] SET [Mode] = 'Air';
UPDATE [DOC_C2P_2010_2017_Container_Value] SET [Mode] = 'Container';
UPDATE [DOC_C2P_2010_2017_Vessel_Value] SET [Mode] = 'Vessel';


/***Union all the value modes together**/
SELECT * INTO [DOC_C2P_2010_2017_AV_CV_VV] FROM 
(
SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[value]
FROM [DOC_C2P_2010_2017_Air_Value]

UNION

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[value]
FROM [DOC_C2P_2010_2017_Container_Value]

UNION

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[value]
FROM [DOC_C2P_2010_2017_Vessel_Value]
) UnionedTables

/**Add 201N weight columns**/
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV] ADD [V2010] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV] ADD [V2011] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV] ADD [V2012] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV] ADD [V2013] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV] ADD [V2014] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV] ADD [V2015] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV] ADD [V2016] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV] ADD [V2017] float;

/**Fill in 201N weight columns**/
UPDATE [DOC_C2P_2010_2017_AV_CV_VV]
SET [V2010] =
CASE WHEN [Year] = '2010'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV]
SET [V2011] =
CASE WHEN [Year] = '2011'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV]
SET [V2012] =
CASE WHEN [Year] = '2012'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV]
SET [V2013] =
CASE WHEN [Year] = '2013'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV]
SET [V2014] =
CASE WHEN [Year] = '2014'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV]
SET [V2015] =
CASE WHEN [Year] = '2015'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV]
SET [V2016] =
CASE WHEN [Year] = '2016'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV]
SET [V2017] =
CASE WHEN [Year] = '2017'
then [Value]
ELSE '0'
end

/**Select into new table**/

SELECT * 
INTO [DOC_C2P_2010_2017_AV_CV_VV.V2]
FROM [DOC_C2P_2010_2017_AV_CV_VV]
WHERE [year] >= '2010'

