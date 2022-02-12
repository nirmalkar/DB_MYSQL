-- Books count groped by year_released
select
  released_year,
  count(*) as book_count
from
  books
group by
  released_year;

-- showing release year in descending order and grouped by release_year and count of books
select
  released_year,
  count(*) as book_count
from
  books
group by
  released_year
order by
  released_year desc;

-- 
select
  author_fname,
  author_lname,
  max(pages)
from
  books
group by
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