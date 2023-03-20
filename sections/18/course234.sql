# course 232 User-defined functions in MySQL
USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10, 2)
# how to solve error code: 1418 - use the characteristic(s) below
DETERMINISTIC
-- NO SQL 
-- READS SQL DATA
# unsafe way to solve error code 1418 - SET @@global.log_bin_trust_function_creators := 1;
BEGIN
	DECLARE v_avg_salary DECIMAL(10, 2);

	SELECT AVG(s.salary)
    INTO v_avg_salary
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no;

    RETURN v_avg_salary;
END$$
DELIMITER ;

SELECT f_emp_avg_salary(11300);


# course 234 User-defined functions in MySQL - exercise
USE employees;
DROP FUNCTION IF EXISTS emp_info;

DELIMITER $$
CREATE FUNCTION emp_info(p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
	DECLARE v_max_from_date DATE;
    DECLARE v_salary DECIMAL(10, 2);

	SELECT MAX(s.from_date)
    INTO v_max_from_date
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.first_name = p_first_name
		AND e.last_name = p_last_name;
	
	SELECT s.salary 
    INTO v_salary
    FROM employees e 
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.first_name = p_first_name
		AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;

    RETURN v_salary;
END$$
DELIMITER ;

SELECT emp_info('Aruna', 'Journel');
