USE employees;

SELECT *
FROM dept_manager dm
WHERE dm.emp_no IN (
	SELECT emp_no FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01'
);