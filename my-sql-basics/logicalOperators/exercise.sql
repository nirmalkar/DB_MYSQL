--1. select all the books written by chabon 
SELECT
  *
FROM
  books
WHERE
  author_lname = "Chabon";

-- 2. select all the books written by lahiri after 2000
SELECT
  *
FROM
  books
WHERE
  author_lname = "Lahiri"
  AND released_year > 2000;

-- 3. select all the books whith page count between 100 to 200
SELECT
  *
FROM
  books
WHERE
  pages BETWEEN 100
  AND 200;

-- 4. select all the books where author_lname starts with "c" or an "s".
SELECT
  *
FROM
  books
WHERE
  (author_lname LIKE "c%" || author_lname LIKE "s%");

-- create a table with "type" field 
-- If title contains 'stories'   -> Short Stories
-- Just Kids and A Heartbreaking Work  -> Memoir
-- Everything Else -> Novel
-- O/P should be 
-- +-----------------------------------------------------+----------------+---------------+
-- | title                                               | author_lname   | TYPE          |
-- +-----------------------------------------------------+----------------+---------------+
-- | The Namesake                                        | Lahiri         | Novel         |
-- | Norse Mythology                                     | Gaiman         | Novel         |
-- | American Gods                                       | Gaiman         | Novel         |
-- | Interpreter of Maladies                             | Lahiri         | Novel         |
-- | A Hologram for the King: A Novel                    | Eggers         | Novel         |
-- | The Circle                                          | Eggers         | Novel         |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel         |
-- | Just Kids                                           | Smith          | Memoir        |
-- | A Heartbreaking Work of Staggering Genius           | Eggers         | Memoir        |
-- | Coraline                                            | Gaiman         | Novel         |
-- | What We Talk About When We Talk About Love: Stories | Carver         | Short Stories |
-- | Where I'm Calling From: Selected Stories            | Carver         | Short Stories |
-- | White Noise                                         | DeLillo        | Novel         |
-- | Cannery Row                                         | Steinbeck      | Novel         |
-- | Oblivion: Stories                                   | Foster Wallace | Short Stories |
-- | Consider the Lobster                                | Foster Wallace | Novel         |
-- | 10% Happier                                         | Harris         | Novel         |
-- | fake_book                                           | Harris         | Novel         |
-- | Lincoln In The Bardo                                | Saunders       | Novel         |
-- +-----------------------------------------------------+----------------+---------------+
SELECT
  title,
  author_lname,
  CASE
    WHEN (
      title LIKE "Just Kids%" || title LIKE "A Heartbreaking Work%"
    ) THEN "Memoir"
    WHEN title LIKE "%stories%" THEN "Short Stories"
    ELSE "Novel"
  END AS type
FROM
  books;

-- Print the given table
-- +----------------+---------+
-- | author_lname   | COUNT   |
-- +----------------+---------+
-- | Lahiri         | 2 Books |
-- | Gaiman         | 3 Books |
-- | Eggers         | 3 Books |
-- | Chabon         | 1 Book  |
-- | Smith          | 1 Book  |
-- | Carver         | 2 Books |
-- | DeLillo        | 1 Book  |
-- | Steinbeck      | 1 Book  |
-- | Foster Wallace | 2 Books |
-- | Harris         | 2 Books |
-- | Saunders       | 1 Book  |
-- +----------------+---------+
SELECT
  author_lname,
  CONCAT(
    COUNT(*),
    " ",
    CASE
      WHEN COUNT(*) > 1 THEN "Books"
      ELSE "Book"
    end
  ) AS COUNT
FROM
  books
GROUP BY
  author_lname;