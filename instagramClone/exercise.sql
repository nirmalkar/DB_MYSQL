-- Show the day of the week which has maximum number of rigistrations.
SELECT
  DAYNAME(created_at),
  COUNT(*) AS TOTAL
FROM
  users
GROUP BY
  DAYNAME;

-- Identify inactive users (user who has no photos).
SELECT
  username,
  image_url
FROM
  users
  LEFT JOIN photos ON users.id = photos.user_id
where
  image_url IS NULL;

-- Identify the most popular photo and user who posted it
SELECT
  photos.id,
  image_url,
  COUNT(photo_id) AS likes
FROM
  photos
  JOIN likes ON photos.id = likes.photo_id
GROUP BY
  photo_id
ORDER BY
  likes DESC
LIMIT
  1;

-- Five most popular tags.
SELECT
  tag_name,
  tag_id,
  count(tag_id) AS tag_count
FROM
  photo_tags
  JOIN tags on photo_tags.tag_id = tags.id
GROUP BY
  tag_id
ORDER BY
  tag_count DESC
LIMIT
  5;

-- finding out the bots. (user account which likes all the photos in the database)
SELECT
  username,
  COUNT(photo_id) as likes,
  if(
    COUNT(photo_id) = (
      SELECT
        COUNT(*)
      FROM
        photos
    ),
    "true",
    "false"
  ) AS isBot
FROM
  users
  JOIN likes ON users.id = likes.user_id
GROUP BY
  likes.user_id;