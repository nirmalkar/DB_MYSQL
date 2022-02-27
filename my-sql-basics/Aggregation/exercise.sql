-- Print total number of books in the table
SELECT
  count(*) as total_number_of_books
FROM
  books;

-- how many books release each year
SELECT
  released_year,
  count(*) as "book(s)_released"
FROM
  books
GROUP BY
  released_year;

-- print out total number of books in the stock
SELECT
  sum(stock_quantity)
FROM
  books;

-- find the avg released year for earch author
SELECT
  concat(author_fname, " ", author_lname),
  avg(released_year)
FROM
  books
GROUP BY
  author_fname,
  author_lname;

-- find the full name of author who wrote the longest book
SELECT
  concat(author_fname, " ", author_lname) as full_name,
  pages
FROM
  books
WHERE
  pages =(
    SELECT
      max(pages)
    FROM
      books
  );

-- OR(optimized)
SELECT
  concat(author_fname, " ", author_lname) as full_name,
  pages
FROM
  books
ORDER BY
  pages DESC
LIMIT
  1;