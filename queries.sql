SELECT p1.name, (
  SELECT COUNT(*)
  FROM orders AS o1
  WHERE o1.product_id = p1.id
) AS num_orders
FROM products AS p1