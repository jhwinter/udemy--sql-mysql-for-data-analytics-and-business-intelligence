USE employees;

SELECT *
FROM employees
WHERE hire_date > '2000-01-01';

WITH emp_hired_from_jan_2000 AS (
	SELECT * FROM employees WHERE hire_date > '2000-01-01'
),
highest_contract_salary_values AS (
	SELECT e.emp_no, MAX(s.salary)
    FROM salaries s
		JOIN emp_hired_from_jan_2000 e ON e.emp_no = s.emp_no
	GROUP BY e.emp_no
)
SELECT * FROM highest_contract_salary_values;

