USE [Tradecube 3.0 Processed Files]
GO
/******Value***********/

SELECT [HS6_P2C_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[year]
      ,[air_val_yr] AS [Value]
INTO [DOC_P2C_2010_2017_Air_Value_12]
FROM [DOC_P2C_2010-2017A] 
WHERE [Air_Val_yr] > 0


SELECT [HS6_P2C_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[year]
 ,[ves_val_yr] AS [Value]
INTO [DOC_P2C_2010_2017_Vessel_Value_12]
FROM [DOC_P2C_2010-2017A] 
WHERE [ves_val_yr] > 0

SELECT [HS6_P2C_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[year]
      ,[cnt_val_yr] AS [Value]
INTO [DOC_P2C_2010_2017_Container_Value_12]
FROM [DOC_P2C_2010-2017A] 
WHERE [cnt_val_yr] > 0

/*****Weight*********/

SELECT [HS6_P2C_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[year]
      ,[air_swt_yr] AS [Weight]
INTO [DOC_P2C_2010_2017_Air_Weight_12]
FROM [DOC_P2C_2010-2017A] 
WHERE [Air_swt_yr] > 0


SELECT [HS6_P2C_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[year]
      ,[ves_swt_yr] AS [Weight]
INTO [DOC_P2C_2010_2017_Vessel_Weight_12]
FROM [DOC_P2C_2010-2017A] 
WHERE [ves_swt_yr] > 0

SELECT [HS6_P2C_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[year]
      ,[cnt_swt_yr] AS [Weight]
INTO [DOC_P2C_2010_2017_Container_Weight_12]
FROM [DOC_P2C_2010-2017A] 
WHERE [cnt_swt_yr] > 0


/***Add mode column to each of the weight tables***/
ALTER TABLE [DOC_P2C_2010_2017_Air_Weight_12] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_P2C_2010_2017_Vessel_Weight_12] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_P2C_2010_2017_Container_Weight_12] ADD [Mode] nvarchar(50);

/**Fill in mode column to the weight tables**/
UPDATE [DOC_P2C_2010_2017_Air_Weight_12] SET [Mode] = 'Air';
UPDATE [DOC_P2C_2010_2017_Container_Weight_12] SET [Mode] = 'Container';
UPDATE [DOC_P2C_2010_2017_Vessel_Weight_12] SET [Mode] = 'Vessel';

/***Union all the weight modes together**/
SELECT * INTO [DOC_P2C_2010_2017_AW_CW_VW_12] FROM
(
SELECT [HS6_P2C_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[year]
      ,[Weight]
,[Mode]
FROM [DOC_P2C_2010_2017_Air_Weight_12]

UNION

SELECT [HS6_P2C_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[year]
      ,[Weight]
,[Mode]
FROM [DOC_P2C_2010_2017_Container_Weight_12]

UNION

SELECT [HS6_P2C_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[year]
      ,[Weight]
,[Mode]
FROM [DOC_P2C_2010_2017_Vessel_Weight_12]
) UnionedTables

/**Add 201N weight columns**/
ALTER TABLE [DOC_P2C_2010_2017_AW_CW_VW_12] ADD [W2010] float;
ALTER TABLE [DOC_P2C_2010_2017_AW_CW_VW_12] ADD [W2011] float;
ALTER TABLE [DOC_P2C_2010_2017_AW_CW_VW_12] ADD [W2012] float;
ALTER TABLE [DOC_P2C_2010_2017_AW_CW_VW_12] ADD [W2013] float;
ALTER TABLE [DOC_P2C_2010_2017_AW_CW_VW_12] ADD [W2014] float;
ALTER TABLE [DOC_P2C_2010_2017_AW_CW_VW_12] ADD [W2015] float;
ALTER TABLE [DOC_P2C_2010_2017_AW_CW_VW_12] ADD [W2016] float;
ALTER TABLE [DOC_P2C_2010_2017_AW_CW_VW_12] ADD [W2017] float;

/**Fill in 201N weight columns**/
UPDATE [DOC_P2C_2010_2017_AW_CW_VW_12]
SET [W2010] =
CASE WHEN [Year] = '2010'
then [Weight]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AW_CW_VW_12]
SET [W2011] =
CASE WHEN [Year] = '2011'
then [Weight]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AW_CW_VW_12]
SET [W2012] =
CASE WHEN [Year] = '2012'
then [Weight]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AW_CW_VW_12]
SET [W2013] =
CASE WHEN [Year] = '2013'
then [Weight]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AW_CW_VW_12]
SET [W2014] =
CASE WHEN [Year] = '2014'
then [Weight]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AW_CW_VW_12]
SET [W2015] =
CASE WHEN [Year] = '2015'
then [Weight]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AW_CW_VW_12]
SET [W2016] =
CASE WHEN [Year] = '2016'
then [Weight]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AW_CW_VW_12]
SET [W2017] =
CASE WHEN [Year] = '2017'
then [Weight]
ELSE '0'
end

