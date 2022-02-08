select
  replace(title, " ", "->")
from
  books;

select
  author_fname as Forwards,
  reverse(author_lname) as Backwards
from
  books;

select
  upper(concat(author_fname, " ", author_lname)) as full_name_in_caps
from
  books;

select
  title,
  char_length(title) as length
from
  books;