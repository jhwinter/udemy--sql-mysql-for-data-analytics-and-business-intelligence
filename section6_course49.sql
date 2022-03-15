-- section 6 course 49 and 50
-- USE Sales;

-- DROP TABLE sales;

-- CREATE TABLE sales
-- (
-- 	purchase_number INT AUTO_INCREMENT,
--     date_of_purchase DATE,
--     customer_id INT,
--     item_code VARCHAR(10),
--     PRIMARY KEY (purchase_number)-- ,
--     -- FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
-- );

-- ALTER TABLE sales
-- ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

-- ALTER TABLE sales
-- DROP FOREIGN KEY sales_ibfk_1;


-- section 6 course 51
USE Sales;

DROP TABLE sales;
DROP TABLE customers;
DROP TABLE items;
DROP TABLE companies;

