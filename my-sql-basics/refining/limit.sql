select
  author_fname,
  author_lname
from
  books
limit
  5;

-- select 6 rows from top order by author_fname
select
  author_fname,
  author_lname
from
  books
order by
  author_fname
limit
  6;

  