USE employees;

SELECT emp_no, AVG(salary) AS avg_emp_salary
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no ASC;

SELECT *, AVG(salary)
FROM salaries
WHERE salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

SELECT *, AVG(salary)
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;
