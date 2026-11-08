-- Data check: confirm row count, no duplicate employees, and the values of Attrition
-- Tables used: employee_attrition

USE hr_analysis;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT EmployeeNumber) AS distinct_employees
FROM employee_attrition;

SELECT
    Attrition,
    COUNT(*) AS number_of_employees
FROM employee_attrition
GROUP BY Attrition;