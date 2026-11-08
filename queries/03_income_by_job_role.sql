-- Question 3: What is the average monthly income by job role?
-- Tables used: employee_attrition

USE hr_analysis;

SELECT
    JobRole,
    COUNT(*) AS total_employees,
    ROUND(AVG(MonthlyIncome), 2) AS Average_income
FROM employee_attrition
GROUP BY JobRole
ORDER BY Average_income DESC;