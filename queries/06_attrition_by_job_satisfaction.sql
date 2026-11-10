-- Question 6: Is job satisfaction linked to attrition?
-- Tables used: employee_attrition

USE hr_analysis;
    
SELECT
	jobsatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM employee_attrition
GROUP BY jobsatisfaction
ORDER BY jobsatisfaction;