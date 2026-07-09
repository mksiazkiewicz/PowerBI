USE [AdventureWorks2016]
GO

/****** Object:  View [pbi].[v_Customers]    Script Date: 09.07.2026 19:16:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [pbi].[v_Customers]
AS 

SELECT
    c.CustomerID,
    CASE 
        WHEN c.PersonID IS NOT NULL THEN 'B2C'
        WHEN c.StoreID IS NOT NULL THEN 'B2B'
        ELSE 'Unknown'
    END AS CustomerType,
    CASE 
        WHEN c.PersonID IS NOT NULL 
            THEN p.FirstName + ' ' + p.LastName
        WHEN c.StoreID IS NOT NULL 
            THEN s.Name
    END AS CustomerName,
    p.PersonType
FROM Sales.Customer c
LEFT JOIN Person.Person p 
    ON c.PersonID = p.BusinessEntityID
LEFT JOIN Sales.Store s 
    ON c.StoreID = s.BusinessEntityID;

GO


