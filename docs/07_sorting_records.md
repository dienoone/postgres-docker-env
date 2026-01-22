# Sorting Records

## The Basics of Sorting

Select all products sorted by price:

```sql
SELECT *
FROM products
ORDER BY price
```

`ORDER BY` by default goes from least value to the greatest value. To flip that order we can apply `DESC`.

```sql
SELECT *
FROM products
ORDER BY price DESC
```

The defalut is the `ASC`.

## Two Variations on Sorting

We can sort by values doesn't a number like the name also:

```sql
SELECT *
FROM products
ORDER BY name;

SELECT *
FROM products
ORDER BY name DESC;
```

We can use more than one thing to sort upon it:

```sql
SELECT *
FROM products
ORDER BY price, weight DESC;
```

## Offset and Limit

- OFFSET 3: Means skip the first 3 rows of the the result set.
- LIMIT 2: Only give the first two rows of the result set.

```sql
SELECT *
FROM users
OFFSET 40;

SELECT *
FROM users
LIMIT 5;

SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

SELECT *
FROM products
ORDER BY price DESC
LIMIT 5
OFFSET 1;
```
