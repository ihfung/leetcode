-- Recyclable and Low Fat Products
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_id  | int     |
-- | low_fats    | enum    |
-- | recyclable  | enum    |
-- +-------------+---------+
-- product_id is the primary key (column with unique values) for this table.
-- low_fats is an ENUM (category) of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
-- recyclable is an ENUM (category) of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.
 

-- Write a solution to find the ids of products that are both low fat and recyclable.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Products table:
-- +-------------+----------+------------+
-- | product_id  | low_fats | recyclable |
-- +-------------+----------+------------+
-- | 0           | Y        | N          |
-- | 1           | Y        | Y          |
-- | 2           | N        | Y          |
-- | 3           | Y        | Y          |
-- | 4           | N        | N          |
-- +-------------+----------+------------+
-- Output: 
-- +-------------+
-- | product_id  |
-- +-------------+
-- | 1           |
-- | 3           |
-- +-------------+
-- Explanation: Only products 1 and 3 are both low fat and recyclable.


CREATE TABLE products (
    product_id int PRIMARY KEY,
    low_fats ENUM('Y', 'N'),
    recyclable ENUM('Y', 'N')
);

INSERT INTO products (product_id, low_fats, recyclable) VALUES ('0', 'Y', 'N');
INSERT INTO products (product_id, low_fats, recyclable) VALUES ('1', 'Y', 'Y');
INSERT INTO products (product_id, low_fats, recyclable) VALUES ('2', 'N', 'Y');
INSERT INTO products (product_id, low_fats, recyclable) VALUES ('3', 'Y', 'Y');
INSERT INTO products (product_id, low_fats, recyclable) VALUES ('4', 'N', 'N');

Select product_id from products where products.low_fats = 'Y' and products.recyclable = 'Y';