/**Select into new table**/

SELECT * 
INTO [DOC_P2C_2010_2017_AW_CW_VW.V11]
FROM [DOC_P2C_2010_2017_AW_CW_VW_12]
WHERE [year] >= '2010'

/***Add mode column to each of the value tables***/
ALTER TABLE [DOC_P2C_2010_2017_Air_Value_12] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_P2C_2010_2017_Vessel_Value_12] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_P2C_2010_2017_Container_Value_12] ADD [Mode] nvarchar(50);


/**Fill in mode column to the value tables**/
UPDATE [DOC_P2C_2010_2017_Air_Value_12] SET [Mode] = 'Air';
UPDATE [DOC_P2C_2010_2017_Container_Value_12] SET [Mode] = 'Container';
UPDATE [DOC_P2C_2010_2017_Vessel_Value_12] SET [Mode] = 'Vessel';


/***Union all the value modes together**/
SELECT * INTO [DOC_P2C_2010_2017_AV_CV_VV_12] FROM 
(
SELECT [HS6_P2C_Lane]
     ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[year]
      ,[value]
,[Mode]
FROM [DOC_P2C_2010_2017_Air_Value_12]

UNION

SELECT [HS6_P2C_Lane]
     ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[year]
      ,[value]
,[Mode]
FROM [DOC_P2C_2010_2017_Container_Value_12]

UNION

SELECT [HS6_P2C_Lane]
     ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[year]
      ,[value]
,[Mode]
FROM [DOC_P2C_2010_2017_Vessel_Value_12]
) UnionedTables

/**Add 201N weight columns**/
ALTER TABLE [DOC_P2C_2010_2017_AV_CV_VV_12] ADD [V2010] float;
ALTER TABLE [DOC_P2C_2010_2017_AV_CV_VV_12] ADD [V2011] float;
ALTER TABLE [DOC_P2C_2010_2017_AV_CV_VV_12] ADD [V2012] float;
ALTER TABLE [DOC_P2C_2010_2017_AV_CV_VV_12] ADD [V2013] float;
ALTER TABLE [DOC_P2C_2010_2017_AV_CV_VV_12] ADD [V2014] float;
ALTER TABLE [DOC_P2C_2010_2017_AV_CV_VV_12] ADD [V2015] float;
ALTER TABLE [DOC_P2C_2010_2017_AV_CV_VV_12] ADD [V2016] float;
ALTER TABLE [DOC_P2C_2010_2017_AV_CV_VV_12] ADD [V2017] float;

/**Fill in 201N weight columns**/
UPDATE [DOC_P2C_2010_2017_AV_CV_VV_12]
SET [V2010] =
CASE WHEN [Year] = '2010'
then [Value]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AV_CV_VV_12]
SET [V2011] =
CASE WHEN [Year] = '2011'
then [Value]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AV_CV_VV_12]
SET [V2012] =
CASE WHEN [Year] = '2012'
then [Value]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AV_CV_VV_12]
SET [V2013] =
CASE WHEN [Year] = '2013'
then [Value]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AV_CV_VV_12]
SET [V2014] =
CASE WHEN [Year] = '2014'
then [Value]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AV_CV_VV_12]
SET [V2015] =
CASE WHEN [Year] = '2015'
then [Value]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AV_CV_VV_12]
SET [V2016] =
CASE WHEN [Year] = '2016'
then [Value]
ELSE '0'
end

UPDATE [DOC_P2C_2010_2017_AV_CV_VV_12]
SET [V2017] =
CASE WHEN [Year] = '2017'
then [Value]
ELSE '0'
end

/**Select into new table**/

SELECT * 
INTO [DOC_P2C_2010_2017_AV_CV_VV.V12]
FROM [DOC_P2C_2010_2017_AV_CV_VV_12]
WHERE [year] >= '2010'



