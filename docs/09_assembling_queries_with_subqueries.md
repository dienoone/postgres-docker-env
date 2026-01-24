# Assembling Queries with SubQueries

## What's a Subquery?

List the name and price of all products that are more expensive than all products in teh 'Toys' department.

```sql
SELECT name, price
FROM products
WHERE price > (
  SELECT MAX(price)
  FROM products
  WHERE department = 'Toys'
);
```

## Thinking About the Structure of Data

- Understanding the shape of a query result is key!

`SELECT * FROM orders;` => Many rows, many columns
`SELECT id FROM orders;` => Many rows, one column
`SELECT COUNT(*) FROM orders;` => One row, one column (single value) `Scalar query`

## Subqueries in a Select

To use a subquery inside `SELECT` statement, the subquery must produce a single value, but why ???

Examples:

```sql
SELECT name, price, (
  SELECT MAX(price) FROM products
) AS id_3_price
FROM products
WHERE price > 876;

SELECT name, price, (
  SELECT price FROM products WHERE id = 3
) AS id_3_price
FROM products
WHERE price > 876;

-- Excersie
SELECT name, price, price / (SELECT MAX(price) FROM phones) AS price_ratio
FROM phones;
```

## Subqueries in a From

- Any subquery, so long as the outer selects/wheres/etc are compatiable.
- Subquery in `FROM` must have an alias applied to it.

```sql
SELECT name, price_weight_ratio
FROM (
  SELECT
    name,
    price / weight AS price_weight_ratio
  FROM products
) AS p
WHERE price_weight_ratio > 5;
```

## From Subqueries that Return a Value

```sql
SELECT *
FROM (SELECT MAX(price) FROM products);
```

## Example of a Subquery in a From

Find the average number of orders for all users. (total no. of users / total no. of ordres)

```sql
SELECT AVG(order_count)
FROM (
  SELECT user_id, COUNT(*) AS order_count
  FROM orders
  GROUP BY user_id
);
```

## Subqueries in a Join Clause

- Any subquery that returns data compatible with the `ON` clause

```sql
SELECT first_name
FROM users
JOIN (
  SELECT user_id
  FROM orders
  WHERE product_id = 3
) AS o
ON o.user_id = users.id;

SELECT first_name
FROM users
JOIN orders ON orders.user_id = users.id
WHERE orders.product_id = 3;
```

## More Useful - Subqueries with Where

- Structure of data allowed to be returned by subquery changes depending on the comparison operator !

Show the id of orders that involve a product with a price/weight ratio greater than 50.

```sql
SELECT id
FROM orders
WHERE product_id IN (
  SELECT id
  FROM products
  WHERE price / weight > 50
)
```

## Probably Too Much About Correlated Subqueries

Show the name, department, and price of the most expensive product in each department

```sql
-- It's like a nisted loop
SELECT name, department, price
FROM products AS p1
WHERE p1.price = (
  SELECT MAX(price)
  FROM products AS p2
  WHERE p2.department = p1.department
);
```

## More on Correlated Subqueries

Without using a join or a group by, print the number of orders for each product

```sql
SELECT p1.name, (
  SELECT COUNT(*)
  FROM orders AS o1
  WHERE o1.product_id = p1.id
) AS num_orders
FROM products AS p1
```
