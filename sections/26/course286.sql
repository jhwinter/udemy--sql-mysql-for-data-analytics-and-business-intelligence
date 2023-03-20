/* Exercise 1
Find the average salary of the male and female employees in each department.
*/
USE employees;
SELECT
    d.dept_name,
	e.gender,
    AVG(s.salary) AS avg_salary
FROM salaries s
JOIN employees e ON s.emp_no = e.emp_no
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
GROUP BY de.dept_no, e.gender
ORDER BY d.dept_no;


/* Exercise 2
Find the lowest department number encountered in the 'dept_emp' table. Then, find the highest 
department number.
*/
USE employees;
SELECT 
	MIN(de.dept_no) min_dept_no,
	MAX(de.dept_no) max_dept_no
FROM dept_emp de;


/* Exercise 3
Obtain a table containing the following three fields for all individuals whose employee number is not 
greater than 10040: 
- employee number 
- the lowest department number among the departments where the employee has worked in (Hint: use 
a subquery to retrieve this value from the 'dept_emp' table) 
- assign '110022' as 'manager' to all individuals whose employee number is lower than or equal to 10020, 
and '110039' to those whose number is between 10021 and 10040 inclusive. 
Use a CASE statement to create the third field. 
If you've worked correctly, you should obtain an output containing 40 rows. 
Here’s the top part of the output. Does it remind you of an output you’ve obtained earlier in the course?
*/
USE employees;
SELECT 
	e.emp_no,
    (SELECT MIN(de.dept_no)
    FROM dept_emp de
    WHERE de.emp_no = e.emp_no) AS min_dept_no,
    CASE 
		WHEN e.emp_no <= 10020 THEN 110022
        WHEN e.emp_no BETWEEN 10021 AND 10040 THEN 110039
	END AS manager
FROM employees e
WHERE e.emp_no <= 10040;


/* Exercise 4
Retrieve a list with all employees that have been hired in the year 2000.
*/
USE employees;
SELECT * 
FROM employees
WHERE YEAR(hire_date) = 2000;


/* Exercise 5
Retrieve a list with all employees from the ‘titles’ table who are engineers. 
Repeat the exercise, this time retrieving a list with all employees from the ‘titles’ table who are senior engineers.

After LIKE, you could indicate what you are looking for with or without using parentheses. Both options are
correct and will deliver the same output. We think using parentheses is better for legibility and that’s why
it is the first option we’ve suggested.
*/
USE employees;
SELECT e.*, t.title
FROM titles t
JOIN employees e ON t.emp_no = e.emp_no
WHERE t.title LIKE '%Engineer%';

SELECT e.*, t.title
FROM titles t
JOIN employees e ON t.emp_no = e.emp_no
WHERE t.title LIKE '%Senior Engineer%';









