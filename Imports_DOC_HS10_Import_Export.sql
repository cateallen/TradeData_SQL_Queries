USE [Workbench 2.0]
INSERT INTO DOC_HS10_Imports_Exports_2(Direction,OReg,Dreg,OCty,DCty,D_City_name,D_City,Commodity10,Cty_code,Dirstrict,[year],Air_value,Air_weight,Ves_vaule,Ves_weight,Cnt_value,Cnt_weight)
SELECT Direction, OReg, Dreg, OCty,DCty,D_City_Name,D_City,Commodity,Cty_Code,dist_entry,[year],air_val_yr,air_wgt_yr,ves_val_yr,ves_wgt_yr,cnt_val_yr,cnt_wgt_yr
FROM Imports