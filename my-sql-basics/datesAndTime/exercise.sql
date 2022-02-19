-- **********************************************************************************************************************************************************
-- Print out the current day of the week.
-- **********************************************************************************************************************************************************
DAYNAME(now());

-- **********************************************************************************************************************************************************
-- what is difference between DATETIME and TIMESTAMP?
-- **********************************************************************************************************************************************************
-- Supported range for DATETIME is '1000-01-01 00:00:00' to '9999-12-31 23:59:59' while for TIMESTAMP, it is '1970-01-01 00:00:01' UTC to '2038-01-09 03:14:07' UTC.
-- Prior to MySQL 5.6.4, TIMESTAMP requires 4 bytes (+3 bytes for fractional seconds) to store the data while DATETIME requires 8 bytes (+3 bytes for fractional seconds).
-- As of MySQL 5.6.4, DATETIME requires 5 bytes + 3 additional bytes for fractional seconds data storing.
-- In MySQL5+, TIMESTAMP value converts from the current time to UTC and vice-versa while DATETIME does not do any conversion.
-- TIMESTAMPdiffers with current time zone settings while DATETIME remains constant.
-- TIMESTAMP data can be indexed while the DATETIME data cannot.
-- Queries with DATETIME will not be cached but queries with TIMESTAMP will be cached.
-- **********************************************************************************************************************************************************
-- Print current date and time in this format mm/dd/yyyy.
SELECT
  DATE_FORMAT(NOW(), "%d/%m/%Y");

-- **********************************************************************************************************************************************************
-- **********************************************************************************************************************************************************
-- Print out the current day and time using this format January 2nd at 3:30 and April 1st at 10:18 PM.
SELECT
  DATE_FORMAT(NOW(), "%M %D at %h:%i");

SELECT
  DATE_FORMAT(NOW(), "%M %D at %h:%i %p");

-- **********************************************************************************************************************************************************
-- **********************************************************************************************************************************************************
-- Create a tweets table that stores tweet content, user name, and timestamp.
CREATE TABLE tweets(
  content TEXT,
  user_name VARCHAR(100),
  created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO
  tweets(content, user_name)
values
  ("this is my first tweet!!", "nirmalkar");

INSERT INTO
  tweets(content, user_name)
values
  ("this is my second tweet!!", "nirmalkar");

INSERT INTO
  tweets(content, user_name)
values
  ("this is my third tweet!!", "nirmalkar");

-- O/P:
-- +---------------------------+-----------+---------------------+
-- | content                   | user_name | created_at          |
-- +---------------------------+-----------+---------------------+
-- | this is my first tweet!!  | nirmalkar | 2022-02-19 13:14:18 |
-- | this is my second tweet!! | nirmalkar | 2022-02-19 13:14:57 |
-- | this is my third tweet!!  | nirmalkar | 2022-02-19 13:15:04 |
-- +---------------------------+-----------+---------------------+
-- **********************************************************************************************************************************************************