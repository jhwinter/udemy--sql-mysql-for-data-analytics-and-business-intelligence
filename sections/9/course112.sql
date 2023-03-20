USE employees;

SELECT salary, COUNT(salary) AS emps_with_same_salary
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY salary;