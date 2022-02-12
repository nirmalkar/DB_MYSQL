-- adding all the page nos in the table
select
  sum(pages)
from
  books;

-- grouping author_fname and author_lname and adding all the pages written by author
select
  author_fname,
  author_lname,
  sum(pages) as work_done
from
  books
group by
  author_fname,
  author_lname;