USE [US_T-100_Market_2010-2018]
GO

SELECT [R2R_Lane]
      ,[C2C_Lane]
      ,[A2A_Lane]
      ,[Year]
      ,[Month]
      ,[O_Reg]
      ,[D_Reg]
      ,[O_Cty]
      ,[D_Cty]
      ,[O_ctyreg]
      ,[D_ctyreg]
      ,[O_state]
      ,[D_state]
      ,[O_city]
      ,[D_city]
      ,[O_LCS_POD]
      ,[D_LCS_POD]
      ,[O_Apt]
      ,[D_Apt]
      ,[GCKM]
      ,[Carrier_code]
      ,[Pax]
      ,[Freight]
      ,[Mail]
      ,b.[State] [O_state_updated]
      ,c.[State] [D_state_updated]
      ,d.[City] [O_city_updated]
      ,e.[City] [D_city_updated]
      ,f.[POD] [O_LCS_POD_Updated]
      ,g.[POD] [D_LCS_POD_Updated]
INTO [dbo].[T-100_market_2010-2018_processed_file_V5]
FROM [dbo].[T-100_market_2010-2018_processed_file_V4] a
OUTER APPLY
( 
SELECT TOP 1*
FROM [US_T-100_Market_2010-2018].[dbo].[LCS_POD_Mapping] b
WHERE a.[O_Apt] = b.[Apt]
) B
OUTER APPLY 
( 
SELECT TOP 1*
FROM [US_T-100_Market_2010-2018].[dbo].[LCS_POD_Mapping] c
WHERE a.[D_Apt] = c.[Apt]
) C
OUTER APPLY 
( 
SELECT TOP 1*
FROM [US_T-100_Market_2010-2018].[dbo].[LCS_POD_Mapping] d
WHERE a.[O_Apt] = d.[Apt]
) D
OUTER APPLY 
( 
SELECT TOP 1*
FROM [US_T-100_Market_2010-2018].[dbo].[LCS_POD_Mapping] e
WHERE a.[D_Apt] = e.[Apt]
) E
OUTER APPLY 
( 
SELECT TOP 1*
FROM [US_T-100_Market_2010-2018].[dbo].[LCS_POD_Mapping] f
WHERE a.[O_Apt] = f.[Apt]
) F
OUTER APPLY 
( 
SELECT TOP 1*
FROM [US_T-100_Market_2010-2018].[dbo].[LCS_POD_Mapping] g
WHERE a.[D_Apt] = g.[Apt]
) G

