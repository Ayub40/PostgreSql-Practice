-- 9-1 Handling Date and Date Functions in PostgreSQL

-- SHOW TIMEZONE
SELECT now();

-- CREATE TABLE timeZ (
--     ts TIMESTAMP without TIME zone,
--     tsz TIMESTAMP with TIME zone
-- );

create table timeZ (
    ts TIMESTAMP without time zone,
    tsz TIMESTAMP with time zone
);

INSERT into
    timez
VALUES (
        '2025-05-19 19:33:36',
        '2025-05-19 19:33:36'
    );

SELECT * FROM timez;

SELECT now();

-- CURRENT_DATE dekhar rule
SELECT CURRENT_DATE;

-- TIMESTAMP theke only data see korar rules
SELECT now()::date;

-- TIMESTAMP theke only data see korar rules
SELECT now()::time;

SELECT to_char(now(), 'dd/mm/yyyy');

-- year er koto tomo day,,, google kore dekhte hobe (SELECT to_char) egolo
SELECT to_char(now(), 'ddd');

-- today date theke '' er vitor jei date disi toto din ager date;
SELECT CURRENT_DATE - INTERVAL '1 year 2 month';

-- today date theke '' er vitor date koto din hoyse
SELECT age(CURRENT_DATE, '1994-08-30'); ADD

SELECT * FROM students;

--  ager students database e sobr jonno age ta dekhte caile
SELECT *,age(CURRENT_DATE, dob) FROM students;

SELECT extract(month FROM '2025-05-19'::date);

-- SELECT 'n'::BOOLEAN;
SELECT '1'::BOOLEAN;



