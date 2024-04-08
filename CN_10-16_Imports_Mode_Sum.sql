USE [Workbench 2.0]


SELECT
[Transport Method],
sum([Quantity]) as SumWeight,
[Unit Type]
FROM [China_Imports_10_16]
GROUP BY [Transport Method], [Unit Type]