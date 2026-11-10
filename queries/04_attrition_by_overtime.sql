-- Question 4: Do employees who work overtime leave more often?
-- Tables used: employee_attrition

USE hr_analysis;

SELECT
	overtime,
	COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
	ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM employee_attrition
GROUP BY overtime
ORDER BY attrition_rate_percent DESC;
