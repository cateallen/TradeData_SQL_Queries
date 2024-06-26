/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [NAICS]
      ,[_emp_]
      ,[_est_]
      ,[FIPS_COde]
      ,e.[Region] [Reg_Code]
      ,b.[Country] [Cty_code]
      ,d.[CtyReg_Code] [CtyReg_Code]
      ,b.[POD] [LCS_POD]
INTO [WN_Segment_database].[dbo].[cbp16co_V4]
  FROM [WN_Segment_database].[dbo].[cbp16co_V2] a
  OUTER APPLY
  (
  SELECT TOP 1*
  FROM [WN_Segment_database].[dbo].[FIPS_PODS] b
  WHERE a.[FIPS_Code] = b.[FIPS]
  ) B
  OUTER APPLY
  (
  SELECT TOP 1*
  FROM [WN_Segment_database].[dbo].[FIPS_PODS] C
  WHERE a.[FIPS_Code] = c.[FIPS]
  ) C
OUTER APPLY
(
SELECT TOP 1*
FROM [WN_Segment_database].[dbo].[FIPS_PODS] D
where a.[FIPS_Code] = d.[FIPS]
) D
OUTER APPLY
(
SELECT TOP 1*
FROM [WN_Segment_database].[dbo].[FIPS_PODS] E
where a.[FIPS_Code] = E.[FIPS]
) E
