SELECT
  *
FROM
  customers
  RIGHT JOIN orders ON customers.id = orders.customer_id;