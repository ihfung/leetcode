-- Find Customer Referee

-- Table: Customer

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | referee_id  | int     |
-- +-------------+---------+
-- In SQL, id is the primary key column for this table.
-- Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
 

-- Find the names of the customer that are not referred by the customer with id = 2.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Customer table:
-- +----+------+------------+
-- | id | name | referee_id |
-- +----+------+------------+
-- | 1  | Will | null       |
-- | 2  | Jane | null       |
-- | 3  | Alex | 2          |
-- | 4  | Bill | null       |
-- | 5  | Zack | 1          |
-- | 6  | Mark | 2          |
-- +----+------+------------+
-- Output: 
-- +------+
-- | name |
-- +------+
-- | Will |
-- | Jane |
-- | Bill |
-- | Zack |
-- +------+

CREATE TABLE customer (
    id int PRIMARY KEY,
    name varchar(255),
    referee_id int
);

INSERT INTO customer (id, name, referee_id) VALUES ('1', 'Will', NULL);
INSERT INTO customer (id, name, referee_id) VALUES ('2', 'Jane', NULL);
INSERT INTO customer (id, name, referee_id) VALUES ('3', 'Alex', '2');
INSERT INTO customer (id, name, referee_id) VALUES ('4', 'Bill', NULL);
INSERT INTO customer (id, name, referee_id) VALUES ('5', 'Zack', '1');
INSERT INTO customer (id, name, referee_id) VALUES ('6', 'Mark', '2');

select name from customer where customer.referee_id != 2 OR customer.referee_id is NULL;