-- 06 - Profitability and discount analysis

SELECT
    Discount,
    SUM(Sales) AS Sales,
    SUM(Profit) AS Profit,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Profit_Margin,
    COUNT(*) AS Order_Lines
FROM dbo.Superstore
GROUP BY Discount
ORDER BY Discount;

SELECT
    Region,
    SUM(Sales) AS Sales,
    SUM(Profit) AS Profit,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Profit_Margin
FROM dbo.Superstore
GROUP BY Region
ORDER BY Profit DESC;

WITH yearly AS (
    SELECT
        YEAR(Order_Date) AS Sales_Year,
        SUM(Sales) AS Sales,
        SUM(Profit) AS Profit
    FROM dbo.Superstore
    GROUP BY YEAR(Order_Date)
),
with_previous AS (
    SELECT
        Sales_Year,
        Sales,
        Profit,
        LAG(Sales) OVER (ORDER BY Sales_Year) AS Previous_Year_Sales,
        LAG(Profit) OVER (ORDER BY Sales_Year) AS Previous_Year_Profit
    FROM yearly
)
SELECT
    Sales_Year,
    Sales,
    Profit,
    Sales - Previous_Year_Sales AS Sales_Change,
    Profit - Previous_Year_Profit AS Profit_Change,
    (Sales - Previous_Year_Sales) / NULLIF(Previous_Year_Sales, 0) AS Sales_Growth
FROM with_previous
ORDER BY Sales_Year;
