USE [AdventureWorks2016]
GO

/****** Object:  View [pbi].[v_Addresses]    Script Date: 09.07.2026 19:14:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [pbi].[v_Addresses] AS
SELECT
    a.AddressID,
    a.City,
    sp.Name AS StateProvince,
    sp.StateProvinceCode,
    cr.Name AS Country,
    cr.CountryRegionCode,
    sp.TerritoryID
FROM Person.Address a
INNER JOIN Person.StateProvince sp 
    ON a.StateProvinceID = sp.StateProvinceID
INNER JOIN Person.CountryRegion cr 
    ON sp.CountryRegionCode = cr.CountryRegionCode;

GO


