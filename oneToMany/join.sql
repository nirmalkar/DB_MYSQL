-- customers table
-- +----+------------+-----------+------------------+
-- | id | first_name | last_name | email            |
-- +----+------------+-----------+------------------+
-- |  1 | Boy        | George    | george@gmail.com |
-- |  2 | George     | Michael   | gm@gmail.com     |
-- |  3 | David      | Bowie     | david@gmail.com  |
-- |  4 | Blue       | Steele    | blue@gmail.com   |
-- |  5 | Bette      | Davis     | bette@aol.com    |
-- +----+------------+-----------+------------------+
-- orders table
-- +----+------------+--------+-------------+
-- | id | order_date | amount | customer_id |
-- +----+------------+--------+-------------+
-- |  1 | 2016-02-10 |  99.99 |           1 |
-- |  2 | 2017-11-11 |  35.50 |           1 |
-- |  3 | 2014-12-12 | 800.67 |           2 |
-- |  4 | 2015-01-03 |  12.50 |           2 |
-- |  5 | 1999-04-11 | 450.25 |           5 |
-- +----+------------+--------+-------------+
-- Suppose we want to get all the orders of cutomer name 'George'; 
-- We can use the following query:
SELECT
  *
FROM
  orders
WHERE
  customer_id = (
    SELECT
      id
    FROM
      customers
    WHERE
      first_name = "George"
  );

-- BUT THIS QUERY COULD BE LONGER AND MORE DIFFICULT TO READ INSTEAD WE CAN USE JOIN.
-- CROSS JOIN (In this type of joins each row of first table is combined with all the rows of second table.This kind of join we are never gonna use but it's good to know)
SELECT
  *
FROM
  CUSTOMERS
  AND ORDERS;

-- JOINING TWO TABLES
SELECT
  *
FROM
  customers,
  orders
WHERE
  customers.id = orders.customer_id;

-- show first name, last name and total amount spent by them grouped by customer id.
SELECT
  first_name,
  last_name,
  SUM(amount) AS money_spent
FROM
  customers
  JOIN orders
WHERE
  customers.id = orders.customer_id
GROUP BY
  customer_id;