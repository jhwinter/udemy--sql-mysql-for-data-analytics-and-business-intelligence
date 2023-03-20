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

# course 222 Stored Procedures - Example - Part 2 - exercise
USE employees;

DROP PROCEDURE IF EXISTS avg_salary;

DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN

	SELECT AVG(salary)
    FROM salaries;

END$$
DELIMITER ;

-- CALL avg_salary;
-- CALL avg_salary();
CALL employees.avg_salary();
-- CALL employees.avg_salary;