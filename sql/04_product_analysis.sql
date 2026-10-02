-- 04 - Product and category analysis

SELECT
    Category,
    SUM(Sales) AS Sales,
    SUM(Profit) AS Profit,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Profit_Margin
FROM dbo.Superstore
GROUP BY Category
ORDER BY Sales DESC;

SELECT
    Category,
    Sub_Category,
    SUM(Sales) AS Sales,
    SUM(Profit) AS Profit,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Profit_Margin
FROM dbo.Superstore
GROUP BY Category, Sub_Category
ORDER BY Profit DESC;

SELECT TOP 10
    Product_ID,
    Product_Name,
    SUM(Sales) AS Sales,
    SUM(Quantity) AS Quantity,
    SUM(Profit) AS Profit
FROM dbo.Superstore
GROUP BY Product_ID, Product_Name
ORDER BY Profit ASC;

SELECT TOP 20
    Product_ID,
    Product_Name,
    SUM(Sales) AS Sales,
    SUM(Profit) AS Profit,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Profit_Margin
FROM dbo.Superstore
GROUP BY Product_ID, Product_Name
HAVING SUM(Sales) > 5000
ORDER BY Profit_Margin ASC;
