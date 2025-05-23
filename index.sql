-- 10-8 Indexing Techniques in PostgreSQL


SELECT * from  employees;


EXPLAIN ANALYSE
-- SELECT * from employees WHERE emp_no = '10004';
SELECT * from employees WHERE department_name = 'Sales';

-- CREATE INDEX idx_employees_last_name, idx lekhte hoy , employees mean table name, _last_name column name
CREATE INDEX idx_employees_department_name
on employees (department_name);

-- CREATE INDEX idx_employees_last_name
-- on employees (last_name);

SHOW data_directory;

-- jeigolo WHERE, JOIN, PRIMARY KEY, FOREIGN KEY te ase segolo INDEX korbo
-- FOREIGN KEY te INDEX korar try korbo

