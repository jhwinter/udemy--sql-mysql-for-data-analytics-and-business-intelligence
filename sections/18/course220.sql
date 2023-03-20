# course 220 Stored Procedures - Example - Part 1
USE employees;

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN

	SELECT *
    FROM employees
    LIMIT 1000;

END$$
DELIMITER ;

# course 221 Stored Procedures - Example - Part 2
-- This also works, but it is best practice to use parentheses
-- CALL employees.select_employees;
CALL employees.select_employees();
CALL select_employees();
