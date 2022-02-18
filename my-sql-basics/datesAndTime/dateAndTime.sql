-- DATE is used to store date. Format YYYY-MM-DD.
-- TIME is used to store time. Format HH:MM:SS.
-- DATETIME is used to store date and time. Format YYYY-MM-DD HH:MM:SS.
INSERT INTO
  people(name, birth_date, birth_time, birth_dt)
VALUES
  (
    "Hemant",
    "1994-07-06",
    "01:32:12",
    "1994-07-06 01:32:12"
  ),
  (
    "Ravi",
    "1994-12-11",
    "12:32:32",
    "1994-12-11 12:32:32"
  ),
  ("newBorn", CURDATE(), CURTIME(), NOW());

-- DATE_ADD and DATEDIFF functions are used to add or subtract days, months, years from a date.
SELECT
  name,
  birth_dt,
  DATE_ADD(birth_dt, INTERVAL 1 MONTH)
FROM
  people;

SELECT
  name,
  birth_date,
  DATEDIFF(now(), birth_dt)
FROM
  people;

-- TIMESTAMP 
CREATE TABLE blogs(
  content VARCHAR(100),
  changed_at TIMESTAMP DEFAULT NOW()
);

SELECT
  *
FROM
  blogs
ORDEr BY
  changed_at DESC;