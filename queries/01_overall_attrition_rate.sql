-- Question 2: Which departments lose the most employees?
-- Tables used: employee_attrition

USE hr_analysis;

SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM employee_attrition
GROUP BY Department
ORDER BY attrition_rate_percent DESC;