/* Here I am checking to see if there are any nulls for the Destination City (D_Cty) is Mexico */
USE [ColombiaExportImport]
UPDATE [MexicoImportsExports2017]
SET D_Cty = 'Mexico' WHERE D_cty IS NULL
