/*
Compare the average salary of female versus male employees in 
the entire company until year 2002, and add a filter allowing 
you to see that per each departmnet.

should use a line chart
*/

USE employees_mod;

SELECT
	e.gender,
    d.dept_name,
	ROUND(AVG(s.salary), 2) AS avg_salary,
    YEAR(s.from_date) AS calendar_year
FROM t_salaries s
JOIN t_employees e ON s.emp_no = e.emp_no
JOIN t_dept_emp de ON e.emp_no = de.emp_no
JOIN t_departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_no, e.gender, calendar_year
HAVING calendar_year <= 2002
ORDER BY d.dept_no;
