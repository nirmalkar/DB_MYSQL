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