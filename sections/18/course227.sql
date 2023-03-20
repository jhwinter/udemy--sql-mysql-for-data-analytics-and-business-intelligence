# course 226 Stored procedures with an output parameter
USE employees;
DROP PROCEDURE IF EXISTS emp_avg_salary_out;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10, 2))
BEGIN
	SELECT AVG(s.salary)
    INTO p_avg_salary
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no;
END$$
DELIMITER ;

SET @p_avg_salary = 0;
CALL employees.emp_avg_salary_out(11300, @p_avg_salary);
SELECT @p_avg_salary;


# course 227 Stored procedures with an output parameter - exercise
USE employees;
DROP PROCEDURE IF EXISTS emp_info;

DELIMITER $$
CREATE PROCEDURE emp_info(IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), OUT p_emp_no INTEGER)
BEGIN
	SELECT e.emp_no
    INTO p_emp_no
    FROM employees e
    WHERE e.first_name = p_first_name
		AND e.last_name = p_last_name;
END$$
DELIMITER ;

SET @emp_no = 0;
CALL employees.emp_info('Mary', 'Sluis', @emp_no);
SELECT @emp_no;

