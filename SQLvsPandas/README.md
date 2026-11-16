# SQL vs. Pandas: Comparing Data Manipulation Techniques

## Project Overview

This project explores how common data manipulation and analysis tasks can be performed using **SQL** and **Python (Pandas)**.

Using country-level development data from the [World Bank's World Development Indicators (WDI)](https://databank.worldbank.org/source/world-development-indicators) database, the project demonstrates equivalent operations in both tools and compares their syntax and approaches.

The dataset covers five development indicators across countries and regions from 2010 to 2024:
- Population
- GDP per capita (PPP)
- Life expectancy
- Unemployment rate
- Urban population (%)

## Topics Covered

**Part 1: Basic Operations**
- Selecting columns
- Filtering rows
- Sorting data
- Retrieving distinct values
- Limiting results

**Part 2: Data Cleaning**
- Identifying and handling missing values
- Removing duplicates
- Renaming columns
- Creating new variables

**Part 3: Data Aggregation**
- Grouping data
- Aggregate functions (SUM, AVG, MIN, MAX)
- Multiple aggregations
- Filtering aggregated results
- Conditional aggregation

## Repository Structure

```text
SQL-vs-Pandas/
│
├── world_bank_data.csv
│
├── SQLqueries.sql
│
├── PandasCode.py
│
└── README.md
```

## Tools & Technologies

- **SQL:** Google BigQuery
- **Python:** Pandas, NumPy
- **Data Source:** World Bank World Development Indicators

## Medium Article

Read the accompanying tutorial on Medium:

[SQL vs. Pandas: Comparing Data Manipulation Techniques]

The article walks through the examples, explains the differences between the two approaches, and demonstrates how both tools can be used to accomplish similar data manipulation tasks.

## Notes

The SQL scripts use a BigQuery table reference. To execute the queries, you may need to replace it with your own project, dataset, and table identifiers.

The Python scripts are designed to demonstrate the equivalent operations using Pandas.
