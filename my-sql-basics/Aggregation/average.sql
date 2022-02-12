-- Average(AVG) function is used to calculate the average of a column.
-- average of pages in the table.
select
  avg(pages)
from
  books;

-- average of stock_quantity group by released_year.
select
  released_year,
  avg(stock_quantity)
from
  books
group by
  released_year;