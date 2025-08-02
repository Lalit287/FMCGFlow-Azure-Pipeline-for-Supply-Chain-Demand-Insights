# FMCGFlow-Azure-Pipeline-for-Supply-Chain-Demand-Insights

FMCGFlow – Azure Pipeline for Supply Chain Demand Insights


📌 Overview
FMCGFlow is a data engineering project designed for a fast-moving consumer goods (FMCG) company to analyze historical sales and various business drivers. It enables data-driven supply chain decisions without predictive models by building an Azure-powered ETL pipeline and delivering insights through Power BI dashboards.

Dataset: Strategic Supply Chain Demand Forecasting Dataset(kaggle)


🎯 Project Goals
Centralize and process structured FMCG sales data.

Understand the impact of promotions, holidays, pricing, economic factors, and weather on sales.

Create a secure and monitored Azure data pipeline with end-to-end reporting.


🚀 Key Features
Centralized Storage: Raw and cleaned data stored in Azure Blob/Data Lake Gen2.

Data Cleaning & Feature Engineering: Python-based processing using Pandas & NumPy.

ETL Orchestration: Azure Data Factory pipelines to transform and load data.

Analytics Database: Azure SQL Database with star schema for BI reporting.

Power BI Dashboards: Interactive insights on sales performance, promotions, and trends.

Enterprise Practices: Credential management with Azure Key Vault, monitoring with Azure Monitor.


🛠 Technology Stack
Programming: Python, SQL

Azure Services: Blob Storage/Data Lake Gen2, Data Factory, SQL Database, Key Vault, Monitor

Libraries: Pandas, NumPy, azure-storage-blob, SQLAlchemy

Visualization: Power BI Desktop / Service

Tools: Azure Portal, Azure CLI, Data Factory Studio


📂 Project Modules
Module	Description
Data Ingestion	Upload dataset to Azure Blob Storage and access via SDK or ADF
Data Cleaning	Remove nulls, fix formats, compute adjusted revenue, filter anomalies
Feature Engineering	Extract time-based features, create holiday flags, summarize competitor & economic indexes
ETL Pipeline	Azure Data Factory to clean, transform, and load data into Azure SQL
Data Modeling	Create fact & dimension tables for analytics
Power BI Reporting	Build dashboards for unit sales, revenue, promotion effectiveness
Security & Monitoring	Manage credentials in Key Vault; track pipelines in Azure Monitor


📊 Power BI Dashboard Highlights
Time Series Analysis: Weekly sales and revenue trends

Category & Region Insights: Compare product performance by geography and store type

Promotion Impact: Avg price & sales during promotions vs non-promotions

Slicers & Filters: Region, category, store type, holiday season


📜 License
This project is for educational and portfolio purposes. Feel free to fork and adapt.

