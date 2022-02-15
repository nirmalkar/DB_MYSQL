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
   LIKE is used to file out data on the basis of character present inside them. I searches using pattern in a column.
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

[date-time](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html)

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
