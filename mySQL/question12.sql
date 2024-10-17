-- Students and Examinations
-- Table: Students

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | student_id    | int     |
-- | student_name  | varchar |
-- +---------------+---------+
-- student_id is the primary key (column with unique values) for this table.
-- Each row of this table contains the ID and the name of one student in the school.
 

-- Table: Subjects

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | subject_name | varchar |
-- +--------------+---------+
-- subject_name is the primary key (column with unique values) for this table.
-- Each row of this table contains the name of one subject in the school.
 

-- Table: Examinations

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | student_id   | int     |
-- | subject_name | varchar |
-- +--------------+---------+
-- There is no primary key (column with unique values) for this table. It may contain duplicates.
-- Each student from the Students table takes every course from the Subjects table.
-- Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
 

-- Write a solution to find the number of times each student attended each exam.

-- Return the result table ordered by student_id and subject_name.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Students table:
-- +------------+--------------+
-- | student_id | student_name |
-- +------------+--------------+
-- | 1          | Alice        |
-- | 2          | Bob          |
-- | 13         | John         |
-- | 6          | Alex         |
-- +------------+--------------+
-- Subjects table:
-- +--------------+
-- | subject_name |
-- +--------------+
-- | Math         |
-- | Physics      |
-- | Programming  |
-- +--------------+
-- Examinations table:
-- +------------+--------------+
-- | student_id | subject_name |
-- +------------+--------------+
-- | 1          | Math         |
-- | 1          | Physics      |
-- | 1          | Programming  |
-- | 2          | Programming  |
-- | 1          | Physics      |
-- | 1          | Math         |
-- | 13         | Math         |
-- | 13         | Programming  |
-- | 13         | Physics      |
-- | 2          | Math         |
-- | 1          | Math         |
-- +------------+--------------+
-- Output: 
-- +------------+--------------+--------------+----------------+
-- | student_id | student_name | subject_name | attended_exams |
-- +------------+--------------+--------------+----------------+
-- | 1          | Alice        | Math         | 3              |
-- | 1          | Alice        | Physics      | 2              |
-- | 1          | Alice        | Programming  | 1              |
-- | 2          | Bob          | Math         | 1              |
-- | 2          | Bob          | Physics      | 0              |
-- | 2          | Bob          | Programming  | 1              |
-- | 6          | Alex         | Math         | 0              |
-- | 6          | Alex         | Physics      | 0              |
-- | 6          | Alex         | Programming  | 0              |
-- | 13         | John         | Math         | 1              |
-- | 13         | John         | Physics      | 1              |
-- | 13         | John         | Programming  | 1              |
-- +------------+--------------+--------------+----------------+
-- Explanation: 
-- The result table should contain all students and all subjects.
-- Alice attended the Math exam 3 times, the Physics exam 2 times, and the Programming exam 1 time.
-- Bob attended the Math exam 1 time, the Programming exam 1 time, and did not attend the Physics exam.
-- Alex did not attend any exams.
-- John attended the Math exam 1 time, the Physics exam 1 time, and the Programming exam 1 time.

create TABLE students (
    student_id int primary key,
    student_name varchar(100)
);

create TABLE subjects (
    subject_name varchar(100) primary key
);

create TABLE examinations (
    student_id int,
    subject_name varchar(100)
);

insert into students (student_id, student_name) values (1, 'Alice');
insert into students (student_id, student_name) values (2, 'Bob');
insert into students (student_id, student_name) values (13, 'John');
insert into students (student_id, student_name) values (6, 'Alex');

insert into subjects (subject_name) values ('Math');
insert into subjects (subject_name) values ('Physics');
insert into subjects (subject_name) values ('Programming');

insert into examinations (student_id, subject_name) values (1, 'Math');
insert into examinations (student_id, subject_name) values (1, 'Physics');
insert into examinations (student_id, subject_name) values (1, 'Programming');
insert into examinations (student_id, subject_name) values (2, 'Programming');
insert into examinations (student_id, subject_name) values (1, 'Physics');
insert into examinations (student_id, subject_name) values (1, 'Math'); 
insert into examinations (student_id, subject_name) values (13, 'Math');
insert into examinations (student_id, subject_name) values (13, 'Programming');
insert into examinations (student_id, subject_name) values (13, 'Physics');
insert into examinations (student_id, subject_name) values (2, 'Math');
insert into examinations (student_id, subject_name) values (1, 'Math');


SELECT
    st.student_id,              -- We want each unique student ID
    st.student_name,            -- We want each unique student name
    sub.subject_name,           -- We want each unique subject
    COUNT(ex.subject_name) AS attended_exams  -- We count how many exams were attended
FROM
    students st
CROSS JOIN
    subjects sub
LEFT JOIN
    examinations ex
ON
    st.student_id = ex.student_id
    AND sub.subject_name = ex.subject_name
GROUP BY
    st.student_id,              -- Group by student ID 
    st.student_name,            -- Group by student name
    sub.subject_name            -- Group by subject name
ORDER BY
    st.student_id, sub.subject_name;  -- Sort the results


--group by is really just grouping the results that share the same values in the specified columns. like the student alice where it was grouped by the student_id and student_name and subject name which is 1 and alice and subject name. 
--the cross join is like a cartesian product where it joins every row from the first table with every row from the second table.