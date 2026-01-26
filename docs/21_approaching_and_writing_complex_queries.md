# Approaching and Writing Complex Queries

## Highest User ID's Exercise

Select the 3 users with the highest ID's from the users table:

```sql
SELECT *
FROM users
ORDER BY id DESC
LIMIT 3;
```

## Posts by a Particular User

Join the users and posts table. Show the username of user ID 200 and the captions of all posts they have created

```sql
SELECT username, caption
FROM posts
JOIN users ON users.id = posts.user_id
WHERE posts.user_id = 200;
```

## Likes Per User

Show each username and the number of 'likes' that they have created

```sql
SELECT users.username, COUNT(likes.*)
FROM users
JOIN likes ON likes.user_id = users.id
GROUP BY users.username;
```
