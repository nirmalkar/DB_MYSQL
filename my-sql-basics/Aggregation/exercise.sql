-- Print total number of books in the table
select
  count(*) as total_number_of_books
from
  books;

-- how many books release each year
select
  released_year,
  count(*) as "book(s)_released"
from
  books
group by
  released_year;

-- print out total number of books in the stock
select
  sum(stock_quantity)
from
  books;

-- find the avg released year for earch author
select
  concat(author_fname, " ", author_lname),
  avg(released_year)
from
  books
group by
  author_fname,
  author_lname;

-- find the full name of author who wrote the longest book
select
  concat(author_fname, " ", author_lname) as full_name,
  pages
from
  books
where
  pages =(
    select
      max(pages)
    from
      books
  );

-- OR(optimized)
select
  concat(author_fname, " ", author_lname) as full_name,
  pages
from
  books
order by
  pages desc
limit
  1;