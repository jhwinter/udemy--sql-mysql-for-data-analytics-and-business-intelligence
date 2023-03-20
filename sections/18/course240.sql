# Types of MySQL Variables 

# Local Variables: a variable that is visible only in the BEGIN - END block in which it was created (user-defined)
-- DECLARE is a keyword that can be used when creating local variables _only_
-- DECLARE <var_name> <data type>;
DELIMITER $$
CREATE FUNCTION `f_emp_avg_salary`(p_emp_no INTEGER) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    -- v_avg_salary is visible only in the BEGIN - END block
	DECLARE v_avg_salary DECIMAL(10, 2);

	SELECT AVG(s.salary)
    INTO v_avg_salary
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no;

    RETURN v_avg_salary;
END$$
DELIMITER ;

# Session Variables: a variable that exists only for the session in which you are operating (user-defined or system variable (not all system variables can be defined as session))
-- it is _defined_ on our server, and it lives there
-- it is only visible to the connection being used
-- SET @<var_name> = <value>;
SET @s_var1 = 3;
SELECT @s_var1;

# Global Variables: a variable that applies to all connections related to a specific server (only system variable)
-- only system variables (a specific group of *pre-defined variables* in MySQL) are suitable to be global variables. Such as:
-- .max_connections() - indicates the _maximum number of connections_ to a server that can be established at a certain point of time.
-- .max_join_size() - sets the _maximum memory space_ allocated for the joins created by a certain connection
-- SET GLOBAL <var_name> = <value>;
-- SET @@global.<var_name> = <value>;
SET GLOBAL max_connections = 1000;
SET @@global.max_connections = 1;
