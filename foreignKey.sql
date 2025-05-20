-- 9-3 Constructing Relationships with Foreign Key Constraints

CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
)

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    -- user_id INTEGER REFERENCES "user"(id) ON DELETE CASCADE
    -- user_id INTEGER REFERENCES "user"(id) ON DELETE SET DEFAULT
    user_id INTEGER REFERENCES "user" (id) ON DELETE SET DEFAULT DEFAULT 2
)

-- 9-4 Enforcing Referential Integrity: Behaviors During Data Insertion

ALTER TABLE post ALTER COLUMN user_id SET NOT NULL;

INSERT INTO
    "user" (username)
VALUES ('akash'),
    ('batash'),
    ('sagor'),
    ('nodi');

INSERT INTO
    post (title, user_id)
VALUES (
        'Enjoying a sunny day with Akash! ☀️',
        2
    ),
    (
        'Batash just shared an amazing recipe! 🍲',
        1
    ),
    (
        'Exploring adventures with Sagor.🌟',
        4
    ),
    (
        'Nodi''s wisdom always leaves me inspired. 📚',
        4
    );

DROP TABLE post;

DROP TABLE "user";

SELECT * FROM "user";

SELECT * FROM post;

/* 
1. Insertion constraint on INSERT post
2. Attempting to insert a post with a user ID that does not exist
3. Inserting a post with a valid user ID
4. Attemting to insert a post without specifying a user ID

*/
-- INSERT INTO post (title,user_id) VALUES('test',1)

INSERT INTO post (title, user_id) VALUES ('test', NULL)

-- ======================================================================
-- ======================================================================
-- ======================================================================
-- 9-5 Enforcing Referential Integrity: Behaviors During Data Deletion

-- Deletion constraint on DELETE user
-- Cascading Deletion --> ON DELETE CASCADE
-- Setting NULL --> ON DELETE SET NULL
-- Restrict Deletion --> ON DELETE RESTRICT / ON DELETE NO ACTION (default)
-- Set Default Value --> ON DELETE SET DEFAULT

-- ON DELETE CASCADE ,,, dile ( create table post e 'ON DELETE CASCADE' dite hobe,,,, table ta drop korte hobe ,,,, tarpor abr create korte hobe ,,, tarpor delete korte hobe )
DELETE FROM "user" WHERE id = 4;



