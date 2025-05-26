-- 10-4 Exploring Views in PostgreSQL

SELECT * from employees;

CREATE View dept_avg_salary
AS
SELECT department_name, avg(salary) FROM employees GROUP BY department_name;

SELECT department_name, avg(salary) FROM employees GROUP BY department_name;

SELECT * from dept_avg_salary;

CREATE View test_view
AS
SELECT employee_name, salary, department_name 
FROM employees 
WHERE department_name in 
(SELECT department_name FROM employees WHERE department_name LIKE '%R%');



SELECT * from test_view;


-- Simplifying complex queries
-- Improved security
-- Enhanced data abstraction

-- Application ID 
-- 5262660
-- Pin Number :
-- 425229