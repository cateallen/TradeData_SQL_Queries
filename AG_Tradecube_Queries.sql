
/* C2P 2010_2018_.sql */
USE [Tradecube 3.0 Processed Files]
GO

/*Starting with creating a table for each of the different 'values' (air, vessel, container, bulk) from data tables within the [Tradecube 3.0 Processed Files] database for the years 2010-2017 where the value is greater than 0, based on the selected direction, HS6_C2P_Lane, Commodity, Cty_code, Port_code, Destination and year. */
/*****Values*********/

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[air_val_yr] AS [Value]
INTO [DOC_C2P_2010_2017_Air_Value_11]
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
INTO [DOC_C2P_2010_2017_Vessel_Value_11]
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
INTO [DOC_C2P_2010_2017_Container_Value_11]
FROM [DOC_C2P_2010-2017A] 
WHERE [cnt_val_yr] > 0


SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[Bulk_val_yr] AS [Value]
INTO [DOC_C2P_2010_2017_Bulk_Value_11]
FROM [DOC_C2P_2010-2017A] 
WHERE [Bulk_val_yr] > 0

/*Creating a table for each of the different 'weights' (air, vessel, container, bulk) from data tables within the [Tradecube 3.0 Processed Files] database for the years 2010-2017 where weight is greater than 0, based on the selected direction, HS6_C2P_Lane, Commodity, Cty_code, Port_code, Destination and year.  */
/*****Weight*********/

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[air_swt_yr] AS [Weight]
INTO [DOC_C2P_2010_2017_Air_Weight_11]
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
INTO [DOC_C2P_2010_2017_Vessel_Weight_11]
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
INTO [DOC_C2P_2010_2017_Container_Weight_11]
FROM [DOC_C2P_2010-2017A] 
WHERE [cnt_swt_yr] > 0

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[Bulk_swt_yr] AS [Weight]
INTO [DOC_C2P_2010_2017_Bulk_Weight_11]
FROM [DOC_C2P_2010-2017A] 
WHERE [Bulk_swt_yr] > 0

/* Now altering the newly created tables from above and adding the column [Mode] as nvarchar(50); which is then filled in using the update statement below */

ALTER TABLE [DOC_C2P_2010_2017_Air_Weight_11] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_C2P_2010_2017_Vessel_Weight_11] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_C2P_2010_2017_Container_Weight_11] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_C2P_2010_2017_Bulk_Weight_11] ADD [Mode] nvarchar(50);

/**Fill in mode column to the weight tables**/
UPDATE [DOC_C2P_2010_2017_Air_Weight_11] SET [Mode] = 'Air';
UPDATE [DOC_C2P_2010_2017_Container_Weight_11] SET [Mode] = 'Container';
UPDATE [DOC_C2P_2010_2017_Vessel_Weight_11] SET [Mode] = 'Vessel';
UPDATE [DOC_C2P_2010_2017_Bulk_Weight_11] SET [Mode] = 'Bulk';


/* After updating the tables with the new column [Mode] I am then able to union each of the 4 tables into a new data table [DOC_C2P_2010_2017_AW_CW_VW_11] */ 

/***Union all the weight modes together**/
SELECT * INTO [DOC_C2P_2010_2017_AW_CW_VW_11] FROM
(
SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[Weight]
,[Mode]
FROM [DOC_C2P_2010_2017_Air_Weight_11]

UNION

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[Weight]
,[Mode]
FROM [DOC_C2P_2010_2017_Container_Weight_11]

UNION

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[Weight]
,[Mode]
FROM [DOC_C2P_2010_2017_Vessel_Weight_11]

UNION

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[Weight]
,[Mode]
FROM [DOC_C2P_2010_2017_Bulk_Weight_11]
) UnionedTables

/* After the creation and union of the 4 data tables into one ([DOC_C2P_2010_2017_AW_CW_VW_11]), I am starting to now pivot the data so that it is in the format needed, along with changing nulls to 0. I am using alter table statement to add a column for each year between 2010-2017 for weight, and then value. I am updating in each of the weight/year columns with a statement for when the year = the designated year then fill in the column with the weight numeric, if it is null then set it to 0. I am similarly then updating each of the value/year columns in with the value from the column [value] and if it is null then setting it to 0  */
/**Add weight columns to the table**/
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW_11] ADD [W2010] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW_11] ADD [W2011] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW_11] ADD [W2012] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW_11] ADD [W2013] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW_11] ADD [W2014] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW_11] ADD [W2015] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW_11] ADD [W2016] float;
ALTER TABLE [DOC_C2P_2010_2017_AW_CW_VW_11] ADD [W2017] float;


/**Fill in weight columns**/
UPDATE [DOC_C2P_2010_2017_AW_CW_VW_11]
SET [W2010] =
CASE WHEN [Year] = '2010'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW_11]
SET [W2011] =
CASE WHEN [Year] = '2011'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW_11]
SET [W2012] =
CASE WHEN [Year] = '2012'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW_11]
SET [W2013] =
CASE WHEN [Year] = '2013'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW_11]
SET [W2014] =
CASE WHEN [Year] = '2014'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW_11]
SET [W2015] =
CASE WHEN [Year] = '2015'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW_11]
SET [W2016] =
CASE WHEN [Year] = '2016'
then [Weight]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AW_CW_VW_11]
SET [W2017] =
CASE WHEN [Year] = '2017'
then [Weight]
ELSE '0'
end

