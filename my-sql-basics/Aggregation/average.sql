-- Average(AVG) function is used to calculate the average of a column.
-- average of pages in the table.
SELECT
  avg(pages)
FROM
  books;

-- average of stock_quantity group by released_year.
SELECT
  released_year,
  avg(stock_quantity)
FROM
  books
GROUP BY
  released_year;