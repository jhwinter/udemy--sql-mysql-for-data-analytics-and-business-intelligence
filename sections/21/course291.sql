USE employees;

WITH cte1 AS (
	SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
	SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
    FROM salaries s
		JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
    GROUP BY s.emp_no
)
SELECT 
	SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_highest_salaries_above_avg,
    COUNT(e.emp_no) AS total_no_female_contracts,
    CONCAT(ROUND((SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) / COUNT(e.emp_no)) * 100, 2), '% percentage')
FROM employees e
	JOIN cte2 c2 ON c2.emp_no = e.emp_no
    CROSS JOIN cte1 c1;

-- we don't need to join employees as shown below
WITH cte1 AS (
	SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
	SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
    FROM salaries s
		JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
    GROUP BY s.emp_no
)
SELECT 
	SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_highest_salaries_above_avg,
    COUNT(c2.emp_no) AS total_no_female_contracts,
    CONCAT(ROUND((SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) / COUNT(c2.emp_no)) * 100, 2), '% percentage')
FROM cte2 c2
    CROSS JOIN cte1 c1;

-- final version
WITH cte_avg_salary AS (
	SELECT AVG(salary) AS avg_salary FROM salaries
),
cte_f_highest_salary AS (
	SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
    FROM salaries s
		JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
    GROUP BY s.emp_no
)
SELECT 
	SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_highest_salaries_above_avg,
    COUNT(e.emp_no) AS total_no_female_contracts,
    CONCAT(ROUND((SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) / COUNT(e.emp_no)) * 100, 2), '% percentage')
FROM employees e
	JOIN cte_f_highest_salary c2 ON c2.emp_no = e.emp_no
    CROSS JOIN cte_avg_salary c1;



/* Exercise #1:

Use two common table expressions and a SUM() function in the SELECT statement of a query to obtain the number of male employees whose highest salaries have been below the all-time average.
*/
WITH cte_avg_salary AS (
	SELECT AVG(salary) AS avg_salary FROM salaries
),
cte_m_highest_salary AS (
	SELECT s.emp_no, MAX(s.salary) AS m_highest_salary
    FROM salaries s
		JOIN employees e ON s.emp_no = e.emp_no AND e.gender = 'M'
	GROUP BY s.emp_no
)
SELECT 
	SUM(CASE WHEN c2.m_highest_salary < c1.avg_salary THEN 1 ELSE 0 END) AS m_highest_salaries_below_avg,
    COUNT(c2.m_highest_salary) AS total_num_of_m_salary,
	CONCAT(ROUND((SUM(CASE WHEN c2.m_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) / COUNT(c2.emp_no)) * 100, 2), '% percentage')
FROM employees e
	JOIN cte_m_highest_salary c2 ON e.emp_no = c2.emp_no
	CROSS JOIN cte_avg_salary c1;

/*
Exercise #2:

Use two common table expressions and a COUNT() function in the SELECT statement of a query to obtain the number of male employees whose highest salaries have been below the all-time average.
*/
WITH cte_avg_salary AS (
	SELECT AVG(salary) AS avg_salary FROM salaries
),
cte_m_highest_salary AS (
	SELECT s.emp_no, MAX(s.salary) AS m_highest_salary
    FROM salaries s
		JOIN employees e ON s.emp_no = e.emp_no AND e.gender = 'M'
	GROUP BY s.emp_no
)
SELECT 
	COUNT(CASE WHEN c2.m_highest_salary < c1.avg_salary THEN c2.m_highest_salary ELSE NULL END) AS m_highest_salaries_below_avg,
    COUNT(c2.m_highest_salary) AS total_num_of_m_salary,
	CONCAT(ROUND((SUM(CASE WHEN c2.m_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) / COUNT(c2.emp_no)) * 100, 2), '% percentage')
FROM employees e 
	JOIN cte_m_highest_salary c2 ON e.emp_no = c2.emp_no
	CROSS JOIN cte_avg_salary c1;

/*
Exercise #3:

Does the result from the previous exercise change if you used the Common Table Expression (CTE) for the male employees' highest salaries in a FROM clause, as opposed to in a join?
*/
WITH cte_avg_salary AS (
	SELECT AVG(salary) AS avg_salary FROM salaries
),
cte_m_highest_salary AS (
	SELECT s.emp_no, MAX(s.salary) AS m_highest_salary
    FROM salaries s
		JOIN employees e ON s.emp_no = e.emp_no AND e.gender = 'M'
	GROUP BY s.emp_no
)
SELECT 
	SUM(CASE WHEN c2.m_highest_salary < c1.avg_salary THEN 1 ELSE 0 END) AS m_highest_salaries_below_avg,
    COUNT(c2.m_highest_salary) AS total_num_of_m_salary,
	CONCAT(ROUND((SUM(CASE WHEN c2.m_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) / COUNT(c2.emp_no)) * 100, 2), '% percentage')
FROM cte_m_highest_salary c2
	CROSS JOIN cte_avg_salary c1;

