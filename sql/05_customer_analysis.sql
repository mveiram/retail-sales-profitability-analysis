-- 05 - Customer analysis

SELECT TOP 20
    Customer_ID,
    Customer_Name,
    Segment,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Sales) AS Sales,
    SUM(Profit) AS Profit,
    SUM(Profit) / NULLIF(SUM(Sales), 0) AS Profit_Margin
FROM dbo.Superstore
GROUP BY Customer_ID, Customer_Name, Segment
ORDER BY Sales DESC;

WITH customer_sales AS (
    SELECT
        Customer_ID,
        Customer_Name,
        Segment,
        SUM(Sales) AS Sales,
        SUM(Profit) AS Profit
    FROM dbo.Superstore
    GROUP BY Customer_ID, Customer_Name, Segment
)
SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    Sales,
    Profit,
    RANK() OVER (
        PARTITION BY Segment
        ORDER BY Sales DESC
    ) AS Sales_Rank_Within_Segment
FROM customer_sales
ORDER BY Segment, Sales_Rank_Within_Segment;
