-- USE Sales;

-- DROP TABLE IF EXISTS customers;

-- CREATE TABLE customers 
-- (
-- 	customer_id INT AUTO_INCREMENT,
--     first_name VARCHAR(255),
--     last_name VARCHAR(255),
--     gender ENUM('M', 'F'),
--     email_address VARCHAR(255),
--     number_of_complaints INT, -- DEFAULT 0,
--     PRIMARY KEY (customer_id)
-- );

-- ALTER TABLE customers
-- CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

-- INSERT INTO customers (first_name, last_name, gender)
-- VALUES ('Peter', 'Figaro', 'M');

-- SELECT * FROM customers;

-- ALTER TABLE customers
-- ALTER COLUMN number_of_complaints DROP DEFAULT;



USE Sales;

DROP TABLE IF EXISTS companies;

CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number VARCHAR(255),
    PRIMARY KEY (company_id),
    UNIQUE KEY (headquarters_phone_number)
--     INDEX (headquarters_phone_number),
);

DROP TABLE IF EXISTS companies;
