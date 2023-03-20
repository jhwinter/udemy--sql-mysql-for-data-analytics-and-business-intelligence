# course 245 MySQL Indexes

# syntax for creating index
-- CREATE INDEX <index_name> ON <table_name> (<column_1>, <column_2>, ...);

# how many people have been hired after the 1st of January 2000?
SELECT * FROM employees WHERE hire_date > '2000-01-01';
-- Before: duration 0.152 sec
-- After: duration 0.00064 sec
CREATE INDEX i_hire_date ON employees (hire_date);


# SELECT all employees bearing the name "Georgi Facello"
SELECT * FROM employees WHERE first_name = 'Georgi' AND last_name = 'Facello';
-- Before: duration 0.115 sec
-- After: duration 0.00042 sec
CREATE INDEX i_composite ON employees (first_name, last_name);


# primary and unique keys are indexes
-- SHOW INDEX FROM <table_name> FROM <database>;
-- SHOW INDEX FROM <table_name>;  -- this only works with a default database
SHOW INDEX FROM employees from employees;
SHOW INDEX FROM employees;



# course 246 MySQL Indexes - exercise 1
# Drop the 'i_hire_date' index

-- both syntax are valid
ALTER TABLE employees DROP INDEX i_hire_date;
DROP INDEX i_hire_date ON employees;



# course 248 MySQL Indexes - exercise 2
# Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
# Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.
USE employees;

SELECT * FROM salaries WHERE salary > 89000;
-- before: duration 0.0024 sec 
-- after: duration 0.0016 sec
CREATE INDEX i_salary ON salaries (salary);
