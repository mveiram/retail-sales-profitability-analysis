-- 03 - Executive business KPIs

SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Profit_Margin,
    SUM(Sales) / NULLIF(COUNT(DISTINCT Order_ID), 0) AS Average_Order_Value
FROM dbo.Superstore;

SELECT
    DATEFROMPARTS(YEAR(Order_Date), MONTH(Order_Date), 1) AS Month,
    SUM(Sales) AS Sales,
    SUM(Profit) AS Profit,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Profit_Margin
FROM dbo.Superstore
GROUP BY DATEFROMPARTS(YEAR(Order_Date), MONTH(Order_Date), 1)
ORDER BY Month;
