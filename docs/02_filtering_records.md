# Filtering Records

## Filtering Rows with "Where"

```sql
SELECT name, area FROM cities WHERE area > 4000;
```

- The Actual order of this query: `FROM cities`, `WHERE area > 4000`, `SELECT name, area`

- Comparison Math Operators

1. `=` Are the values equal?
2. `>` Is value on the left greater?
3. `<` Is value on the left less?
4. `>=` Is value on the left greater or equal?
5. `<=` Is value on the left lesser or equal?
6. `<>` Are the values not equal
7. `!=` Are the values not equal
8. `IN` Is the value present in the list?
9. `NOT IN` Is the value not present in the list?
10. `BETWEEN` Is the value between two other values

```sql
SELECT name, area
FROM cities
WHERE area = 8223;

SELECT name, area
FROM cities
WHERE area != 8223;

SELECT name, area
FROM cities
WHERE area BETWEEN 2000 AND 4000;

SELECT name, area
FROM cities
WHERE name IN ('Delhi', 'Shanghai');

SELECT name, area
FROM cities
WHERE area NOT IN (3043, 8223) AND name = 'Delhi';

SELECT name, area
FROM cities
WHERE area NOT IN (3043, 8223) OR name = 'Delhi';

SELECT name, area
FROM cities
WHERE
  area NOT IN (3043, 8223)
  OR name = 'Delhi'
  OR name = 'Tokyo';

-- exercise 1
SELECT name, price
FROM phones
WHERE units_sold > 5000;

SELECT name, manufacturer
FROM phones
-- WHERE manufacturer IN ('Apple', 'Samsung');
WHERE
  manufacturer = 'Apple' OR manufacturer = 'Samsung';

SELECT name, population / area AS population_density
FROM cities
WHERE population / area > 6000;

SELECT name, population / area AS population_density
FROM cities
WHERE population_density > 6000; -- this will cause an error, think of the order of the statements

-- exercise 2
SELECT name, price * units_sold AS total_revenue
FROM phones
WHERE price * units_sold > 1000000;
```

## Updating Rows

```sql
UPDATE cities
SET population = 39505000
WHERE name = 'Tokyo'
```

## Delete Rows

```sql
DELETE FROM cities
WHERE name = 'Tokyo';
```

### Exerice

```sql
UPDATE phones
SET units_sold = 8543
WHERE name = 'N8';

SELECT * FROM phones;

DELETE FROM phones
WHERE manufacturer = 'Samsung';

SELECT * FROM phones;
```
