USE [AdventureWorks2016]
GO

/****** Object:  View [pbi].[v_Sales]    Script Date: 09.07.2026 19:24:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [pbi].[v_Sales]
AS 

SELECT soh.SalesOrderID,
    sod.SalesOrderDetailID,
   CAST(soh.OrderDate AS DATE)OrderDate ,
    soh.CustomerID,
    sod.ProductID,
    soh.SalesPersonID,
    soh.BillToAddressID,
    sod.OrderQty,
    sod.UnitPrice,
    sod.UnitPriceDiscount,
    sod.LineTotal,
    pr.StandardCost,
    (sod.OrderQty * pr.StandardCost) AS TotalCost,
    (sod.LineTotal - (sod.OrderQty * pr.StandardCost)) AS Profit
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesOrderDetail sod 
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product pr 
    ON sod.ProductID = pr.ProductID;



GO


