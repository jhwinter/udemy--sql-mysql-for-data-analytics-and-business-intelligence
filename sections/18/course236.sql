# course 236 Stored routines - conclusion
# showing that functions can be used in SELECT statements, but stored procedures cannot
USE employees;

SET @v_emp_no = 11300;
SELECT 
	emp_no,
    first_name,
    last_name,
    f_emp_avg_salary(@v_emp_no) AS avg_salary
FROM 
	employees
WHERE 
	emp_no = @v_emp_no