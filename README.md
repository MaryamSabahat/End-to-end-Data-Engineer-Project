# End-to-End Data Engineer Project 🚀

**End-to-End Data Engineering Pipeline on Azure using ADF, Databricks, and Synapse**

---

## 📑 Table of Contents

1. [Project Overview](#1-project-overview)  
2. [Architecture Diagram](#2-architecture-diagram)  
3. [Tools and Services Used](#3-tools-and-services-used)  
4. [Step-by-Step Implementation](#4-step-by-step-implementation)  
    4.1 [Data Source](#41-data-source)  
    4.2 [Azure Environment Setup](#42-azure-environment-setup)  
    4.3 [Why Azure Data Factory (ADF)?](#43-why-azure-data-factory-adf)  
    4.4 [Data Ingestion (Static & Dynamic Pipelines)](#44-data-ingestion-static--dynamic-pipelines)  
    4.5 [Azure Data Lake Gen2 – Raw Storage (Bronze Layer)](#45-azure-data-lake-gen2--raw-storage-bronze-layer)  
    4.6 [Azure Databricks for Transformation (Silver & Gold Layers)](#46-azure-databricks-for-transformation-silver--gold-layers)  
    4.7 [Azure Synapse Analytics – Query Layer](#47-azure-synapse-analytics--query-layer)  
    4.8 [Power BI – Dashboard & Visualization](#48-power-bi--dashboard--visualization)  
5. [Conclusion](#5-conclusion)

---

## 1. Project Overview

This project demonstrates a complete **Azure-native data engineering pipeline** — from ingestion to transformation to business intelligence — using GitHub as the data source. It features:

- Static & dynamic pipelines
- Bronze, Silver, Gold storage layers
- PySpark transformations
- Real-time business insights using Power BI

✅ **Aligned with Modern Data Lakehouse Architecture**  
✅ **Modular & Scalable**

---

## 2. Architecture Diagram

*(Insert architecture diagram image here. You can upload it to your repo and link like this:)*  
`![Architecture Diagram](./images/architecture.png)`

---

## 3. Tools and Services Used

| Tool/Service           | Purpose                                              |
|------------------------|------------------------------------------------------|
| GitHub                 | Data source (CSV / JSON / API)                       |
| Azure Data Factory     | Static & dynamic data ingestion pipelines            |
| Azure Data Lake Gen2   | Scalable storage (Bronze, Silver, Gold layers)       |
| Azure Databricks       | PySpark-based transformations                        |
| Apache Spark           | Distributed data processing engine                   |
| Azure Synapse Analytics| SQL-based querying, external tables                  |
| Power BI               | Dashboard and reporting                              |

---

## 4. Step-by-Step Implementation

### 4.1 Data Source

- 📂 **Source:** Public GitHub dataset  
- 🧾 **Format:** CSV  
- 🎯 **Goal:** Ingest data into Azure  
- 🔧 **Tool Used:** Azure Data Factory (HTTP connector)

---

### 4.2 Azure Environment Setup

Resources provisioned:

- ✅ Azure Data Factory  
- ✅ Azure Data Lake Gen2  
- ✅ Azure Databricks (cluster)  
- ✅ Azure Synapse Analytics  
- ✅ Power BI (Desktop)

---

### 4.3 Why Azure Data Factory (ADF)?

**Purpose:** Orchestration and automation of ETL workflows.

**Reasons for Selection:**

- No-code/low-code interface  
- Native GitHub support  
- Highly scalable  
- Seamless integration with Azure stack

---

### 4.4 Data Ingestion (Static & Dynamic Pipelines)

#### 🔹 Static Pipeline (Bronze Layer)

- Used ADF Copy Data Wizard  
- HTTP source → GitHub CSV URL  
- Sink → ADLS Gen2 `/bronze` container  
- Configured CSV format, delimiter, encoding

#### 🔹 Dynamic Pipeline (Reusable, Scalable)

- Created Parameters: `p_file_name`, `p_folder_path`  
- Used **Lookup Activity** for metadata  
- **ForEach Activity**: Loop through file list  
- **Parameterized Copy Activity** inside loop

✅ Outcome: One pipeline handles multiple files efficiently

---

### 4.5 Azure Data Lake Gen2 – Raw Storage (Bronze Layer)

**Why Used:**

- Big data-friendly  
- Hadoop/Spark-compatible  
- Hierarchical namespace support  
- Cost-effective

**Container Structure:**

/bronze → Raw files
/silver → Cleaned data
/gold → Final datasets



---

### 4.6 Azure Databricks for Transformation (Silver & Gold Layers)

**Why Databricks?**

- Built on Apache Spark  
- Supports PySpark  
- Seamless with ADLS and ADF  
- Ideal for transformations, joins, filters

**Steps Followed:**

1. Mounted ADLS in Databricks  
2. Read from Bronze: `spark.read.csv()`  
3. Cleaned data: removed nulls, fixed types, dropped duplicates  
4. Wrote to Silver: `write.format("parquet")`  
5. Final output saved in partitioned Gold layer

---

### 4.7 Azure Synapse Analytics – Query Layer

**Why Synapse?**

- Serverless querying via `OPENROWSET()`  
- External tables over ADLS  
- Connects with Power BI

**Steps:**

- Connected to Gold Layer in ADLS  
- Defined external data source + file format  
- Created external tables for Power BI access

---

### 4.8 Power BI – Dashboard & Visualization

**Why Power BI?**

- DirectQuery + Import support  
- Native integration with Synapse  
- Live dashboards from external tables

**Steps:**

- Connected Power BI to Synapse  
- Imported schema  
- Built interactive visual reports

---

## 5. Conclusion

This project delivers a full-scale, cloud-native data engineering pipeline using **Azure best practices**.

✅ **ADF** → Ingestion (static & dynamic)  
✅ **ADLS Gen2** → Layered storage (Bronze/Silver/Gold)  
✅ **Databricks** → PySpark transformation  
✅ **Synapse** → SQL query layer  
✅ **Power BI** → Visualization & insights

This real-world simulation improves my portfolio as an **aspiring data engineer** and showcases my understanding of modern **Data Lakehouse architecture** on Azure.

---


