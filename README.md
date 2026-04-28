 # Customer Behavior Analysis Dashboard

## Project Overview

This project analyzes customer shopping behavior to identify key trends, improve customer engagement, and optimize business strategies. It follows an end-to-end data analytics workflow using Python, SQL, and Power BI.

---

## Problem Statement

Analyze customer shopping data to uncover patterns in purchasing behavior and generate actionable insights for improving sales and customer retention.

---

## Tech Stack

Python (Pandas) for data cleaning and feature engineering
MySQL for data storage and querying
Power BI for dashboard and visualization

---

## Workflow

1. Extract
   Loaded dataset from CSV using Python

2. Data Cleaning and Transformation
   Handled missing values and inconsistencies
   Standardized column names and formats
   Removed duplicates and corrected data types
   Created new features such as age_group

3. Load
   Stored processed data into MySQL database

4. Analysis
   Performed SQL queries using aggregations, subqueries, CTEs, and window functions

5. Visualization
   Built an interactive Power BI dashboard with filters and KPIs

---

## Dashboard Features

KPIs

* Total Customers
* Average Purchase Amount
* Average Review Rating

Visuals

* Revenue by Category
* Sales by Category
* Customer distribution by subscription status
* Revenue and sales by age group

Filters

* Subscription Status
* Gender
* Category
* Shipping Type

---

## Key Insights

Clothing category generates the highest revenue
Young adults contribute the most to overall sales
Only about 27 percent of customers are subscribed
Discounts have a strong impact on purchasing behavior

---

## Project Structure

```bash id="x8u9re"
Customer-Behavior-Analysis/
│
├── data/
│   └── customer_shopping_behavior.csv
│
├── python/
│   └── data_cleaning.ipynb
│
├── sql/
│   └── analysis_queries.sql
│
├── powerbi/
│   └── dashboard.pbix
│
└── README.md
```

---

## How to Run

1. Clone the repository
2. Run the Python notebook for data cleaning and preprocessing
3. Load the cleaned data into MySQL
4. Open the Power BI file
5. Explore the dashboard

---

## Learnings

Built a complete data analytics pipeline from data cleaning to visualization
Improved skills in data preprocessing, SQL querying, and dashboard creation
Gained experience in solving real-world business problems using data

---


