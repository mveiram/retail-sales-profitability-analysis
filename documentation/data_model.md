# Dimensional Data Model

## Purpose

The SQL Server warehouse layer uses a **star schema** to support sales, customer, product, geographic and profitability analysis in Power BI.

## Fact table grain

**One row in `dw.FactSales` represents one product line in an order**, identified by the source `Row_ID`. An order can therefore appear in multiple fact rows.

## Tables

| Table | Type | Key attributes |
|---|---|---|
| `dw.FactSales` | Fact | Order ID, Row ID, Sales, Quantity, Discount, Profit and dimension keys |
| `dw.DimDate` | Dimension | Calendar date, year, quarter, month and weekday |
| `dw.DimCustomer` | Dimension | Customer ID, name and segment |
| `dw.DimProduct` | Dimension | Product ID, name, category and sub-category |
| `dw.DimLocation` | Dimension | Country, state, city, postal code and region |
| `dw.DimShipMode` | Dimension | Shipping method |

## Relationships

- `DimDate[DateKey]` → `FactSales[OrderDateKey]` (active order-date relationship in Power BI).
- `DimDate[DateKey]` → `FactSales[ShipDateKey]` (inactive/role-playing ship-date relationship, activated in measures when needed).
- Each other dimension has a one-to-many relationship to `FactSales` through its surrogate key.

## Design decisions

- Surrogate integer keys are used for dimensions.
- Source identifiers are retained as natural/business keys in dimensions and as a degenerate order identifier in the fact table.
- Sales, profit, quantity and discount are stored at transaction-line grain.
- The original imported table `dbo.Superstore` remains the source/staging table for the existing SQL analysis scripts.
- The DDL in `sql/07_create_star_schema.sql` creates the warehouse tables but does **not** populate them. Data cleansing, dimension loads, fact loads and reconciliation checks are the next ETL tasks.

## Validation to perform after ETL

1. Compare source row count with fact row count.
2. Confirm every source `Row_ID` appears once in the fact table.
3. Check for missing dimension lookups and unmatched foreign keys.
4. Reconcile total Sales, Profit and Quantity between source and fact.
5. Validate date keys and order/ship date relationships.
