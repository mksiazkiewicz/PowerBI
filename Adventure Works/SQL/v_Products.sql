USE [AdventureWorks2016]
GO

/****** Object:  View [pbi].[v_Products]    Script Date: 09.07.2026 19:19:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [pbi].[v_Products]
AS 

SELECT
    pr.ProductID,
    pr.Name AS ProductName,
    pc.Name AS Category,
    psc.Name AS Subcategory
FROM Production.Product pr
LEFT JOIN Production.ProductSubcategory psc 
    ON pr.ProductSubcategoryID = psc.ProductSubcategoryID
LEFT JOIN Production.ProductCategory pc 
    ON psc.ProductCategoryID = pc.ProductCategoryID;

GO


