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

4.  COUNT
    COUNT shows count of all rows in the table

```
SELECT
COUNT(*)
FROM
books;

```
