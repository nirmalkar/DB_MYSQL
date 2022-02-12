-- min() returns minimum value of column
-- oldest book released in our table
select
  min(released_year)
from
  books;

select
  *
from
  books
where
  pages =(
    select
      min(pages)
    from
      books
  );