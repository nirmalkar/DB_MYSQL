-- 1. !=
-- 2. NOT LIKE
-- GREATER THAN >
-- GREATER THAN EQAL TO >=
-- SMALLER THAN <
-- SMALLER THAN <=
-- LOGICAL AND &&
-- LOGICAL OR ||
-- BETWEEN
-- IN
SELECT
  *
FROM
  books
WHERE
  RELEASED_YEAR IN (2000, 2003, 2014);

SELECT
  *
FROM
  books
WHERE
  RELEASED_YEAR NOT IN (2000, 2003, 2014);

-- conditional Statement
SELECT
  title,
  author_fname,
  author_lname,
  CASE
    WHEN released_year >= 2000 THEN "Modern Lit"
    ELSE "20th century Lit"
  END as "Genre"
FROM
  books;

-- Multiple conditional statements:
SELECT
  title,
  author_fname,
  author_lname,
  released_year,
  CASE
    WHEN released_year >= 2000 & & released_year <= 2010 THEN "Modern Litrature"
    WHEN released_year >= 2010
    AND released_year <= 2017 THEN "LIT Litrature"
    ELSE "20th century Litrature"
  END as "Genre"
FROM
  books;