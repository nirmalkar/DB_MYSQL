-- min() returns minimum value of column
-- oldest book released in our table
SELECT
  min(released_year)
FROM
  books;

SELECT
  *
FROM
  books
WHERE
  pages =(
    SELECT
      min(pages)
    FROM
      books
  );