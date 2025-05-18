CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);


INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES
('John', 'Doe', 20, 'A', 'Math', 'john.doe@example.com', '2004-01-15', 'O+', 'USA'),
('Jane', 'Smith', 21, 'B', 'History', 'jane.smith@example.com', '2003-05-20', 'A-', 'Canada'),
('Alice', 'Johnson', 19, 'A', 'Physics', 'alice.johnson@example.com', '2002-11-08', 'B+', 'UK'),
('Bob', 'Williams', 22, 'C', 'Chemistry', 'bob.williams@example.com', '2001-07-03', 'AB-', 'Australia'),
('Charlie', 'Brown', 20, 'B', 'English', NULL, '2004-03-30', 'A+', 'New Zealand'),
('Emma', 'Jones', 23, 'B', 'Biology', 'emma.jones@example.com', '2000-09-12', 'A-', 'USA'),
('Michael', 'Johnson', 22, 'A', 'Physics', 'michael.johnson@example.com', '2002-04-05', 'O-', 'Canada'), 
('Olivia', 'Davis', 21, 'A', 'Math', 'olivia.davis@example.com', '2003-12-18', 'B+', 'UK'),
('William', 'Taylor', 20, 'B', 'Chemistry', NULL, '2004-08-30', 'A-', 'Australia'),
('Sophia', 'Brown', 24, 'C', 'English', 'sophia.brown@example.com', '1999-06-25', 'AB+', 'New Zealand'),
('Liam', 'Miller', 22, 'C', 'History', 'liam.miller@example.com', '2002-05-10', 'A+', 'USA'),
('Ava', 'Anderson', 21, 'B', 'Biology', 'ava.anderson@example.com', '2003-11-15', 'B-', 'Canada'),
('Noah', 'Martinez', 20, 'A', 'Physics', NULL, '2004-04-28', 'O-', 'UK'),
('Isabella', 'Clark', 20, 'C', 'Chemistry', 'isabella.clark@example.com', '2003-10-03', 'A-', 'Australia'),
('Ethan', 'Garcia', 23, 'A', 'Math', 'ethan.garcia@example.com', '2000-12-05', 'B+', 'New Zealand'),
('Sophia', 'Moore', 22, 'A', 'English', 'sophia.moore@example.com', '2002-12-05', 'O-', 'UK');

-- * mark dile all data dekhabe
-- SELECT * FROM students;

-- 1 ta ba multiple data dekhte pg_collation_is_visible
-- SELECT email,age,blood_group FROM students;

-- orginal name email but dekhanor somy onno name e dekhte caile
-- SELECT email as "Student Email" FROM students; 

-- ascending order or descending order dia dekhte caile 
-- SELECT * FROM students ORDER BY first_name ASC;
-- SELECT * FROM students ORDER BY age DESC;
-- SELECT country FROM students ORDER BY country ASC;

-- UNIQUE koita ase or DOUBLE thakle only 1ta nia baki golo niba na 
-- SELECT DISTINCT country FROM students;

-- SELECT * FROM students
--   WHERE country ='USA';

-- SELECT * FROM students
--   WHERE grade ='A' AND course='Physics';

-- SELECT * FROM students
--      WHERE country = 'USA' OR country='Australia';

-- SELECT * FROM students
--      WHERE (country = 'USA' OR country='Australia') AND age=20;

SELECT * FROM students
-- WHERE age <
-- WHERE age > 20 AND course ='History';
-- WHERE age > 20;

-- usa na emon jinis golo dibe
-- WHERE country <> 'USA';

    --  SELECT students FROM the USA 
    --  SELECT students WITH 'A' grade in Physics  
    --  SELECT students WITH a SPECIFIC blood group ('A+')
    --  SELECT students FROM the USA or FROM Australia
    --  SELECT students FROM the USA or FROM Australia and the age is 20
    --  SELECT students WITH a grade of 'A' or 'B' in Math or Physics

