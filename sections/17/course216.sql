USE employees;

CREATE OR REPLACE VIEW v_manager_avg_salary
AS 
SELECT ROUND(AVG(s.salary), 2) AS avg_salary 
FROM salaries s
JOIN dept_manager dm ON s.emp_no = dm.emp_no;