/**Select into new table**/
SELECT * 
INTO [DOC_C2P_2010_2017_AW_CW_VW.V11]
FROM [DOC_C2P_2010_2017_AW_CW_VW_11]
WHERE [year] >= '2010'

/***Add mode column to each of the value tables***/
ALTER TABLE [DOC_C2P_2010_2017_Air_Value_11] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_C2P_2010_2017_Vessel_Value_11] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_C2P_2010_2017_Container_Value_11] ADD [Mode] nvarchar(50);
ALTER TABLE [DOC_C2P_2010_2017_Bulk_Value_11] ADD [Mode] nvarchar(50);

/**Fill in mode column to the value tables**/
UPDATE [DOC_C2P_2010_2017_Air_Value_11] SET [Mode] = 'Air';
UPDATE [DOC_C2P_2010_2017_Container_Value_11] SET [Mode] = 'Container';
UPDATE [DOC_C2P_2010_2017_Vessel_Value_11] SET [Mode] = 'Vessel';
UPDATE [DOC_C2P_2010_2017_Bulk_Value_11] SET [Mode] = 'Bulk';

/***Union all the value modes together**/
SELECT * INTO [DOC_C2P_2010_2017_AV_CV_VV_11] FROM 
(
SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[value]
,[Mode]
FROM [DOC_C2P_2010_2017_Air_Value_11]

UNION

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[value]
,[Mode]
FROM [DOC_C2P_2010_2017_Container_Value_11]

UNION

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[value]
,[Mode]
FROM [DOC_C2P_2010_2017_Vessel_Value_11]

UNION

SELECT [Direction]
,[HS6_C2P_Lane]
      ,[commodity]
      ,[cty_code]
      ,[port_code]
      ,[Destination]
      ,[year]
      ,[value]
,[Mode]
FROM [DOC_C2P_2010_2017_Bulk_Value_11]
) UnionedTables


/**Add 201N weight columns**/
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV_11] ADD [V2010] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV_11] ADD [V2011] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV_11] ADD [V2012] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV_11] ADD [V2013] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV_11] ADD [V2014] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV_11] ADD [V2015] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV_11] ADD [V2016] float;
ALTER TABLE [DOC_C2P_2010_2017_AV_CV_VV_11] ADD [V2017] float;


/**Fill in 201N weight columns**/
UPDATE [DOC_C2P_2010_2017_AV_CV_VV_11]
SET [V2010] =
CASE WHEN [Year] = '2010'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV_11]
SET [V2011] =
CASE WHEN [Year] = '2011'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV_11]
SET [V2012] =
CASE WHEN [Year] = '2012'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV_11]
SET [V2013] =
CASE WHEN [Year] = '2013'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV_11]
SET [V2014] =
CASE WHEN [Year] = '2014'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV_11]
SET [V2015] =
CASE WHEN [Year] = '2015'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV_11]
SET [V2016] =
CASE WHEN [Year] = '2016'
then [Value]
ELSE '0'
end

UPDATE [DOC_C2P_2010_2017_AV_CV_VV_11]
SET [V2017] =
CASE WHEN [Year] = '2017'
then [Value]
ELSE '0'
end

/**Select into new table**/

SELECT * 
INTO [DOC_C2P_2010_2017_AV_CV_VV.V11]
FROM [DOC_C2P_2010_2017_AV_CV_VV_11]
WHERE [year] >= '2010'

/* Here to begin with I am creating a new table [DOC_C2P_2010_2017_Value_Weight_11] in the database and setting the data table schema.Then I am inserting data into the tables from the pivoted/transformed tables I created above. I am then adding the new data for the year 2018 which was sitting in a separate data table, into the new table, so that the trade cube is updated for the years 2010 - 2018 and in the correct data table schema for the data to be exported and used for future data extraction, analysis and modeling. */
/****** Object:  Table [dbo].[DOC_C2P_2010_2017_AV_CV_VV.V2]    */
USE [Tradecube 3.0 Processed Files]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DOC_C2P_2010_2017_Value_Weight_11](
	[Mode] [nvarchar] (100) NULL,
	[HS6_C2P_Lane] [nvarchar](100) NULL,
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

INSERT INTO [dbo].[DOC_C2P_2010_2017_Value_Weight_11](
	[Mode],
	[HS6_C2P_Lane],
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
	,[HS6_C2P_Lane]
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
FROM [dbo].[DOC_C2P_2010_2017_AV_CV_VV.V11]


INSERT INTO [dbo].[DOC_C2P_2010_2017_Value_Weight_11](
	[Mode],
	[HS6_C2P_Lane],
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
	,[HS6_C2P_Lane]
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
FROM [dbo].[DOC_C2P_2010_2017_AW_CW_VW.V11]

INSERT INTO [dbo].[DOC_C2P_2010_2017_Value_Weight_11](
	[Mode],
	[HS6_C2P_Lane],
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
      ,[HS6_C2P_Lane]
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
	,[V2018]
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,[W2018]
FROM [Tradecube 3.0 Processed Files].[dbo].[DOC_C2P_2018_VW_Updated]



