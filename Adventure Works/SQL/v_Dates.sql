USE [AdventureWorks2016]
GO

/****** Object:  View [pbi].[v_Dates]    Script Date: 09.07.2026 19:18:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [pbi].[v_Dates]
AS
WITH N AS (
    SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n
    FROM master..spt_values
),
DateRange AS (
    SELECT DATEADD(DAY, n, '2010-01-01') AS [Date]
    FROM N
    WHERE DATEADD(DAY, n, '2010-01-01') <= '2030-12-31'
)
SELECT
    [Date],
    YEAR([Date]) AS [Year],
    MONTH([Date]) AS [Month],
    DATENAME(MONTH, [Date]) AS [MonthName],
    DATEPART(QUARTER, [Date]) AS [Quarter],
    FORMAT([Date], 'yyyy-MM') AS [YearMonth]
FROM DateRange;
GO


