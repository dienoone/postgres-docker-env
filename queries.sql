SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;

-- Some GROUP BY Practice

SELECT paid, COUNT(*)
FROM orders
GROUP BY paid

SELECT first_name, last_name, paid
FROM users
JOIN orders ON orders.user_id = users.id