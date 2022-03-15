use employees;

select * from employees where gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');