-- =============================================================================
-- =============================================================================
-- =============================================================================
    -- 8-6 Exploring Scalar and Aggregate Functions in PostgreSQL

   
    /*Postgres e function 2 proker 
    @Scalar function 
    UPPER() Converts a string to uppercase.
    LOWER() Converts a string to lowercase.
    CONCAT() Concatenates two or more strings.
    LENGTH() Returns the number of characters in a string.

    @Aggregate function
    AVG() Calculate the average of a set of values.
    MAX() Returns the max value in a set.
    MIN() Returns the minimum value in a set.
    SUM Calculates the sum of values in a set.
    COUNT() Count the number of rows in a set.
    */

     -- SELECT upper(first_name) as first_name_in_upper_case, * from students;      

    -- SELECT concat(first_name, '  ' ,last_name) from students;

    -- SELECT length(first_name) FROM students;

    -- SELECT avg(age) FROM students;

    -- SELECT min(age) FROM students;

    -- SELECT count(*) FROM students;

    -- SELECT max(length(first_name)) FROM students;


-- =============================================================================
-- =============================================================================
-- =============================================================================
-- 8-7 Logical Negation NOT, understanding NULL and the Null-Coalescing Operator in PostgreSQL
SELECT * FROM students
WHERE NOT country = 'USA';  
 
SELECT length(first_name) FROM students; 

SELECT * FROM students
-- WHERE email != NULL;
WHERE email = 'alice.johnson@example.com';
-- WHERE email IS NULL;
-- WHERE email IS NOT NULL;

-- SELECT COALESCE(email, 'Email Not Provided') as "Email", blood_group, first_name FROM students;

-- SELECT * FROM students WHERE country = 'USA' OR country = 'Canada' OR country = 'UK' ;

SELECT * FROM students 
    WHERE country IN('USA', 'UK', 'Canada') ;
SELECT * FROM students 
    WHERE country NOT IN('USA', 'UK', 'Canada') ;

SELECT * FROM students
    WHERE age BETWEEN 19 AND 23;

SELECT * FROM students
    WHERE dob BETWEEN '2000-01-01' AND '2005-01-01';

SELECT * FROM students
    WHERE dob BETWEEN '2000-01-01' AND '2005-01-01' ORDER BY dob;

-- LIKE er Use . LIKE case sensitive ( capital letter dile capital or small letter dile small, jeta dei seta asbe )
-- % er sathe jeta thakbe seta word e thakle seta dekhabe , start e jai thakok na keno ses e am thaklei hobe
SELECT * FROM students
    WHERE first_name LIKE '%am';

-- A% dia first e A ase eta bojai
SELECT * FROM students
    WHERE first_name LIKE 'A%';

-- '__' 2 ta dile first e 2 ta word er por a ba onno kiso thkbe, '___' 3ta dile 1st e 3 ta word thkbe
SELECT * FROM students
    WHERE first_name LIKE '__a%';

-- ekhane % sign na thakle fixed ses e a thakbe, and '___' thaker fole total word 4 ta hobe
SELECT * FROM students
    WHERE first_name LIKE '___a';

SELECT * FROM students
    WHERE first_name LIKE '___a_';

-- ILIKE case sensitive na , capital dile capital or small aste pare , small dile capital or small aste pare
SELECT * FROM students
    WHERE first_name ILIKE 'A%';

-- =============================================================================
-- =============================================================================
-- =============================================================================

-- 8-9 Pagination with Limit Offset and Data Deletion in PostgreSQL

-- LIMIT
SELECT * FROM students LIMIT 5;

SELECT * FROM students
   WHERE country IN('USA', 'UK', 'Canada') LIMIT 5; 

-- OFFSET (1st theke koita data bad dibe)
-- SELECT * FROM students
--    WHERE country IN('USA', 'UK', 'Canada') LIMIT 5; 

SELECT * FROM students LIMIT 5 OFFSET 2;

-- Pagination e  backend e , 1st page e  0 dibo , 2nd page 1, evave hobe 
SELECT * FROM students LIMIT 5 OFFSET 5 * 0;
SELECT * FROM students LIMIT 5 OFFSET 5 * 1;
SELECT * FROM students LIMIT 5 OFFSET 5 * 2;

-- DELETE Method

SELECT * FROM students;

-- SELECT * FROM students WHERE country = 'USA';

DELETE FROM students;

-- DELETE FROM students
--     WHERE grade = 'B';

DELETE FROM students
    WHERE grade = 'C' AND country = 'USA';


-- =============================================================================
-- =============================================================================
-- =============================================================================

-- 8-10 Understanding and Using the UPDATE Operator in PostgreSQL

-- Update Method
SELECT * FROM students;

UPDATE students
   SET email = 'default@gmail.com', age=30, course='History'
   WHERE student_id = 149;


