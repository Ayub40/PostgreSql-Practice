SELECT * from person2;

-- COLUMN add kora
ALTER TABLE person2
ADD COLUMN email VARCHAR(25) DEFAULT 'default@gmail.com' NOT NULL;

-- COLUMN DELETE kora
ALTER TABLE person2 DROP COLUMN email;

-- RENAME COLUMN NAME
ALTER Table person2 RENAME COLUMN age to user_age;

-- VARCHAR(25) ba TYPE CHANGE kora
ALTER TABLE person2 
alter COLUMN user_name type VARCHAR(50);

-- CONSTRAINT CHANGE kora
ALTER TABLE person2 
alter COLUMN user_name set NOT NULL;

-- CONSTRAINT delete kora
ALTER TABLE person2 
alter COLUMN user_name DROP NOT NULL;

-- UNIQUE ADD kora
ALTER Table person2
ADD constraint unique_person2_user_age UNIQUE(user_age);

-- UNIQUE KEY DROP kora
ALTER Table person2
DROP constraint unique_person2_user_age;

-- TRUNCATE (TABLE er STRUCTURE thakbe but data thakbe na)
-- TRUNCATE TABLE person2;

-- COLUMN data add
INSERT into person2 values ( 8, 'test2', 45, 'test@gmail.com' )