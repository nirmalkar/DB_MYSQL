-- Books count groped by year_released
SELECT
  released_year,
  count(*) as book_count
FROM
  books
GROUP BY
  released_year;

-- showing release year in descending order and grouped by release_year and count of books
SELECT
  released_year,
  count(*) as book_count
FROM
  books
GROUP BY
  released_year
ORDER BY
  released_year desc;

-- 
SELECT
  author_fname,
  author_lname,
  max(pages)
FROM
  books
GROUP BY
  author_fname,
  author_lname;

-- 
SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM
  books
GROUP BY
  author_lname,
  author_fname;