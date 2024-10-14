-- Employee Bonus
-- Table: Employee

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | empId       | int     |
-- | name        | varchar |
-- | supervisor  | int     |
-- | salary      | int     |
-- +-------------+---------+
-- empId is the column with unique values for this table.
-- Each row of this table indicates the name and the ID of an employee in addition to their salary and the id of their manager.
 

-- Table: Bonus

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | empId       | int  |
-- | bonus       | int  |
-- +-------------+------+
-- empId is the column of unique values for this table.
-- empId is a foreign key (reference column) to empId from the Employee table.
-- Each row of this table contains the id of an employee and their respective bonus.
 

-- Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Employee table:
-- +-------+--------+------------+--------+
-- | empId | name   | supervisor | salary |
-- +-------+--------+------------+--------+
-- | 3     | Brad   | null       | 4000   |
-- | 1     | John   | 3          | 1000   |
-- | 2     | Dan    | 3          | 2000   |
-- | 4     | Thomas | 3          | 4000   |
-- +-------+--------+------------+--------+
-- Bonus table:
-- +-------+-------+
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |
-- +-------+-------+
-- Output: 
-- +------+-------+
-- | name | bonus |
-- +------+-------+
-- | Brad | null  |
-- | John | null  |
-- | Dan  | 500   |
-- +------+-------+

create table employee (
    empId int primary key,
    name varchar(100),
    supervisor int,
    salary int
);

create table bonus (
    empId int primary key,
    bonus int
);


insert into employee (empId, name, supervisor, salary) values (3, 'Brad', null, 4000);
insert into employee (empId, name, supervisor, salary) values (1, 'John', 3, 1000);
insert into employee (empId, name, supervisor, salary) values (2, 'Dan', 3, 2000);
insert into employee (empId, name, supervisor, salary) values (4, 'Thomas', 3, 4000);

insert into bonus (empId, bonus) values (2, 500);
insert into bonus (empId, bonus) values (4, 2000);


select name, bonus 
from employee e left join bonus b 
on e.empId = b.empId 
where b.bonus < 1000 OR b.bonus is NULL
order by b.empId;

-- +------+-------+
-- The use of ORDER BY and not GROUP BY is intentional because you are not performing any aggregation or grouping of rows. Here's why:

-- ORDER BY is used to sort the results based on a column (or columns). In this case, it's sorting by b.empId, so the result will be ordered by the employee IDs from the bonus table.

-- GROUP BY is used when you want to group rows that have the same values in specified columns and then apply aggregate functions (like COUNT, SUM, AVG, etc.) to the grouped data. In your query, there is no need to group rows since you're simply retrieving employee names and bonuses and don't require any aggregation.

-- Since the query does not involve any grouping or aggregation, ORDER BY is the appropriate choice to control the order of the rows in the result set. The query fetches rows based on conditions (bonus < 1000 or bonus IS NULL) and then sorts them by the empId from the bonus table.

-- If you used GROUP BY, the query would attempt to combine rows based on common values in the specified columns, which is unnecessary here since you're just displaying the results as individual rows.
