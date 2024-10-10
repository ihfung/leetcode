-- Invalid Tweets

-- Table: Tweets

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | tweet_id       | int     |
-- | content        | varchar |
-- +----------------+---------+
-- tweet_id is the primary key (column with unique values) for this table.
-- This table contains all the tweets in a social media app.
 

-- Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Tweets table:
-- +----------+-----------------------------------+
-- | tweet_id | content                           |
-- +----------+-----------------------------------+
-- | 1        | Let us Code                       |
-- | 2        | More than fifteen chars are here! |
-- +----------+-----------------------------------+
-- Output: 
-- +----------+
-- | tweet_id |
-- +----------+
-- | 2        |
-- +----------+
-- Explanation: 
-- Tweet 1 has length = 11. It is a valid tweet.
-- Tweet 2 has length = 33. It is an invalid tweet.

create table tweets (
    tweet_id int primary key,
    content varchar(255)
);

INSERT INTO tweets (tweet_id, content) VALUES ('1', 'Let us Code');
INSERT INTO tweets (tweet_id, content) VALUES ('2', 'More than fifteen chars are here!');
INSERT INTO tweets (tweet_id, content) VALUES ('3', 'This is a valid tweet');


select tweet_id from tweets where Length(tweets.content) > 15;
