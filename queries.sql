SELECT GREATEST(20, 10, 30);

SELECT name, weight, GREATEST(weight * 2, 30)
FROM products

SELECT LEAST(1000, 20, 50, 100);

SELECT name, price, LEAST(price * 0.5, 400)
FROM products;

SELECT
  name,
  price,
  CASE
    WHEN price > 600 THEN 'high'
    WHEN price > 300 THEN 'medium'
    ELSE 'cheap'
  END
FROM products;