-- by defalut it is ascending order
-- DESCENDING ORDER
select
  *
from
  books
order by
  released_year desc;

-- ASCENDING ORDER
select
  *
from
  books
order by
  released_year asc;

-- small hack to oreder by released_year
select
  author_fname,
  author_lname,
  released_year
from
  books
order by
  3;

select
  *
from
  books
order by
  author_lname,
  author_fname;