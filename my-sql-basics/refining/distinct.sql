SELECT
  DISTINCT author_fname,
  author_lname
FROM
  books;

-- Get all the distinct full name of authors in the books table.
SELECT
  DISTINCT CONCAT(author_fname, " ", author_lname)
FROM
  books;