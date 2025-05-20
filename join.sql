-- 9-6 Joining Tables with Inner Join

-- 2 ta TABLE mix kore DATA dekhano

SELECT *
FROM post
    -- SELECT "user".id FROM post
    -- SELECT post.id FROM post
    -- SELECT title, username FROM post
    JOIN "user" ON post.user_id = "user".id;

-- TABLE er name big hole short korleo hobe ( etar name inner join )
SELECT *
FROM post as p
    -- JOIN "user" as u ON p.user_id = u.id;
    Inner JOIN "user" as u ON p.user_id = u.id;

-- ======================================================================
-- ======================================================================
-- ======================================================================
SELECT * FROM "user";

SELECT * FROM post;

-- 9-7 Understanding Left and Right Joins

-- SELECT * FROM "user"
-- JOIN post ON post.user_id = "user".id;

SELECT * FROM post as p JOIN "user" u ON p.user_id = u.id;

INSERT INTO
    post (id, title, user_id)
VALUES (
        5,
        'This is a test post title ☀️',
        NULL
    );

-- LEFT join k  'LEFT OUTER' o bola jai
SELECT * FROM post as p LEFT JOIN "user" u ON p.user_id = u.id;

-- RIGHT JOIN k RIGHT OUTER JOIN o bola jai
SELECT * FROM post as p RIGHT JOIN "user" u ON p.user_id = u.id;

-- ======================================================================
-- ======================================================================
-- ======================================================================

-- 9-8 Exploring Full, Cross, and Natural Joins

SELECT * FROM post as p FULL OUTER JOIN "user" u ON p.user_id = u.id;

