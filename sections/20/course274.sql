USE employees;

SELECT 
	d.dept_no, 
    d.dept_name, 
    dm.emp_no, 
    RANK() OVER w AS dept_salary_ranking, 
    s.salary, 
    s.from_date AS salary_from_date,
    s.to_date AS salary_to_date,
    dm.from_date AS dept_manager_from_date,
    dm.to_date AS dept_manager_to_date
FROM dept_manager dm
JOIN salaries s ON dm.emp_no = s.emp_no 
	AND s.from_date BETWEEN dm.from_date AND dm.to_date
    AND s.to_date BETWEEN dm.from_date AND dm.to_date
JOIN departments d ON dm.dept_no = d.dept_no
WINDOW w AS (PARTITION BY dm.dept_no ORDER BY s.salary DESC);



/* Exercise #1:

Write a query that ranks the salary values in descending order of all contracts signed by employees numbered between 10500 and 10600 inclusive. Let equal salary values for one and the same employee bear the same rank. Also, allow gaps in the ranks obtained for their subsequent rows.

Use a join on the “employees” and “salaries” tables to obtain the desired result.
*/
USE employees;

SELECT
	e.emp_no,
    s.salary,
    RANK() OVER w AS employee_salary_ranking
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no BETWEEN 10500 AND 10600
WINDOW w AS (PARTITION BY e.emp_no ORDER BY s.salary DESC);

/*
Exercise #2:

Write a query that ranks the salary values in descending order of the following contracts from the "employees" database:

- contracts that have been signed by employees numbered between 10500 and 10600 inclusive.

- contracts that have been signed at least 4 full-years after the date when the given employee was hired in the company for the first time.

In addition, let equal salary values of a certain employee bear the same rank. Do not allow gaps in the ranks obtained for their subsequent rows.

Use a join on the “employees” and “salaries” tables to obtain the desired result.
*/
USE employees;

SELECT
	e.emp_no,
    s.salary,
    DENSE_RANK() OVER w AS employee_salary_ranking,
    e.hire_date,
    s.from_date,
    YEAR(s.from_date) - YEAR(e.hire_date) AS years_from_start
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no BETWEEN 10500 AND 10600
	AND (YEAR(s.from_date) - YEAR(e.hire_date)) >= 4
WINDOW w AS (PARTITION BY e.emp_no ORDER BY s.salary DESC);