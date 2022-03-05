SElECT
  *
FROM
  series;

-- +----+-----------------------+---------------+-----------+
-- | id | title                 | released_year | genre     |
-- +----+-----------------------+---------------+-----------+
-- |  1 | Archer                |          2009 | Animation |
-- |  2 | Arrested Development  |          2003 | Comedy    |
-- |  3 | Bob's Burgers         |          2011 | Animation |
-- |  4 | Bojack Horseman       |          2014 | Animation |
-- |  5 | Breaking Bad          |          2008 | Drama     |
-- |  6 | Curb Your Enthusiasm  |          2000 | Comedy    |
-- |  7 | Fargo                 |          2014 | Drama     |
-- |  8 | Freaks and Geeks      |          1999 | Comedy    |
-- |  9 | General Hospital      |          1963 | Drama     |
-- | 10 | Halt and Catch Fire   |          2014 | Drama     |
-- | 11 | Malcolm In The Middle |          2000 | Comedy    |
-- | 12 | Pushing Daisies       |          2007 | Comedy    |
-- | 13 | Seinfeld              |          1989 | Comedy    |
-- | 14 | Stranger Things       |          2016 | Drama     |
-- +----+-----------------------+---------------+-----------+
-- REVIEWERS TABLE
SElECT
  *
from
  reviewers;

-- +----+------------+-----------+
-- | id | first_name | last_name |
-- +----+------------+-----------+
-- |  1 | Thomas     | Stoneman  |
-- |  2 | Wyatt      | Skaggs    |
-- |  3 | Kimbra     | Masters   |
-- |  4 | Domingo    | Cortes    |
-- |  5 | Colt       | Steele    |
-- |  6 | Pinkie     | Petit     |
-- |  7 | Marlon     | Crafford  |
-- +----+------------+-----------+
-- REVIEWS TABLE
SElECT
  *
FROM
  reviews;

-- +----+--------+-------------+-----------+
-- | id | rating | reviewer_id | series_id |
-- +----+--------+-------------+-----------+
-- |  1 |    8.0 |           1 |         1 |
-- |  2 |    7.5 |           2 |         1 |
-- |  3 |    8.5 |           3 |         1 |
-- |  4 |    7.7 |           4 |         1 |
-- |  5 |    8.9 |           5 |         1 |
-- |  6 |    8.1 |           1 |         2 |
-- |  7 |    6.0 |           4 |         2 |
-- |  8 |    8.0 |           3 |         2 |
-- |  9 |    8.4 |           6 |         2 |
-- | 10 |    9.9 |           5 |         2 |
-- | 11 |    7.0 |           1 |         3 |
-- | 12 |    7.5 |           6 |         3 |
-- | 13 |    8.0 |           4 |         3 |
-- | 14 |    7.1 |           3 |         3 |
-- | 15 |    8.0 |           5 |         3 |
-- | 16 |    7.5 |           1 |         4 |
-- | 17 |    7.8 |           3 |         4 |
-- | 18 |    8.3 |           4 |         4 |
-- | 19 |    7.6 |           2 |         4 |
-- | 20 |    8.5 |           5 |         4 |
-- | 21 |    9.5 |           1 |         5 |
-- | 22 |    9.0 |           3 |         5 |
-- | 23 |    9.1 |           4 |         5 |
-- | 24 |    9.3 |           2 |         5 |
-- | 25 |    9.9 |           5 |         5 |
-- | 26 |    6.5 |           2 |         6 |
-- | 27 |    7.8 |           3 |         6 |
-- | 28 |    8.8 |           4 |         6 |
-- | 29 |    8.4 |           2 |         6 |
-- | 30 |    9.1 |           5 |         6 |
-- | 31 |    9.1 |           2 |         7 |
-- | 32 |    9.7 |           5 |         7 |
-- | 33 |    8.5 |           4 |         8 |
-- | 34 |    7.8 |           2 |         8 |
-- | 35 |    8.8 |           6 |         8 |
-- | 36 |    9.3 |           5 |         8 |
-- | 37 |    5.5 |           2 |         9 |
-- | 38 |    6.8 |           3 |         9 |
-- | 39 |    5.8 |           4 |         9 |
-- | 40 |    4.3 |           6 |         9 |
-- | 41 |    4.5 |           5 |         9 |
-- | 42 |    9.9 |           5 |        10 |
-- | 43 |    8.0 |           3 |        13 |
-- | 44 |    7.2 |           4 |        13 |
-- | 45 |    8.5 |           2 |        14 |
-- | 46 |    8.9 |           3 |        14 |
-- | 47 |    8.9 |           4 |        14 |
-- +----+--------+-------------+-----------+
-- 1. JOIN table series and table reviews and group by series_id and show title,released_year, genre and avg Rating.
SELECT
  title,
  released_year,
  genre,
  ROUND(AVG(reviews.rating), 2) AS rating
FROM
  series
  JOIN reviews ON series.id = reviews.series_id
GROUP BY
  series.id;

-- O/P
-- +----------------------+---------------+-----------+-------------------------------+
-- | title                | released_year | genre     | ROUND(AVG(reviews.rating), 2) |
-- +----------------------+---------------+-----------+-------------------------------+
-- | Archer               |          2009 | Animation |                          8.12 |
-- | Arrested Development |          2003 | Comedy    |                          8.08 |
-- | Bob's Burgers        |          2011 | Animation |                          7.52 |
-- | Bojack Horseman      |          2014 | Animation |                          7.94 |
-- | Breaking Bad         |          2008 | Drama     |                          9.36 |
-- | Curb Your Enthusiasm |          2000 | Comedy    |                          8.12 |
-- | Fargo                |          2014 | Drama     |                          9.40 |
-- | Freaks and Geeks     |          1999 | Comedy    |                          8.60 |
-- | General Hospital     |          1963 | Drama     |                          5.38 |
-- | Halt and Catch Fire  |          2014 | Drama     |                          9.90 |
-- | Seinfeld             |          1989 | Comedy    |                          7.60 |
-- | Stranger Things      |          2016 | Drama     |                          8.77 |
-- +----------------------+---------------+-----------+-------------------------------+