# course 245 MySQL Indexes

# syntax for creating index
-- CREATE INDEX <index_name> ON <table_name> (<column_1>, <column_2>, ...);

# how many people have been hired after the 1st of January 2000?
-- Before: duration 0.152 sec
SELECT * FROM employees WHERE hire_date > '2000-01-01';
-- After: duration 0.00064 sec
CREATE INDEX i_hire_date ON employees (hire_date);


# SELECT all employees bearing the name "Georgi Facello"
-- Before: duration 0.115 sec
SELECT * FROM employees WHERE first_name = 'Georgi' AND last_name = 'Facello';
-- After: duration 0.00042 sec
CREATE INDEX i_composite ON employees (first_name, last_name);


# primary and unique keys are indexes
-- SHOW INDEX FROM <table_name> FROM <database>;
-- SHOW INDEX FROM <table_name>;  -- this only works with a default database
SHOW INDEX FROM employees from employees;
SHOW INDEX FROM employees;
