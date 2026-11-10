-- Question 5: Which age groups have the highest attrition rates?
-- Tables used: employee_attrition

USE hr_analysis;

SELECT
    CASE WHEN Age < 30 THEN '18-29' WHEN Age < 40 THEN '30-39' WHEN Age < 50 THEN '40-49' ELSE '50+' END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
	ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM employee_attrition
GROUP BY age_group
ORDER BY attrition_rate_percent DESC;