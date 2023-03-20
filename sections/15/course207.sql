USE employees;

SELECT *
FROM employees e
WHERE EXISTS(
	SELECT *
    FROM titles t
    WHERE t.emp_no = e.emp_no
		AND t.title = 'Assistant Engineer'
);