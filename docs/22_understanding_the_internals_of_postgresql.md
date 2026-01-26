# Understanding the Internals of PostgreSQL

## Thinking About Performance

- You can get away with quick tips and hints
- Much easier to understand performance if you understand the internals
- Take a look at how data is stored and accessed
- Investigate at how indexes are stored and used
- Put these together to understand how queries are executed

## Where Does Postgres Store Data?

To know where postgres store data, run this query:

```sql
SHOW data_directory;

-- output: => /var/lib/postgresql/data
```

All database are stored inside a dir called base.

```shell
1      16384  16510  16521  4      5
```

These dirs are the database that we have. to know the exact name:

```sql
SELECT oid, datname
FROM pg_database;

SELECT * FROM pg_class;
```

## Heaps, Blocks, and Tuples

- `Heap` or `Heap File` => File that contains all the data (rows) of our table.
- `Tuple` or `Item` => Individual row from the table.
- `Block` or `Page` => The heap file is divided into many different `blocks` or `pages`. Each page/block stores some number of rows. `8kb` large

## Block Data Layout

## Heap File Layout

- Doc page => `https://www.postgresql.org/docs/current/storage-page-layout.html`
