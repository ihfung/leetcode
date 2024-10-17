-- Managers with at Least 5 Direct Reports
-- Table: Employee

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | department  | varchar |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the name of an employee, their department, and the id of their manager.
-- If managerId is null, then the employee does not have a manager.
-- No employee will be the manager of themself.
 

-- Write a solution to find managers with at least five direct reports.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Employee table:
-- +-----+-------+------------+-----------+
-- | id  | name  | department | managerId |
-- +-----+-------+------------+-----------+
-- | 101 | John  | A          | null      |
-- | 102 | Dan   | A          | 101       |
-- | 103 | James | A          | 101       |
-- | 104 | Amy   | A          | 101       |
-- | 105 | Anne  | A          | 101       |
-- | 106 | Ron   | B          | 101       |
-- +-----+-------+------------+-----------+
-- Output: 
-- +------+
-- | name |
-- +------+
-- | John |
-- +------+

create table employee (
    id int primary key,
    name varchar(100),
    department varchar(100),
    managerId int
);

insert into employee (id, name, department, managerId) values (101, 'John', 'A', null);
insert into employee (id, name, department, managerId) values (102, 'Dan', 'A', 101);
insert into employee (id, name, department, managerId) values (103, 'James', 'A', 101);
insert into employee (id, name, department, managerId) values (104, 'Amy', 'A', 101);
insert into employee (id, name, department, managerId) values (105, 'Anne', 'A', 101);
insert into employee (id, name, department, managerId) values (106, 'Ron', 'B', 101);


select a.name from employee a 
join employee b on a.id = b.managerId
group by b.managerId 
having count(*) >= 5;

--joining the same table is like creating a temp table with the same table and then joining the two tables together.
--the first table is the employee table and the second table is the employee table with the alias b
--the join condition is that the id of the first table is equal to the managerId of the second table
--group by the managerId which getting all values that share the same managerId