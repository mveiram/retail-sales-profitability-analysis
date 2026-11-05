# SQL Analysis

This folder contains the SQL Server layer of the project.

## Database setup and execution order

| Script | Purpose |
|---|---|
| 00_create_database.sql | Creates the `RetailSalesDB` database and `dw` schema |
| 01_create_staging_table.sql | Creates the source import table `dbo.Superstore` |
| 02_data_quality.sql | Validates row counts, duplicates, nulls and dates |
| 03_business_kpis.sql | Calculates executive KPIs and monthly performance |
| 04_product_analysis.sql | Analyzes categories, sub-categories and products |
| 05_customer_analysis.sql | Analyzes customer value and ranking |
| 06_profitability_analysis.sql | Analyzes discounts, regions and year-over-year changes |
| 07_create_star_schema.sql | Creates the dimensional warehouse tables |

Run script 00 first, then script 01 and import the CSV into `dbo.Superstore`. Execute scripts 02–06 to validate and analyze the source data. Script 07 creates the dimensional model; it can be run after the database and source table have been created.

## Dimensional model

The warehouse uses a star schema:

- **Fact:** `dw.FactSales` — one row per transaction line (`Row_ID`).
- **Dimensions:** `dw.DimDate`, `dw.DimCustomer`, `dw.DimProduct`, `dw.DimLocation` and `dw.DimShipMode`.

See [../documentation/data_model.md](../documentation/data_model.md) for the grain, keys and relationships.

## SQL Skills Demonstrated

- Database and schema creation
- Table design, primary keys and foreign keys
- Aggregations and GROUP BY
- CASE and NULLIF
- CTEs and date functions
- RANK and LAG window functions
- Customer ranking, product profitability and discount analysis

## Current implementation status

The staging table and analytical query scripts are part of the project. The star-schema DDL is now documented and available. The next step is to implement ETL loads from `dbo.Superstore` into the dimensions and fact table, then reconcile the results.
