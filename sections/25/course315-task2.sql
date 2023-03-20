/* course 270 - Task 2
Compare the number of male managers to the number of female managers 
from different departments for each year, starting from 1990.
*/
USE employees_mod;

SELECT
	d.dept_name,
    e1.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
		-- BETWEEN is inclusive, so this is the same as the suggested answer
		-- WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
		WHEN e.calendar_year BETWEEN YEAR(dm.from_date) AND YEAR(dm.to_date) THEN 1
        ELSE 0
	END AS active
FROM (SELECT 
		YEAR(hire_date) AS calendar_year
    FROM t_employees 
    GROUP BY calendar_year) e
CROSS JOIN t_dept_manager dm
JOIN t_departments d ON dm.dept_no = d.dept_no
JOIN t_employees e1 ON dm.emp_no = e1.emp_no
ORDER BY dm.emp_no, calendar_year;


-- testing out the from subquery and joins
SELECT *
FROM (SELECT 
		YEAR(hire_date) AS calendar_year
    FROM t_employees 
    GROUP BY calendar_year) e
CROSS JOIN t_dept_manager dm
JOIN t_departments d ON dm.dept_no = d.dept_no
JOIN t_employees e1 ON dm.emp_no = e1.emp_no
ORDER BY dm.emp_no, calendar_year;
