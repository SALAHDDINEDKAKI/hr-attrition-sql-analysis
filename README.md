# HR Attrition Analysis in SQL

I finished a SQL course and wanted to test myself on something real, so I picked an HR dataset and tried to answer one question: **which employees are the most likely to leave a company?**

I wrote every query myself in MySQL, got stuck a few times, fixed my mistakes, and kept going. This repo is the result.

## The data

I used the IBM HR Analytics Employee Attrition dataset from Kaggle: https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset

- 1,470 employees, 35 columns
- Each row is one employee (age, department, job role, monthly income, overtime, job satisfaction, and whether they left)
- It's a fictional dataset made by IBM data scientists, so no real people are in it
- The file in this repo is called `data.csv`

## What I wanted to find out

1. What share of employees left overall?
2. Which departments lose the most people?
3. How much does each job role earn on average?
4. Do people who work overtime leave more often?
5. Which age groups leave the most?
6. Is job satisfaction linked to leaving?

## What I found

| # | Question | Query file | Result |
|---|----------|-----------|--------|
| 1 | Overall attrition rate | `01_overall_attrition_rate.sql` | ___ of 1,470 employees left (___%) |
| 2 | Attrition by department | `02_attrition_by_department.sql` | ___ has the highest rate (___%), ___ has the lowest (___%) |
| 3 | Average income by job role | `03_income_by_job_role.sql` | ___ earns the most on average (___ per month), ___ earns the least (___) |
| 4 | Attrition and overtime | `04_attrition_by_overtime.sql` | With overtime: ___% left. Without overtime: ___% left |
| 5 | Attrition by age group | `05_attrition_by_age_group.sql` | ___ has the highest rate (___%), ___ has the lowest (___%) |
| 6 | Attrition and job satisfaction | `06_attrition_by_job_satisfaction.sql` | Satisfaction level 1: ___% left. Level 4: ___% left |

## A small note about these results

These numbers show patterns, not causes. For example, if overtime goes together with more people leaving, that doesn't prove overtime is the reason. It's just a good place to look next. The data is also made up, so I wouldn't take the exact numbers too seriously.

## What I used

- MySQL and MySQL Workbench
- Git and GitHub

SQL things I practiced here: `GROUP BY`, `ORDER BY`, `COUNT`, `SUM`, `AVG`, `ROUND`, `CASE WHEN` (to count people who left and to build my own age groups), and calculating percentages.

## One problem I ran into

When I imported the CSV, MySQL named the first column `ï»¿Age` instead of `Age`. The file has a hidden character at the start, and the import picked it up. I fixed it by renaming the column:

```sql
ALTER TABLE employee_attrition RENAME COLUMN `ï»¿Age` TO Age;
```

If you import the same file and see the strange name, do the same.

## How to run it yourself

1. Install MySQL and MySQL Workbench.
2. Create the database:
   ```sql
   CREATE DATABASE hr_analysis;
   ```
3. In Workbench, right-click **Tables** under `hr_analysis`, choose **Table Data Import Wizard**, and import `data/data.csv`. Name the new table `employee_attrition`.
4. Check the first column name and rename it to `Age` if needed (see above).
5. Open any file from the `queries` folder and run it.

## Folder structure

```
hr-attrition-sql-analysis/
├── README.md
├── data/
│   └── data.csv
└── queries/
    ├── 00_data_check.sql
    ├── 01_overall_attrition_rate.sql
    ├── 02_attrition_by_department.sql
    ├── 03_income_by_job_role.sql
    ├── 04_attrition_by_overtime.sql
    ├── 05_attrition_by_age_group.sql
    └── 06_attrition_by_job_satisfaction.sql
```

## What I learned

The hardest part wasn't the syntax, it was thinking in groups. Once I understood that `GROUP BY` sorts rows into piles and that `SUM(CASE WHEN ...)` counts inside each pile, most of the questions followed the same pattern. I also learned to check my results, for example by making sure the group totals add up to 1,470. That's how I caught a few wrong queries that ran without any error.

## About me

Salahddine Dkaki, studying Data and Discourse Studies at TU Darmstadt and looking for an internship in data analytics.

- LinkedIn: https://www.linkedin.com/in/salahddinedkaki/
- GitHub: https://github.com/SALAHDDINEDKAKI