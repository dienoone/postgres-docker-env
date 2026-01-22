# Aggregation Of Records

## Aggregating and Grouping

Grouping:

- Reduces many rows down to fewer rows
- Donw by using the `GROUP BY` keyword
- Visualizing the result is key to use

Aggregates:

- Reduces many values down to one
- done by using `aggregate functions`

## Picturing Group By

Let's take a look of this query:

```sql
SELECT user_id
FROM comments
GROUP BY user_id;
```

What `GROUP BY user_id` does, First, it will find the set of all unique user_id's, Then, Take each row and assign it to a group based on its user_id.

## Aggregate Functions

- `COUNT()` => returns the number of values in a group of values
- `SUM()` => Finds the `sum` of a group of numbers
- `AVG()` => Finds the `average` of a group of numbers
- `MIN()` => Finds the `minimum` value of a group of numbers
- `MAX()` => Finds the `maximum` value of a group of numbers

```sql
SELECT MAX(id)
FROM comments;

SELECT MIN(id)
FROM comments;

SELECT AVG(id)
FROM comments;

SELECT COUNT(id)
FROM comments;

SELECT SUM(id)
FROM comments;
```

NOTE: we can't select a column next to an aggregate functions like this:

```sql
-- this will throw an error
SELECT COUNT(id), id
FROM comments;
```

## Combining Group By and Aggregates

```sql
SELECT user_id, COUNT(id) AS num_comments_created
FROM comments
GROUP BY user_id;
```

## A Gotcha with Count

The `COUNT` aggregate function doesn't count the `NULL` values, so if you want to count them also use the `*` instead of an column.

```sql
SELECT * FROM photos;

SELECT COUNT(*) FROM photos;

SELECT user_id, COUNT(*)
FROM comments
GROUP BY user_id;
```

## Visualizing More Grouping

Find the number of comments for each photo.

```sql
SELECT photo_id, COUNT(*)
FROM comments
GROUP BY photo_id
```

## Filtering Groups with Having

This is the order of the `SELECT` statement with the keywords:

1. `FROM`: Specifies starting set of rows to work with.
2. `JOIN`: Merges in data from additional tables.
3. `WHERE`: Filters the set of rows.
4. `GROUP BY`: Groups rows by a unique set of values
5. `HAVING`: Filters the set of groups

NOTE: we can't use `HAVING` without `GROUP BY`.

## Having In Action

Find the number of comments for each photo where the photo_id is less than 3 and the photo has more than 2 comments:

```sql
SELECT photo_id, COUNT(*)
FROM comments
WHERE photo_id < 3
GROUP BY photo_id
HAVING COUNT(*) > 2
```

Find the users where the user has commented on the first 50 photos and the user added more than or equal 20 comments of those photos.

```sql
SELECT user_id, COUNT(*)
FROM comments
WHERE photo_id < 50
GROUP BY user_id
HAVING COUNT(*) > 20
```
