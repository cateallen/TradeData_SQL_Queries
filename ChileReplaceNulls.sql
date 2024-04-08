USE [BrazilImportExport]
GO


UPDATE [BrazilEXIM]
SET _Country_of_Destination_ = 'Brazil' WHERE _Country_of_Destination_ IS NULL
GO

UPDATE [BrazilEXIM]
SET _Country_of_Origin_ = 'Brazil' WHERE _County_of_Origin_ IS NULL