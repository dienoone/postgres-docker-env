# Utility Operators Keywords and Functions

## The Greatest Value in a List

```sql
SELECT GREATEST(200, 10, 30);
```

Compute the const to ship each item. Shippping is the maximum of (weight \* $2) or $30

```sql
SELECT name, weight, GREATEST(weight * 2, 30)
FROM products
```

## And the Least Value in a List!

```sql
SELECT LEAST(1000, 20, 50, 100);
```

All products are on sale!. Price is the least of the products price \* 0.5 or 400

```sql
SELECT name, price, LEAST(price * 0.5, 400)
FROM products;
```

## The Case Keyword

Print each product and it's price. Also print a description of the price, if price > 600 then 'high', if price > 300 then 'medium', else print 'cheap'

```sql
SELECT
  name,
  price,
  CASE
    WHEN price > 600 THEN 'high'
    WHEN price > 300 THEN 'medium'
    ELSE 'cheap'
  END
FROM products;
```
