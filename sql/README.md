# SQL Analysis

This folder contains the SQL Server layer of the project.

## Scripts

| Script | Purpose |
|---|---|
| 01_create_staging_table.sql | Creates the Superstore staging table |
| 02_data_quality.sql | Validates row counts, duplicates, nulls and dates |
| 03_business_kpis.sql | Calculates executive KPIs and monthly performance |
| 04_product_analysis.sql | Analyzes categories, sub-categories and products |
| 05_customer_analysis.sql | Analyzes customer value and ranking |
| 06_profitability_analysis.sql | Analyzes discounts, regions and year-over-year changes |

## SQL Skills Demonstrated

- Aggregations and GROUP BY
- CASE
- NULLIF
- CTEs
- Date functions
- RANK window function
- LAG window function
- Profitability analysis

## Execution

Run 01_create_staging_table.sql first, load the CSV into dbo.Superstore, and then execute the remaining scripts in numerical order.
