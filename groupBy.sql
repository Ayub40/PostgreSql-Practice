-- 9-2 Grouping and Filtering Data with GROUP BY and HAVING

SELECT * FROM students;

SELECT country FROM students GROUP BY country;

SELECT country, count(*), avg(age) FROM students GROUP BY country;

-- Filter Group Using HAVING to Show Only Countries with Average Age Above 22
SELECT country, count(*), avg(age) FROM students 
    GROUP BY country
        HAVING avg(age) > 21.60;

-- Count Students Born in Each Year
SELECT extract(YEAR FROM dob) as birth_year
    FROM students
        GROUP BY birth_year;

SELECT extract(YEAR FROM dob) as birth_year, count(*)
    FROM students
        GROUP BY birth_year;




