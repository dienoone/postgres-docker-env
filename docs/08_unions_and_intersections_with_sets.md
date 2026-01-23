# Unions and Intersections with Sets

## Handling Sets with Union

Find the 4 products with the highest price and the 4 products with the highest price/weight ratio

```sql
(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
UNION
(
  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4
);
```

As we noticed, there are 7 products only, this is because there are one product exists in the two queries so union produce it one single time, if we want to include it we can use `UNION ALL`

```sql
(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
UNION ALL
(
  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4
);
```

## A Few Notes on Union

1. we don't have to use the () of the union statement like this:

```sql
SELECT * FROM products;
UNION
SELECT * FROM products;
```

But why we use this in this:

```sql
(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
UNION ALL
(
  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4
);
```

if we do so:

```sql
(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
UNION

  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4;

```

This will cause an error, because the database doesn't know if the order by in the second query must apply on this query or the result set.

2. To use union, the two queries must produce the same structure of columns and same data types also...

## Commonalities with Intersect

- `UNION` => Join together the results of two queries and remove duplicates rows.
- `UNION ALL` => Join together the results of two queries
- `INTERSECT` => Find the rows common in the results of two queries and Revomve duplicates.
- `INTERSECT ALL` => Find the rows common in the results of two queries
- `EXCEPT` => Find the rows that are present in first query but not second query. Remove duplicates.
- `EXCEPT ALL` => Find the rows that are present in first query but not second query.

```sql
(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
INTERSECT
(
  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4
);
```

## Removing Commonalities with Except

- NOTE: the order of the queries does matter here...

```sql
(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
EXCEPT
(
  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4
);
```
