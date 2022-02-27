-- max() returns maximum value of column
-- book with the maximum number of pages
SELECT
  max(pages)
FROM
  books;

SELECT
  *
FROM
  books
WHERE
  pages =(
    SELECT
      max(pages)
    FROM
      books
  );