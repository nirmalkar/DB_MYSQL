SELECT
  REPLACE(title, " ", "->")
FROM
  books;

SELECT
  author_fname as Forwards,
  REVERSE(author_lname) as Backwards
FROM
  books;

SELECT
  UPPER(CONCAT(author_fname, " ", author_lname)) as full_name_in_caps
FROM
  books;

SELECT
  title,
  char_length(title) as length
FROM
  books;