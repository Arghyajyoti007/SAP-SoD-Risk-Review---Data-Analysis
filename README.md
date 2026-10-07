# SAP SoD Risk Review & Data Analysis

A portfolio project built around a simple SAP GRC SoD (Segregation of Duties) risk review scenario.

The project shows how I worked with SAP-style data using **Microsoft Fabric, SQL and Power BI** to clean the data, build a reporting model and create dashboards for risk and compliance analysis.

> **Note:** This project uses synthetic data and does not contain any client or production data.

## What is this project about?

The scenario is based on an annual SoD risk review carried out from **2022 to 2026**.

The analysis looks at:

* Overall SoD conflicts and risk levels
* Critical and High-risk exposure
* Risk by business process, business unit and SAP system
* Users with higher risk exposure
* Conflicts that continue across multiple reviews
* Resolved and newly identified conflicts
* Areas that may need further review

## Tools Used

* **Microsoft Fabric**
* **SQL**
* **Power BI**
* **Dataflow Gen2**
* **Fabric Notebooks**
* **Lakehouse**
* **Direct Lake**
* **Medallion Architecture**

## Data

The source data contains SAP-style information such as:

* SoD risk assessments
* Users and organizational details
* Risk definitions
* SAP systems
* Roles and role conflicts
* Annual risk reviews

The data also contains a few controlled data-quality issues such as duplicate records, extra spaces and blank system IDs. These were used to demonstrate data cleaning and validation.

## Data Flow

The project follows this flow:

**Raw Data → Silver → Gold → Power BI**

The raw CSV files are first cleaned and validated in Microsoft Fabric. The cleaned data is then used to create the reporting tables and Power BI semantic model.

## Power BI Report

### 1. Risk & Compliance Overview

Provides an overall view of SoD risk and how it changed across the annual reviews.

<img width="1322" height="746" alt="Overview" src="https://github.com/user-attachments/assets/fbb2dc91-cd13-492a-8310-2149a2fb9326" />

### 2. Risk Prioritization

Focuses on Critical and High-risk conflicts and highlights the users, business areas, processes and systems with higher exposure.

<img width="1325" height="746" alt="Risk Prioritization" src="https://github.com/user-attachments/assets/0ecd5840-6396-476f-8c95-2d7630be0231" />

### 3. Risk Persistence & Remediation

Looks at conflicts that are newly identified, continue across reviews or are no longer present in the following review.

<img width="1325" height="741" alt="Persistence and Remediation" src="https://github.com/user-attachments/assets/87ed81de-04b3-487c-9b70-8a7e91b2f083" />

### 4. Executive Summary

A management-level view of the overall risk position, persistent exposure and areas that may need attention.

<img width="1326" height="746" alt="Executive Summary" src="https://github.com/user-attachments/assets/843651a6-9779-4cc9-bcaa-1d4e1ed61a8d" />

## Data Model

The reporting model contains:

* Fact SoD Conflict
* User
* Risk
* Risk Review
* System
* Role
* Conflict–Role Bridge

This keeps the model simple while allowing the report to analyse conflicts from different business perspectives.

## Project Scope

This project focuses on **SoD risk and compliance analysis**.

User provisioning, access requests and transaction-level analysis are outside the scope of this phase.

---

### Built as a portfolio project

This project is based on my experience working with **SAP GRC/IAM and compliance reporting**, and is designed to demonstrate my skills in **SQL, Microsoft Fabric, data modelling and Power BI**.
