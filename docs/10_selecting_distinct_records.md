# Selecting Distinct Records

## Selecting Distinct Values

What are unique departments are there ?

```sql
SELECT DISTINCT department
FROM products;

SELECT COUNT(DISTINCT department)
FROM products;

SELECT DISTINCT department, name
FROM products;

-- ERROR
SELECT COUNT(DISTINCT department, name)
FROM products;
```

NOTE: you can use `GROUP BY` in place of `DISTINCT`, but you cannont use `DISTINCT` in place or `GROUP BY`.
