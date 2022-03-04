SElECT
  *
FROM
  customers
  LEFT JOIN orders ON customers.id = orders.customer_id;

--  IF amount is null then replace it with 0.00
SELECT
  first_name,
  last_name,
  IFNULL(amount, 0.00)
FROM
  customers
  LEFT JOIN orders ON customers.id = orders.customer_id;