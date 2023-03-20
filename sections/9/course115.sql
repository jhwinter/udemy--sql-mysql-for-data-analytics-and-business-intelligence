USE employees;

/* HAVING syntax
SELECT column_name(s)
FROM table_name
WHERE conditions
GROUP BY column_name(s)
HAVING conditions
ORDER BY column_name(s);

NOTES:
* After HAVING, you can have a condition with an aggregate function. WHERE cannot use aggregate functions within its conditions.

* WHERE 
	- allows us to set conditions that refer to subsets of individual rows (applied before re-organizing the output into groups)
* HAVING 
	- you cannot have both an aggregated and a non-aggregated condition in the HAVING clause
    
Aggregate functions – GROUP BY and HAVING
General conditions - WHERE
*/
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
