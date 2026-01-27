# A Look at Indexes for Performance

## Full Table Scans

- PG has to load many (or all) rows from the heap file to memory
- frequently (but not always) poor performance

## What's an Index

- Data structure that efficiently tells us what block/index a record is stored at.

## How an Index Works

- At first, we need to know which column do we want to have very fast lookups on?
- Let's say that we need `username` column.
- Extract only the property we want to do fast lookups by and the block/index for each
- Sort in some meaningful way: Alphabetical for text, Value for number, etc.
- `Organize into a tree data structure`. Evenly distribute values in the leaf nodes, in order left to right
- Add helpers to the root node.

## Creating an Index

```sql
CREATE INDEX ON users(username);
CREATE INDEX username_idx ON users(username);

DROP INDEX users_username_idx;
```

## Benchmarking Queries

```sql
-- CREATE INDEX users_username_idx ON users(username);

-- DROP INDEX users_username_idx;

-- with index: 0.118ms
-- EXPLAIN ANALYZE SELECT *
-- FROM users
-- WHERE username = 'Emil30';

-- without index: 1.208ms
EXPLAIN ANALYZE SELECT *
FROM users
WHERE username = 'Emil30';
```

## Downsides of Indexes

```sql
SELECT pg_size_pretty(pg_relation_size('users'));
SELECT pg_size_pretty(pg_relation_size('users_username_idx'));
```

- Can be large! Stores data from at least one column of the real table.
- Slows down insert/update/delete - the index has to be updated!
- Index might not actually get used!

## Index Types

- B-Tree Index => General purpose index. 99% of the time you want this.
- Hash => Speeds up simple equality checks.
- GiST => Geometry, full-text search.
- SP-GiST => Clustered data, such as dates - many rows might have the same year.
- GIN => For columns that contain arrays or JSON data.
- BRIN => Specialized for really large datasets.

## Automatically Generated Indexes

- Postgres automatically creates an index for the primary key column of every table.
- Postgres automatically creates an index for any 'unique' constraint.
- These don't get listed under 'indexes' in PGAdmin!

```sql
SELECT relname, relkind
FROM pg_class
WHERE relkind = 'i';
```
