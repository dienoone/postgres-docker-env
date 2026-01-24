# PostgreSQL Complex Datatypes

- Notes on PGAdmin:
  - Tool to manage and inspect a Postgres database
  - Can connect to local or remote databases
  - Can view/change just about anything in PG

1. We are running a Postgres Server locally
2. A PG Server can contain multiple databases
3. All data for a single app lives in a single DB
4. Having multiple DB's is more about working with more than one app on your machine

## Data Types

1. Numbers
2. Currency
3. Binary
4. Date/Time
5. Character
6. JSON
7. Geometric
8. Range
9. Arrays
10. Boolean
11. XML
12. UUID

## 1. Numbers:

- Numbers Without any decimal points:

  - smallint
  - integer
  - bigint

- Numbers with deciaml points

  - decimal
  - numeric
  - real
  - double precision
  - float

- No decimal point, auto increment:
  - serial
  - bigserial
  - smallserial

### Fast Rules on Numeric Data Types

1. 'id' column of any table => mark column as `SERIAL`
2. Need to store a number without a decimal => mark column as `INTEGER`
3. Need to store a number with a decimal and this data needs to be very accurate => mark column as `NUMERIC`
4. Need to store a number with a decimal and the decimal doesn't make a big difference => mark column as `DOUBLE PRECISION`

## 2. Reminder on Character Types:

- `CHAR(5)` => Store some charactesr, length will always be 5 even if PG has to insert spaces.
- `VARCHAR` => Store any length of string
- `VARCHAR(40)` => Store a string up to 40 characters, automatically remove extra characters
- `TEXT` => Store any length of string

## 3. Boolean Data Types

- `true, yes, on, 1, t, y` => `TRUE`
- `false, no, off, 0, f, n` => `FALSE`
- `null` => `NULL`
