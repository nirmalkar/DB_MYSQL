-- find all the series that have not been reviewed by the users.
SELECT
  *
FROM
  series
  LEFT JOIN reviews ON series.id = reviews.series_id
WHERE
  reviews.id IS NULL;

-- show all the genres with their average raitng.
SElECT
  genre,
  ROUND(AVG(rating), 2) AS average_rating
from
  series
  JOIN reviews ON series.id = reviews.series_id
GROUP BY
  genre;

-- Reviewers Statistics with first_name, last_name count(count of reviews he wrote), 
-- Min(as minimum rating given by him), Max(as maximum rating given by him)), 
-- AVG (average rating given by him), STATUS (of the user active or inactive)
-- O/P SHOULD BE
-- +------------+-----------+-------+-----+-----+------+----------+
-- | first_name | last_name | Count | Min | Max | AVG  | STATUS   |
-- +------------+-----------+-------+-----+-----+------+----------+
-- | Thomas     | Stoneman  |     5 | 7.0 | 9.5 | 8.02 | Active   |
-- | Wyatt      | Skaggs    |     9 | 5.5 | 9.3 | 7.80 | Active   |
-- | Kimbra     | Masters   |     9 | 6.8 | 9.0 | 7.99 | Active   |
-- | Domingo    | Cortes    |    10 | 5.8 | 9.1 | 7.83 | Active   |
-- | Colt       | Steele    |    10 | 4.5 | 9.9 | 8.77 | Active   |
-- | Pinkie     | Petit     |     4 | 4.3 | 8.8 | 7.25 | Active   |
-- | Marlon     | Crafford  |     0 | 0.0 | 0.0 | 0.00 | Inactive |
-- +------------+-----------+-------+-----+-----+------+----------+
SELECT
  first_name,
  last_name,
  COUNT(reviews.id) AS Count,
  IFNULL(MIN(rating), 0) as Min,
  IFNULL(MAX(rating), 0) as Max,
  IFNULL(ROUND(AVG(rating), 2), 0) as AVG,
  CASE
    WHEN COUNT(reviews.id) = 0 THEN 'Inactive'
    ELSE 'Active'
  END AS STATUS
FROM
  reviewers
  LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY
  reviewers.id;

-- FINALLY JOIN ALL THREE TABLES SERIES, REVIEWERS AND REVIEWS. AND SHOW title, rating, full_name(first_name + last_name). AND 
-- TABLE SHOULD BE ORDERED BY SERIES TITLE.
SElECT
  title,
  rating,
  CONCAT(first_name, " ", last_name) AS full_name
FROM
  series
  INNER JOIN reviews ON series.id = reviews.series_id
  INNER JOIN reviewers ON reviewers.id = reviews.reviewer_id
ORDER BY
  title;

-- O/P
-- +----------------------+--------+-----------------+
-- | title                | rating | full_name       |
-- +----------------------+--------+-----------------+
-- | Archer               |    8.0 | Thomas Stoneman |
-- | Archer               |    8.9 | Colt Steele     |
-- | Archer               |    7.7 | Domingo Cortes  |
-- | Archer               |    8.5 | Kimbra Masters  |
-- | Archer               |    7.5 | Wyatt Skaggs    |
-- | Arrested Development |    8.4 | Pinkie Petit    |
-- | Arrested Development |    9.9 | Colt Steele     |
-- | Arrested Development |    8.1 | Thomas Stoneman |
-- | Arrested Development |    8.0 | Kimbra Masters  |
-- | Arrested Development |    6.0 | Domingo Cortes  |
-- | Bob's Burgers        |    7.5 | Pinkie Petit    |
-- | Bob's Burgers        |    8.0 | Colt Steele     |
-- | Bob's Burgers        |    8.0 | Domingo Cortes  |
-- | Bob's Burgers        |    7.1 | Kimbra Masters  |
-- | Bob's Burgers        |    7.0 | Thomas Stoneman |
-- | Bojack Horseman      |    8.3 | Domingo Cortes  |
-- | Bojack Horseman      |    7.6 | Wyatt Skaggs    |
-- | Bojack Horseman      |    8.5 | Colt Steele     |
-- | Bojack Horseman      |    7.5 | Thomas Stoneman |
-- | Bojack Horseman      |    7.8 | Kimbra Masters  |
-- | Breaking Bad         |    9.5 | Thomas Stoneman |
-- | Breaking Bad         |    9.0 | Kimbra Masters  |
-- | Breaking Bad         |    9.1 | Domingo Cortes  |
-- | Breaking Bad         |    9.9 | Colt Steele     |
-- | Breaking Bad         |    9.3 | Wyatt Skaggs    |
-- | Curb Your Enthusiasm |    7.8 | Kimbra Masters  |
-- | Curb Your Enthusiasm |    8.8 | Domingo Cortes  |
-- | Curb Your Enthusiasm |    8.4 | Wyatt Skaggs    |
-- | Curb Your Enthusiasm |    9.1 | Colt Steele     |
-- | Curb Your Enthusiasm |    6.5 | Wyatt Skaggs    |
-- | Fargo                |    9.1 | Wyatt Skaggs    |
-- | Fargo                |    9.7 | Colt Steele     |
-- | Freaks and Geeks     |    8.5 | Domingo Cortes  |
-- | Freaks and Geeks     |    7.8 | Wyatt Skaggs    |
-- | Freaks and Geeks     |    9.3 | Colt Steele     |
-- | Freaks and Geeks     |    8.8 | Pinkie Petit    |
-- | General Hospital     |    6.8 | Kimbra Masters  |
-- | General Hospital     |    5.8 | Domingo Cortes  |
-- | General Hospital     |    5.5 | Wyatt Skaggs    |
-- | General Hospital     |    4.5 | Colt Steele     |
-- | General Hospital     |    4.3 | Pinkie Petit    |
-- | Halt and Catch Fire  |    9.9 | Colt Steele     |
-- | Seinfeld             |    8.0 | Kimbra Masters  |
-- | Seinfeld             |    7.2 | Domingo Cortes  |
-- | Stranger Things      |    8.9 | Kimbra Masters  |
-- | Stranger Things      |    8.5 | Wyatt Skaggs    |
-- | Stranger Things      |    8.9 | Domingo Cortes  |
-- +----------------------+--------+-----------------+