USE [Datamyne]
UPDATE [Latam] SET HS6_lane = CONCAT(O_Cty,'_',D_Cty,'_',HS6_code)
GO

USE [Datamyne]
UPDATE [Latam] SET C2C_lane = CONCAT(O_Cty,'_',D_Cty)
GO