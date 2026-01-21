# Simple - But Powerful - SQL Statements

## Creating a Table

```sql
CREATE TABLE cities (
  name VARCHAR(50),
  country VARCHAR(50),
  population INTEGER,
  area INTEGER
);
```

- Keywords: Tell the database that we want to do something. Always written out in capital letters `CREATE TABLE`.
- Identifiers: Tell the database what thing we want to act on. Always written out in lower letters `cities`.

## Inserting Data Into Tables

```sql
INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo', 'Japan', 38505000, 8223);

INSERT INTO cities (name, country, population, area)
VALUES
  ('Delhi', 'India', 28125000, 2240),
  ('Shanghai', 'China', 22125000, 4015),
  ('Sao Paulo', 'Brazil', 20935000, 3043);
```

## Inserting Data Into Tables

```sql
SELECT * FROM cities;
SELECT name, country FROM cities;
SELECT name, population FROM cities;
SELECT area, name, population FROM cities;
SELECT name, name, name FROM cities;
```

## Calculated Columns

- Math operations

1. `+` Add
2. `-` Subtract
3. `*` Multiply
4. `/` Divide
5. `^` Exponent
6. `|/` Square root
7. `@` Absoulte Value
8. `%` Remainder

```sql
SELECT name, population / area FROM cities;

SELECT name, population / area AS population_density
FROM cities;

-- Exerice
SELECT name, price * units_sold AS revenue
FROM phones;
```

## String Opreations and Functions

- `||` Join two strings
- `CONCAT()` Join two strings
- `LOWER()` Gives a lowercase string
- `UPPER()` Gives an uppercase string
- `LENGTH()` Gives a number of characters of a string

```sql
SELECT name || ', ' || country AS location FROM cities;
SELECT CONCAT(name, ', ', country) AS location FROM cities;
SELECT CONCAT(UPPER(name), ', ', UPPER(country)) AS location FROM cities;
SELECT UPPER(CONCAT(name, ', ', country)) AS location FROM cities;
```
