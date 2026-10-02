-- 02 - Data quality checks

SELECT COUNT(*) AS total_rows
FROM dbo.Superstore;

SELECT Row_ID, COUNT(*) AS occurrences
FROM dbo.Superstore
GROUP BY Row_ID
HAVING COUNT(*) > 1;

SELECT
    SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS missing_customer_id,
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS missing_product_id,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS missing_sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS missing_profit
FROM dbo.Superstore;

SELECT MIN(Order_Date) AS first_order_date,
       MAX(Order_Date) AS last_order_date
FROM dbo.Superstore;

SELECT COUNT(*) AS loss_making_rows
FROM dbo.Superstore
WHERE Profit < 0;
