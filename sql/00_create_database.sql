-- Retail Sales & Profitability Analysis
-- SQL Server | 00 - Database setup

IF DB_ID('RetailSalesDB') IS NULL
    CREATE DATABASE RetailSalesDB;
GO

USE RetailSalesDB;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dw')
    EXEC('CREATE SCHEMA dw');
GO
