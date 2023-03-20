/*
Exercise #1:

Write a query containing a window function to obtain all salary values that employee number 10560 has ever signed a contract for.

Order and display the obtained salary values from highest to lowest.
*/
USE employees;

SELECT emp_no, salary, ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM salaries
WHERE emp_no = 10560;


/*
Exercise #2:

Write a query that upon execution, displays the number of salary contracts that each manager has ever signed while working in the company.
*/
USE employees;

SELECT dm.emp_no, (COUNT(s.salary)) AS num_of_salary_contracts
FROM dept_manager dm
JOIN salaries s ON dm.emp_no = s.emp_no
GROUP BY emp_no
ORDER BY emp_no;

/*
Exercise #3:

Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are allowed.
*/
USE employees;

SELECT emp_no, salary, RANK() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS rank_num
FROM salaries
WHERE emp_no = 10560
ORDER BY salary DESC;


/*
Exercise #4:

Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are not allowed.
*/
USE employees;

SELECT emp_no, salary, DENSE_RANK() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS rank_num
FROM salaries
WHERE emp_no = 10560
ORDER BY salary DESC;