/****** Object:  Table [dbo].[DOC_P2C_2010_2017_AV_CV_VV.V2]    Script Date: 3/28/2019 4:05:30 PM ******/
USE [Tradecube 3.0 Processed Files]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DOC_P2C_2010_2017_Value_Weight_12](
	[Mode] [nvarchar] (100) NULL,
	[HS6_P2C_Lane] [nvarchar](100) NULL,
	[commodity] [nvarchar](6) NULL,
	[cty_code] [nvarchar](4) NULL,
	[port_code] [nvarchar](4) NULL,
	[V2010] [float] NULL,
	[V2011] [float] NULL,
	[V2012] [float] NULL,
	[V2013] [float] NULL,
	[V2014] [float] NULL,
	[V2015] [float] NULL,
	[V2016] [float] NULL,
	[V2017] [float] NULL,
	[V2018] [float] NULL,
	[W2010] [float] NULL,
	[W2011] [float] NULL,
	[W2012] [float] NULL,
	[W2013] [float] NULL,
	[W2014] [float] NULL,
	[W2015] [float] NULL,
	[W2016] [float] NULL,
	[W2017] [float] NULL,
	[W2018] [float] NULL,
) ON [PRIMARY]
GO


INSERT INTO [dbo].[DOC_P2C_2010_2017_Value_Weight_12](
	[Mode],
	[HS6_P2C_Lane],
	[commodity],
	[cty_code],
	[port_code],
	[V2010],
	[V2011],
	[V2012],
	[V2013],
	[V2014],
	[V2015],
	[V2016],
	[V2017],
	[V2018],
	[W2010],
	[W2011],
	[W2012],
	[W2013],
	[W2014],
	[W2015],
	[W2016],
	[W2017],
	[W2018]
	)
SELECT 	[Mode]
	,[HS6_P2C_Lane]
	,[commodity]
	,[cty_code]
	,[port_code]
	,[V2010]
	,[V2011]
	,[V2012]
	,[V2013]
	,[V2014]
	,[V2015]
	,[V2016]
	,[V2017]
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
FROM [dbo].[DOC_P2C_2010_2017_AV_CV_VV.V12]


INSERT INTO [dbo].[DOC_P2C_2010_2017_Value_Weight_12](
	[Mode],
	[HS6_P2C_Lane],
	[commodity],
	[cty_code],
	[port_code],
	[V2010],
	[V2011],
	[V2012],
	[V2013],
	[V2014],
	[V2015],
	[V2016],
	[V2017],
	[V2018],
	[W2010],
	[W2011],
	[W2012],
	[W2013],
	[W2014],
	[W2015],
	[W2016],
	[W2017],
	[W2018]
	)
SELECT 	[Mode]
	,[HS6_P2C_Lane]
	,[commodity]
	,[cty_code]
	,[port_code]
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,[W2010]
	,[W2011]
	,[W2012]
	,[W2013]
	,[W2014]
	,[W2015]
	,[W2016]
	,[W2017]
	,NULL
FROM [dbo].[DOC_P2C_2010_2017_AW_CW_VW.V11]

INSERT INTO [dbo].[DOC_P2C_2010_2017_Value_Weight_12](
	[Mode],
	[HS6_P2C_Lane],
	[commodity],
	[cty_code],
	[port_code],
	[V2010],
	[V2011],
	[V2012],
	[V2013],
	[V2014],
	[V2015],
	[V2016],
	[V2017],
	[V2018],
	[W2010],
	[W2011],
	[W2012],
	[W2013],
	[W2014],
	[W2015],
	[W2016],
	[W2017],
	[W2018]
	)
SELECT [Mode]
      ,[HS6_P2C_Lane]
      ,[HS6_Code]
      ,[Cty_code]
      ,[Port_Code]
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,[Value]
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
FROM [Tradecube 3.0 Processed Files].[dbo].[DOC_P2C_HS6_2018_UNPIV_Value]



INSERT INTO [dbo].[DOC_P2C_2010_2017_Value_Weight_12](
	[Mode],
	[HS6_P2C_Lane],
	[commodity],
	[cty_code],
	[port_code],
	[V2010],
	[V2011],
	[V2012],
	[V2013],
	[V2014],
	[V2015],
	[V2016],
	[V2017],
	[V2018],
	[W2010],
	[W2011],
	[W2012],
	[W2013],
	[W2014],
	[W2015],
	[W2016],
	[W2017],
	[W2018]
	)
SELECT [Mode]
      ,[HS6_P2C_Lane]
      ,[HS6_Code]
      ,[Cty_code]
      ,[Port_Code]
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,[Weight]
  FROM [Tradecube 3.0 Processed Files].[dbo].[DOC_P2C_HS6_2018_UNPIV_Weight]

