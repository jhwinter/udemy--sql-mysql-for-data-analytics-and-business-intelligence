# Create a trigger that checks if the hire date of an employee is higher than the current date. 
# If true, set this date to be the current date. 
# Format the output appropriately (YY-MM-DD).

USE employees;
DROP TRIGGER IF EXISTS trig_hire_date;

DELIMITER $$
CREATE TRIGGER trig_hire_date
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN 
	IF NEW.hire_date > CURDATE() THEN 
		SET NEW.hire_date = DATE_FORMAT(CURDATE(), '%y-%m-%d'); 
	END IF; 
END $$
DELIMITER ;
