SELECT
  concat(
    author_lname,
    " is ",
    char_length(author_lname),
    " characters long "
  )
FROM
  books;