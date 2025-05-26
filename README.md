1. What is PostgreSQL?
PostgreSQL হলো একটি ওপেন-সোর্স, শক্তিশালী এবং ফিচার সমৃদ্ধ ডাটাবেস ম্যানেজমেন্ট সিস্টেম। এটি রিলেশনাল এবং অবজেক্ট-ওরিয়েন্টেড ডাটাবেস সমর্থন করে। PostgreSQL সাধারণত বড় ডেটা পরিচালনা, জটিল ক্যোয়ারি, এবং একাধিক ব্যবহারকারীর অ্যাক্সেস ম্যানেজমেন্টের জন্য ব্যবহৃত হয়।

2. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Primary Key:

টেবিলের এমন একটি কলাম বা কলামসমষ্টি যা প্রতিটি রেকর্ডের জন্য ইউনিক এবং নাল নয়।

এটি টেবিলের প্রাথমিক শনাক্তকারী হিসাবে কাজ করে।

উদাহরণ:
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);
Foreign Key:

একটি টেবিলের এমন একটি কলাম যা অন্য টেবিলের Primary Key রেফার করে।

এটি টেবিলগুলোর মধ্যে সম্পর্ক তৈরি করতে ব্যবহৃত হয়।

উদাহরণ:
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id)
);

3. Explain the purpose of the WHERE clause in a SELECT statement.
WHERE ক্লজ ডাটাবেস থেকে নির্দিষ্ট শর্ত অনুযায়ী ডেটা ফিল্টার করার জন্য ব্যবহৃত হয়। এটি SELECT, UPDATE, DELETE সহ বিভিন্ন স্টেটমেন্টে ব্যবহৃত হয়।

উদাহরণ:

সাধারণ ক্যোয়ারি:
SELECT * FROM students WHERE age > 18;
শর্ত সহ ডেটা আপডেট:
UPDATE students SET grade = 'A' WHERE score > 90;

4. How can you modify data using UPDATE statements?
UPDATE স্টেটমেন্ট একটি টেবিলের নির্দিষ্ট রেকর্ডের ডেটা পরিবর্তন করতে ব্যবহৃত হয়।

সাধারণ গঠন:
UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;

উদাহরণ:
UPDATE students
SET name = 'John Doe'
WHERE student_id = 1;

5. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
JOIN অপারেশন দুটি বা তার বেশি টেবিল থেকে ডেটা একত্রিত করতে ব্যবহৃত হয়।

JOIN প্রকারভেদ:

INNER JOIN: উভয় টেবিলের মিল খুঁজে আনে।

LEFT JOIN: বাম টেবিলের সব রেকর্ড এবং ডান টেবিলের মিল থাকা রেকর্ড।

RIGHT JOIN: ডান টেবিলের সব রেকর্ড এবং বাম টেবিলের মিল থাকা রেকর্ড।

FULL OUTER JOIN: উভয় টেবিলের সব রেকর্ড।

উদাহরণ:
SELECT students.name, enrollments.enrollment_id
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id;