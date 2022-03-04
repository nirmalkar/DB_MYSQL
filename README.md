# DB MYSQL

## String functions

1. str1 = "Hello"
2. str2 = "world"
3. title = "This is title!!"

| sno | String function | Description                                                              | Syntax/Example             | O/P             |
| --- | --------------- | ------------------------------------------------------------------------ | -------------------------- | --------------- |
| 1.  | CONCAT          | concatenates two strings                                                 | CONCAT(str1," ",str2)      | "Hello world"   |
| 2.  | CONCAT_WS       | concatenates string, first argument is applied between every two strings | CONCAT_WS("-", str1, str1) | "Hello-world"   |
| 3.  | SUBSTRING       | returns trimmed string                                                   | SUBSTRING(title, 0, 5)     | This            |
| 4.  | REPLACE         | returns trimmed string                                                   | REPLACE(title, " ", "-")   | This-is-title!! |
| 5.  | REVERSE         | returns reversed string                                                  | REVERSE(str1)              | "olleH"         |
| 6.  | CHAR_LENGTH     | returns length of string                                                 | REVERSE(str1)              | 5               |
| 7.  | UPPER           | returns upper-case of string                                             | UPPER(str1)                | "HELLO"         |
| 8.  | LOWER           | returns lower-case of string                                             | LOWER(str1)                | "hello"         |

## Refining

1. DISTINCT
   Used for selecting all the distinct entries.

```
SELECT DISTINCT(author_lname) from books;

```

2. ORDER BY
   As it's name suggests, used for ordering entries in ascending or descending order.

```
SELECT author_lname FROM books ORDER BY author_lname;

```

3. LIMIT
   It is used to limit the table content.

```
select
  author_fname,
  author_lname
from
  books
order by
  author_fname
limit
  6;

```

4. LIKE
   LIKE is used to file out data on the basis of character present inside them. It searches using pattern in a column.
   Characters : % and \_

```
SELECT title, author_fname FROM books WHERE LIKE "da%"

```

## Aggregation

1. MAX
   MAX() returns maximum value of column

```
select
  MAX(pages)
from
  books;

```

2. MIN
   MIN() returns minimum value of column

```
SELECT
  MIN(pages)
FROM
  books;

```

3. SUM
   SUM() adding all the page nos in the table

```
SELECT
  SUM(pages)
FROM
  books;

```

4. GROUP BY
   Group BY groups up single type of data in to one group

    ```
    SELECT
    released_year,
    COUNT(*) as book_count
    FROM
    books
    GROUP BY
    released_year;
    ```

5. AVERAGE
   Average(AVG) function is used to calculate the average of a column.

```
    SELECT
    AVG(pages)
    FROM
    books;

```

6.  COUNT
    COUNT shows count of all rows in the table

```
SELECT
COUNT(*)
FROM
books;

```

## DATA TYPES

FLOAT
DOUBLE

## DATE & TIME

DATE, TIME, and DATETIME data types are used to store date and time in data base.

CURDATE() function returns current date.
CURTIME() function returns current time.
NOW() function returns current date and time.
DAY() function returns date of the month.
DAYNAME() function returns day of the month.
DAYOFMONTH() function returns day of the month.
DAYOFYEAR() function returns number of day of the year. (1st day to 365th day).
MONTHNAME() function returns month name.

SQL document for date and time: [doc](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html)

```
INSERT INTO
  people(name, birth_date, birth_time, birth_dt)
VALUES
  (
    "Hemant",
    "1994-07-06",
    "01:32:12",
    "1994-07-06 01:32:12"
  ),
  (
    "Ravi",
    "1994-12-11",
    "12:32:32",
    "1994-12-11 12:32:32"
  ),
  (
    "newBorn",
    CURDATE(),
    CURTIME(),
    NOW()
  );
```

### FORMATTING DATE AND TIME

birthdt = 1994-07-06 01:32:12

```
SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;
```

### Date calculations

DATEDIFF

```
SELECT name, birth_date, DATEDIFF(now(), birth_dt) FROM people;
```

DATE_ADD

```
SELECT name, birth_dt, DATE_ADD(birth_dt, INTERVAL 1 MONTH) FROM people;
```

TIMESTAMP

```
CREATE TABLE blogs(content VARCHAR(100), changed_at TIMESTAMP DEFAULT NOW());
```

## JOINING TABLES

### suppose we have two tables, customers and orders.

Customers table:

| id  | first_name | last_name | email            |
| --- | ---------- | --------- | ---------------- |
| 1   | Boy        | George    | george@gmail.com |
| 2   | George     | Michael   | gm@gmail.com     |
| 3   | David      | Bowie     | david@gmail.com  |
| 4   | Blue       | Steele    | blue@gmail.com   |
| 5   | Bette      | Davis     | bette@aol.com    |

Orders table:

| id  | order_date | amount | customer_id |
| --- | ---------- | ------ | ----------- |
| 1   | 2016-02-10 | 99.99  | 1           |
| 2   | 2017-11-11 | 35.50  | 1           |
| 3   | 2014-12-12 | 800.67 | 2           |
| 4   | 2015-01-03 | 12.50  | 2           |
| 5   | 1999-04-11 | 450.25 | 5           |

### And we would want to join these two

ONE WAY TO JOIN THE TABLES

```
SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;

```

### INNER JOIN

ANOTHER WAY TO JOIN THE TABLES WITH INNER JOIN OR SIMPLY CALLED JOIN.

```
SELECT * FROM customers JOIN orders where customers.id = orders.customer_id;
```

### LEFT JOIN

The LEFT JOIN returns all rows from the left table and the matching rows from the right table.

```
SElECT * FROM customers LEFT JOIN orders ON customers.id = orders.customer_id;

```

### RIGHT JOIN

The RIGHT JOIN returns all rows from the right table and the matching rows from the left table.

```
SELECT * FROM customers RIGHT JOIN orders ON customers.id = orders.customer_id;

```
