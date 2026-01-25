# Database Side Validation and Constraints

## Creating and Viewing Tables in PGAdmin

Row-Level Validation => Things we can check for when a row is being inserted/updated:

- Is a give value defined ?
- Is a value unique in it's column ?
- Is a value >, <, >=, <=, = some other value ?

So, we will create a new database called `Validation`, and then create this sql:

```sql
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  department VARCHAR(50),
  price INTEGER,
  weight INTEGER
);

INSERT INTO products (name, department, price, weight)
VALUES
  ('Shirt', 'Clothes', 20, 1);
```

## Applying a Null Constraint

Now, Let's try this:

```sql
-- The price will be added as NULL, and this is an a problem for this specific application...
INSERT INTO products (name, department, weight)
VALUES
	('Pants', 'Clothes', 3);
```

To solve this problem, we could use `NULL` contstraint.

```sql
-- When creating the table
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  department VARCHAR(50),
  price INTEGER NOT NULL,
  weight INTEGER
);

-- after the table is created
ALTER TABLE products
ALTER COLUMN price
SET NOT NULL
-- for our current situation here, we will get this error: ERROR:  column "price" of relation "products" contains null values
```

## Solving a Gotcha with Null Constraints

```sql
UPDATE products
SET price = 9999
WHERE price = NULL;

-- and now we can update the column definition...
ALTER TABLE products
ALTER COLUMN price
SET NOT NULL;

-- and if we try to insert a row:
INSERT INTO products (name, department, weight)
VALUES
	('Shose', 'Clothes', 5); -- we will get this error: ERROR:  null value in column "price" of relation "products" violates not-null constraint Failing row contains (3, Shose, Clothes, null, 5).
```

## Default Column Values

```sql
-- When creating the table
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL,
  price INTEGER NOT NULL DEFAULT 9999,
  weight INTEGER
);

-- after the table is created
ALTER TABLE products
ALTER COLUMN price
SET DEFAULT 9999;

-- and now we can omit the price column when inserting the row:
INSERT INTO products (name, department, weight)
VALUES
	('Gloves', 'Tools', 1);
```

## Applying a Unique Constraint to One column

```sql
-- When creating the table
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  department VARCHAR(50) NOT NULL,
  price INTEGER NOT NULL DEFAULT 9999,
  weight INTEGER
);

-- after the table is created
ALTER TABLE products
ADD UNIQUE (name);
```

## Multi-Column Uniqueness

To drop a contsraint:

```sql
ALTER TABLE products
DROP CONSTRAINT [constraint-name]
```

```sql
-- When creating the table
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL,
  price INTEGER NOT NULL DEFAULT 9999,
  weight INTEGER,
  UNIQUE (name, department)
);

-- after the table is created
ALTER TABLE products
ADD UNIQUE (name, department);
```

## Adding a Validation Check

Let's take a look at this query:

```sql
-- the price is a negative value
INSERT INTO products
VALUES
  ('Belt', 'Clothes', -99, 1);
```

To solve this we will use `CHECK` validation:

```sql
-- When creating the table
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL,
  price INTEGER NOT NULL DEFAULT 9999 CHECK (price > 0),
  weight INTEGER,
  UNIQUE (name, department)
);

-- after the table is created
ALTER TABLE products
ADD CHECK (price > 0);
```

## Checks Over Multiple Columns

```sql
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  est_delivery TIMESTAMP NOT NULL,
  CHECK (created_at > est_delivery)
);
```
