-- select column which has highest released_year value
select
  *
from
  books
order by
  released_year desc
limit
  1;

-- Select all the book title that conatinas "Stories" in it.
SELECT
  title,
  author_fname
FROM
  books
WHERE
  title like "%stories%";

SELECT
  UPPER(
    CONCAT("my favourite author is", " ", author_fname)
  )
FROM
  books;