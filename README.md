# Retail Sales & Profitability Analysis

> **Portfolio project — Data Analyst**

An end-to-end retail analytics project focused on understanding the drivers of **sales, profitability and business performance** using Python, SQL Server and Power BI.

**Project status:** 🚧 In progress

---

## 1. Business Problem

The objective is to understand:

> **What factors are driving sales and profitability, and where should the business focus its attention?**

The analysis goes beyond revenue to investigate **profit margin, discounts, products, customers, categories and regional performance**.

---

## 2. Project Objectives

- Analyze sales and profitability trends.
- Identify high-performing and low-performing categories and products.
- Investigate the relationship between discounts and profitability.
- Compare regional and customer-segment performance.
- Identify products generating sales but negative or weak profit.
- Build an executive Power BI dashboard.
- Translate analytical findings into business insights and recommendations.

---

## 3. Analytical Workflow

```
Raw Data
   │
   ▼
Data Quality & Preparation
   │
   ├── Python / Pandas
   │
   ▼
Exploratory Data Analysis
   │
   ▼
SQL Server Analysis
   │
   ▼
Power BI Data Model
   │
   ▼
Executive Dashboard
   │
   ▼
Business Insights & Recommendations
```

---

## 4. Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data preparation and exploratory analysis |
| Pandas | Data manipulation |
| Matplotlib | Data visualization |
| SQL Server | Data storage and analytical queries |
| Power BI | Interactive dashboard and reporting |
| GitHub | Version control and project documentation |

---

## 5. Dataset

**Dataset:** Sample - Superstore

The dataset contains retail transactions with information about:

- Orders and dates
- Customers
- Products
- Categories and sub-categories
- Regions
- Sales
- Quantity
- Discounts
- Profit

The dataset is used for educational and portfolio purposes.

---

# 6. Current Progress

### ✅ Phase 1 — Exploratory Data Analysis

Completed:

- Dataset structure and schema review
- Data-quality validation
- Null-value analysis
- Duplicate-value analysis
- Descriptive statistics
- Core business KPIs
- Category analysis
- Regional analysis
- Discount/profitability exploration
- Loss-making product identification

### Initial EDA results

| KPI | Result |
|---|---:|
| Total Sales | $2.30M |
| Total Profit | $286K |
| Orders | 5,009 |
| Customers | 793 |
| Profit Margin | 12.47% |
| Average Order Value | $458.61 |

### Initial observations

- Overall profitability is positive.
- Profitability varies across categories and regions.
- Furniture requires deeper profitability investigation because its margin is lower than the other major categories.
- Some products generate sales while producing negative profit.
- Discount levels require further analysis to understand their relationship with margin.

> These are **initial observations from the EDA**. Final business recommendations will be made only after the SQL and Power BI analysis validates the findings.

---

# 7. SQL Analysis — In Progress

The SQL layer has been designed and added to the repository.

Current scripts:

```
sql/
├── 01_create_staging_table.sql
├── 02_data_quality.sql
├── 03_business_kpis.sql
├── 04_product_analysis.sql
├── 05_customer_analysis.sql
├── 06_profitability_analysis.sql
└── README.md
```

The SQL analysis will demonstrate:

- Aggregations and GROUP BY
- CASE expressions
- CTEs
- Date functions
- RANK() window functions
- LAG() window functions
- Customer ranking
- Product profitability
- Discount analysis
- Regional performance
- Year-over-year analysis

**Next step:** load the dataset into SQL Server and execute/validate the analytical queries.

---

# 8. Power BI — Planned

The Power BI dashboard will be developed after validating the SQL analysis.

### Planned pages

**Page 1 — Executive Overview**
- Sales
- Profit
- Profit Margin
- Orders
- Sales and profit trends
- Category performance
- Regional performance

**Page 2 — Product & Profitability**
- Category/sub-category performance
- Sales vs. profit
- Discount vs. margin
- Loss-making products

**Page 3 — Customer & Regional Analysis**
- Customer segments
- Customer value
- Regional performance
- Top customers

---

# 9. Final Business Questions

The completed project will answer questions such as:

1. Which categories generate the most revenue and profit?
2. Which sub-categories have weak or negative profitability?
3. What is the relationship between discounts and profit margin?
4. Which products generate high sales but low profit?
5. Which regions contribute most to profitability?
6. Which customer segments generate the greatest value?
7. How are sales and profit changing over time?
8. Where are the main opportunities and risks?

---

# 10. Project Roadmap

- [x] Define business problem
- [x] Select and validate dataset
- [x] Build GitHub project structure
- [x] Complete initial Python EDA
- [x] Design SQL analysis layer
- [ ] Load dataset into SQL Server
- [ ] Validate SQL results
- [ ] Build analytical data model
- [ ] Create Power BI dashboard
- [ ] Document final findings
- [ ] Add business recommendations
- [ ] Finalize portfolio presentation

---

## Repository Structure

```
retail-sales-profitability-analysis/
│
├── data/
│   └── README.md
│
├── documentation/
│   ├── business_questions.md
│   └── data_dictionary.md
│
├── notebooks/
│   ├── README.md
│   └── 01_Exploratory_Data_Analysis.ipynb
│
├── sql/
│   ├── 01_create_staging_table.sql
│   ├── 02_data_quality.sql
│   ├── 03_business_kpis.sql
│   ├── 04_product_analysis.sql
│   ├── 05_customer_analysis.sql
│   ├── 06_profitability_analysis.sql
│   └── README.md
│
├── powerbi/
│   └── README.md
│
└── README.md
```

---

## Project Status

**Current stage:** Python EDA completed → SQL analysis prepared → SQL execution next.

The project is intentionally being developed incrementally so that each analytical stage validates the previous one before the final dashboard and business recommendations are produced.
