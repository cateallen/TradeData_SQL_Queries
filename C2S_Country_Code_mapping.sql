USE [Tradecube 3.0 Processed Files]
GO

ALTER TABLE [DOC_C2S_2010_2018_VW] ADD [Direction] nvarchar(90);
ALTER TABLE [DOC_C2S_2010_2018_VW] ADD [O_Cty] nvarchar(90);
ALTER TABLE [DOC_C2S_2010_2018_VW] ADD [D_Cty] nvarchar(90);
ALTER TABLE [DOC_C2S_2010_2018_VW] ADD [O_Reg] nvarchar(90);
ALTER TABLE [DOC_C2S_2010_2018_VW] ADD [D_Reg] nvarchar(90);
ALTER TABLE [DOC_C2S_2010_2018_VW] ADD [O_State] nvarchar(90);
ALTER TABLE [DOC_C2S_2010_2018_VW] ADD [D_State] nvarchar(90);

UPDATE [DOC_C2S_2010_2018_VW] SET [Direction] = 'Import';
UPDATE [DOC_C2S_2010_2018_VW] SET [D_Cty] = 'US';
UPDATE [DOC_C2S_2010_2018_VW] SET [D_Reg] = 'NA';

USE [Tradecube 3.0 Processed Files]
GO

SELECT [Mode]
      ,[HS6_C2S_Lane]
     ,[commodity]
      ,[cty_code]
      ,[state]
      ,[V2010]
      ,[V2011]
      ,[V2012]
      ,[V2013]
      ,[V2014]
      ,[V2015]
      ,[V2016]
      ,[V2017]
      ,[V2018]
      ,[W2010]
      ,[W2011]
      ,[W2012]
      ,[W2013]
      ,[W2014]
      ,[W2015]
      ,[W2016]
      ,[W2017]
      ,[W2018]
      ,[Direction]
, b.[Cty] [O_Cty]
,[D_Cty]
,c.[Reg] [O_Reg]
,[D_Reg]
  ,[O_State]
,[D_State]
INTO [dbo].[DOC_C2S_2010_2018_VW_Cty_Mapped]
FROM [dbo].[DOC_C2S_2010_2018_VW] a
OUTER APPLY
(
SELECT TOP 1*
FROM [Tradecube 3.0 Processed Files].[dbo].[Country Code Lookup] b
WHERE a.[cty_code] = b.[country_code]
) B
OUTER APPLY
(
SELECT TOP 1*
FROM [Tradecube 3.0 Processed Files].[dbo].[Country Code Lookup] c
WHERE a.[cty_code] = b.[country_code]
) C
