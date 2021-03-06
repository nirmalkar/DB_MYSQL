-- show count of all rows in the table
SELECT
  count(*)
FROM
  books;

-- show count of all the distinct authors in the books table.
SELECT
  count(distinct author_fname)
FROM
  books;