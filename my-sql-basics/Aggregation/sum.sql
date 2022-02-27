-- adding all the page nos in the table
SELECT
  SUM(pages)
FROM
  books;

-- grouping author_fname and author_lname and adding all the pages written by author
SELECT
  author_fname,
  author_lname,
  SUM(pages) AS work_done
FROM
  books
GROUP BY
  author_fname,
  author_lname;