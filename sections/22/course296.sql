USE employees;

CREATE TEMPORARY TABLE f_highest_salaries
SELECT s.emp_no, MAX(s.salary) AS f_highest_salary
FROM salaries s
	JOIN employees e ON s.emp_no = e.emp_no AND e.gender = 'F'
GROUP BY s.emp_no;

SELECT * FROM f_highest_salaries;

SELECT * FROM f_highest_salaries WHERE emp_no <= '10010';

-- both work the same
DROP TABLE IF EXISTS f_highest_salaries;
DROP TEMPORARY TABLE IF EXISTS f_highest_salaries;

SELECT * FROM f_highest_salaries;

SELECT * FROM departments;



/* Exercise #1:

Store the highest contract salary values of all male employees in a temporary table called male_max_salaries.
*/
CREATE TEMPORARY TABLE male_max_salaries
SELECT s.emp_no, MAX(s.salary) AS m_highest_salary
FROM salaries s
	JOIN employees e ON s.emp_no = e.emp_no AND e.gender = 'M'
GROUP BY s.emp_no;

/*
Exercise #2:

Write a query that, upon execution, allows you to check the result set contained in the male_max_salaries temporary table you created in the previous exercise.
*/
SELECT * FROM male_max_salaries;