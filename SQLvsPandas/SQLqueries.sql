-- SQL vs Pandas: Comparing Data Manipulation Techniques

-- Part 1. Basic Operations

--1. Selecting Columns (SELECT)
-- Question: What are the country names, regions, and population figures in our dataset?

SELECT
  country_name,
  region,
  population 
FROM `project1-512414.world_bank_data.world_bank_table`;

--2. Selecting Unique Values (DISTINCT)
-- Question: Which unique regions are represented in our dataset?

SELECT DISTINCT region
FROM `project1-512414.world_bank_data.world_bank_table`;

--3. Filtering Rows (WHERE)
-- Question: Which countries had a population greater than 50 million in 2024?

SELECT 
  country_name, 
  population
FROM `project1-512414.world_bank_data.world_bank_table` 
WHERE year = 2024 
  AND population > 50000000;

--4. Filtering with Multiple Conditions (AND / OR)
-- Question: Which countries had GDP per capita above 30,000 international dollars AND life expectancy above 80 years in 2024?

SELECT 
  country_name, 
  gdp_per_capita, 
  life_expectancy
FROM `project1-512414.world_bank_data.world_bank_table` 
WHERE year = 2024
  AND gdp_per_capita > 30000 
  AND life_expectancy > 80;

--5. Filtering Multiple Values (IN)
-- Question: What are the population figures for Canada, Germany, Japan, and Australia in 2024?

SELECT
  country_name,
  population 
FROM `project1-512414.world_bank_data.world_bank_table` 
WHERE year = 2024
  AND country_name IN ('Canada', 'Germany','Japan', 'Australia');

--6. Filtering a Range of Values (BETWEEN)
-- Question: Which countries had GDP per capita between 20,000 and 40,000 international dollars in 2024?

SELECT 
  country_name, 
  gdp_per_capita
FROM `project1-512414.world_bank_data.world_bank_table` 
WHERE year = 2024
  AND gdp_per_capita BETWEEN 20000 AND 40000;

--7. Sorting Data (ORDER BY)
-- Question: Which countries had the highest GDP per capita in 2024?

SELECT 
  country_name, 
  gdp_per_capita
FROM `project1-512414.world_bank_data.world_bank_table` 
WHERE year = 2024 
ORDER BY gdp_per_capita DESC;

-- Sorting by multiple columns

SELECT 
  country_name, 
  gdp_per_capita
FROM `project1-512414.world_bank_data.world_bank_table` 
WHERE year = 2024 
ORDER BY 
  region ASC, 
  gdp_per_capita DESC;

--8. Limiting Results (LIMIT)
-- Question: What are the five most populous countries in 2024?

SELECT 
  country_name, 
  population
FROM `project1-512414.world_bank_data.world_bank_table` 
WHERE year = 2024
ORDER BY population DESC
LIMIT 5;

-----

-- Part 2. Data Cleaning

--1. Identifying Missing Values
-- Question: Which countries have missing unemployment data in 2024?

SELECT 
  country_name, 
  unemployment_rate
FROM `project1-512414.world_bank_data.world_bank_table` 
WHERE year = 2024
  AND unemployment_rate IS NULL;

--2. Handling Missing Values
-- Question: How can we replace missing unemployment values with a default value?

SELECT 
  country_name, 
  unemployment_rate,
  COALESCE(unemployment_rate, -1) AS unemployment_filled
FROM `project1-512414.world_bank_data.world_bank_table` 
WHERE year = 2024;

--3. Removing Duplicates
-- Question: Are there duplicate country-year records in our dataset?

SELECT 
  country_code,
  year,
  COUNT(*) AS record_count
 FROM `project1-512414.world_bank_data.world_bank_table`
 GROUP BY 
  country_code,
  year
HAVING COUNT(*) > 1;

-- Removing duplicates

SELECT DISTINCT
    country_code,
    year
FROM `project1-512414.world_bank_data.world_bank_table`;

--4. Renaming Columns (AS)
-- Question: How can we rename columns to make our dataset easier to understand?

SELECT 
  country_name AS country,
  country_code AS iso_code,
  year,
  population AS total_population,
  gdp_per_capita
 FROM `project1-512414.world_bank_data.world_bank_table`
 LIMIT 10;

--5. Creating Conditional Columns (CASE WHEN)
-- Question: How can we categorize countries according to their GDP per capita in 2024?

SELECT 
  country_name,
  gdp_per_capita,
  CASE
    WHEN gdp_per_capita IS NULL THEN 'Unknown'
    WHEN gdp_per_capita < 15000 THEN 'Low'
    WHEN gdp_per_capita <= 40000 THEN 'Medium'
    ELSE 'High'
  END AS gdp_category
 FROM `project1-512414.world_bank_data.world_bank_table`
 WHERE year = 2024;

-----

-- Part 3. Data Aggregation

--1. Grouping Data (GROUP BY)
-- Question: What is the average life expectancy in each region in 2024?

SELECT 
  region,
  AVG(life_expectancy) AS avg_life_expectancy
FROM `project1-512414.world_bank_data.world_bank_table`
WHERE year = 2024
GROUP BY region
ORDER BY AVG(life_expectancy) DESC;

--2. Aggregate Functions (SUM, AVG, MIN, MAX)
-- Question: What are the total population, average GDP per capita, and maximum life expectancy in each region in 2024?

SELECT 
  region,
  SUM(population) AS total_population,
  AVG(gdp_per_capita) AS avg_gdp_per_capita,
  MAX(life_expectancy) AS max_life_expentancy
FROM `project1-512414.world_bank_data.world_bank_table`
WHERE year = 2024
GROUP BY region;

--3. Multiple Aggregations
-- Question: What are the average, minimum, and maximum GDP per capita values in each region in 2024?

SELECT 
  region,
  AVG(gdp_per_capita) AS avg_gdp_per_capita,
  MIN(gdp_per_capita) AS min_gdp_per_capita,
  MAX(gdp_per_capita) AS max_gdp_per_capita
FROM `project1-512414.world_bank_data.world_bank_table`
WHERE year = 2024
GROUP BY region;

--4. Filtering Aggregated Results (HAVING)
-- Question: Which regions had an average life expectancy above 80 years in 2024?

SELECT 
  region,
  AVG(life_expectancy) AS avg_life_expectancy
FROM `project1-512414.world_bank_data.world_bank_table`
WHERE year = 2024
GROUP BY region
HAVING AVG(life_expectancy) > 80;

--5. Conditional Aggregation (COUNTIF)
-- Question: How many countries in each region had an unemployment rate above 10% in 2024? 

SELECT 
  region,
  COUNTIF(unemployment_rate > 10) AS high_unemployment
FROM `project1-512414.world_bank_data.world_bank_table`
WHERE year = 2024
GROUP BY region;

-----

-- Putting It All Together - Practical Example
-- Question: Which countries in each region had a population above 50 million and GDP per capita above 20,000 international dollars in 2024? 
-- Show their population, GDP per capita, and life expectancy, and sort the results by region and GDP per capita.

SELECT 
  country_name,
  region,
  gdp_per_capita,
  life_expectancy
FROM `project1-512414.world_bank_data.world_bank_table`
WHERE
  year = 2024 
  AND population > 50000000
  AND gdp_per_capita > 20000
ORDER BY 
  region ASC,
  gdp_per_capita DESC;

-----
