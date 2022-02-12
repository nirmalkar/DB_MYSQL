-- max() returns maximum value of column
-- book with the maximum number of pages
select
  max(pages)
from
  books;

select
  *
from
  books
where
  pages =(
    select
      max(pages)
    from
      books
  );