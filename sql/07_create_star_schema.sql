-- Retail Sales & Profitability Analysis
-- SQL Server | 07 - Dimensional model (Star Schema)
--
-- Prerequisite:
--   1. Run 00_create_database.sql
--   2. Run 01_create_staging_table.sql and import the CSV into dbo.Superstore
--
-- This script creates the dimensional model only. ETL/load procedures are a
-- subsequent project step; the tables are not populated by this script.

USE RetailSalesDB;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dw')
    EXEC('CREATE SCHEMA dw');
GO

CREATE TABLE dw.DimDate (
    DateKey       INT          NOT NULL PRIMARY KEY, -- YYYYMMDD
    FullDate      DATE         NOT NULL UNIQUE,
    CalendarYear  SMALLINT     NOT NULL,
    QuarterNumber TINYINT      NOT NULL,
    MonthNumber   TINYINT      NOT NULL,
    MonthName     VARCHAR(20)  NOT NULL,
    YearMonth     CHAR(7)      NOT NULL,
    DayOfMonth    TINYINT      NOT NULL,
    DayOfWeek     TINYINT      NOT NULL,
    DayName       VARCHAR(20)  NOT NULL
);
GO

CREATE TABLE dw.DimCustomer (
    CustomerKey  INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CustomerID   VARCHAR(50)  NOT NULL UNIQUE,
    CustomerName VARCHAR(150) NOT NULL,
    Segment      VARCHAR(50)  NULL
);
GO

CREATE TABLE dw.DimProduct (
    ProductKey   INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProductID    VARCHAR(50)  NOT NULL UNIQUE,
    ProductName  VARCHAR(255) NOT NULL,
    Category     VARCHAR(50)  NULL,
    SubCategory  VARCHAR(50)  NULL
);
GO

CREATE TABLE dw.DimLocation (
    LocationKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Country     VARCHAR(100) NULL,
    State       VARCHAR(100) NULL,
    City        VARCHAR(100) NULL,
    PostalCode  VARCHAR(20)  NULL,
    Region      VARCHAR(50)  NULL,
    CONSTRAINT UQ_DimLocation
        UNIQUE (Country, State, City, PostalCode, Region)
);
GO

CREATE TABLE dw.DimShipMode (
    ShipModeKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ShipMode    VARCHAR(50) NOT NULL UNIQUE
);
GO

CREATE TABLE dw.FactSales (
    SalesKey       BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    RowID          INT          NOT NULL UNIQUE,
    OrderID        VARCHAR(50)  NOT NULL,
    OrderDateKey   INT          NOT NULL,
    ShipDateKey    INT          NULL,
    CustomerKey    INT          NOT NULL,
    ProductKey     INT          NOT NULL,
    LocationKey    INT          NOT NULL,
    ShipModeKey    INT          NOT NULL,
    Sales          DECIMAL(18,2) NOT NULL,
    Quantity       INT          NOT NULL,
    Discount       DECIMAL(5,2) NOT NULL,
    Profit         DECIMAL(18,2) NOT NULL,

    CONSTRAINT FK_FactSales_OrderDate
        FOREIGN KEY (OrderDateKey) REFERENCES dw.DimDate(DateKey),
    CONSTRAINT FK_FactSales_ShipDate
        FOREIGN KEY (ShipDateKey) REFERENCES dw.DimDate(DateKey),
    CONSTRAINT FK_FactSales_Customer
        FOREIGN KEY (CustomerKey) REFERENCES dw.DimCustomer(CustomerKey),
    CONSTRAINT FK_FactSales_Product
        FOREIGN KEY (ProductKey) REFERENCES dw.DimProduct(ProductKey),
    CONSTRAINT FK_FactSales_Location
        FOREIGN KEY (LocationKey) REFERENCES dw.DimLocation(LocationKey),
    CONSTRAINT FK_FactSales_ShipMode
        FOREIGN KEY (ShipModeKey) REFERENCES dw.DimShipMode(ShipModeKey)
);
GO

-- Fact table grain: one row per Superstore transaction line (Row_ID).
-- OrderDateKey and ShipDateKey are role-playing references to DimDate.
