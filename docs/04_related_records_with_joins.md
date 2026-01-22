# Related Records with Joins

- adding some data

```sql
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(50)
);

CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  contents VARCHAR(240),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  photo_id INTEGER REFERENCES photos(id) ON DELETE CASCADE
);

INSERT INTO users (username)
VALUES
  ('Reyna.Marvin'),
  ('Micah.Cremin'),
  ('Alfredo66'),
  ('Gerard_Mitchell42'),
  ('Frederique_Donnelly');

INSERT INTO photos (url, user_id)
VALUES
  ('https://santina.net', 3),
  ('https://alayna.net', 5),
  ('https://kailyn.name', 3),
  ('http://marjolaine.name', 1),
  ('http://chet.net', 5),
  ('http://jerrold.org', 2),
  ('https://meredith.net', 4),
  ('http://isaias.net', 4),
  ('http://dayne.com', 4),
  ('http://colten.net', 2),
  ('https://adelbert.biz', 5),
  ('http://kolby.org', 1),
  ('https://deon.biz', 2),
  ('https://marina.com', 5),
  ('http://johnson.info', 1),
  ('https://linda.info', 2),
  ('https://tyrique.info', 4),
  ('http://buddy.info', 5),
  ('https://elinore.name', 2),
  ('http://sasha.com', 3);

INSERT INTO comments (contents, user_id, photo_id)
VALUES
  ('Quo velit iusto ducimus quos a incidunt nesciunt facilis.', 2, 4),
  ('Non est totam.', 5, 5),
  ('Fuga et iste beatae.', 3, 3),
  ('Molestias tempore est.', 1, 5),
  ('Est voluptatum voluptatem voluptatem est ullam quod quia in.', 1, 5),
  ('Aut et similique porro ullam.', 1, 3),
  ('Fugiat cupiditate consequatur sit magni at non ad omnis.', 1, 2),
  ('Accusantium illo maiores et sed maiores quod natus.', 2, 5),
  ('Perferendis cumque eligendi.', 1, 2),
  ('Nihil quo voluptatem placeat.', 5, 5),
  ('Rerum dolor sunt sint.', 5, 2),
  ('Id corrupti tenetur similique reprehenderit qui sint qui nulla tenetur.', 2, 1),
  ('Maiores quo quia.', 1, 5),
  ('Culpa perferendis qui perferendis eligendi officia neque ex.', 1, 4),
  ('Reprehenderit voluptates rerum qui veritatis ut.', 1, 1),
  ('Aut ipsum porro deserunt maiores sit.', 5, 3),
  ('Aut qui eum eos soluta pariatur.', 1, 1),
  ('Praesentium tempora rerum necessitatibus aut.', 4, 3),
  ('Magni error voluptas veniam ipsum enim.', 4, 2),
  ('Et maiores libero quod aliquam sit voluptas.', 2, 3),
  ('Eius ab occaecati quae eos aut enim rem.', 5, 4),
  ('Et sit occaecati.', 4, 3),
  ('Illum omnis et excepturi totam eum omnis.', 1, 5),
  ('Nemo nihil rerum alias vel.', 5, 1),
  ('Voluptas ab eius.', 5, 1),
  ('Dolor soluta quisquam voluptatibus delectus.', 3, 5),
  ('Consequatur neque beatae.', 4, 5),
  ('Aliquid vel voluptatem.', 4, 5),
  ('Maiores nulla ea non autem.', 4, 5),
  ('Enim doloremque delectus.', 1, 4),
  ('Facere vel assumenda.', 2, 5),
  ('Fugiat dignissimos dolorum iusto fugit voluptas et.', 2, 1),
  ('Sed cumque in et.', 1, 3),
  ('Doloribus temporibus hic eveniet temporibus corrupti et voluptatem et sint.', 5, 4),
  ('Quia dolorem officia explicabo quae.', 3, 1),
  ('Ullam ad laborum totam veniam.', 1, 2),
  ('Et rerum voluptas et corporis rem in hic.', 2, 3),
  ('Tempora quas facere.', 3, 1),
  ('Rem autem corporis earum necessitatibus dolores explicabo iste quo.', 5, 5),
  ('Animi aperiam repellendus in aut eum consequatur quos.', 1, 2),
  ('Enim esse magni.', 4, 3),
  ('Saepe cumque qui pariatur.', 4, 4),
  ('Sit dolorem ipsam nisi.', 4, 1),
  ('Dolorem veniam nisi quidem.', 2, 5),
  ('Porro illum perferendis nemo libero voluptatibus vel.', 3, 3),
  ('Dicta enim rerum culpa a quo molestiae nam repudiandae at.', 2, 4),
  ('Consequatur magnam autem voluptas deserunt.', 5, 1),
  ('Incidunt cum delectus sunt tenetur et.', 4, 3),
  ('Non vel eveniet sed molestiae tempora.', 2, 1),
  ('Ad placeat repellat et veniam ea asperiores.', 5, 1),
  ('Eum aut magni sint.', 3, 1),
  ('Aperiam voluptates quis velit explicabo ipsam vero eum.', 1, 3),
  ('Error nesciunt blanditiis quae quis et tempora velit repellat sint.', 2, 4),
  ('Blanditiis saepe dolorem enim eos sed ea.', 1, 2),
  ('Ab veritatis est.', 2, 2),
  ('Vitae voluptatem voluptates vel nam.', 3, 1),
  ('Neque aspernatur est non ad vitae nisi ut nobis enim.', 4, 3),
  ('Debitis ut amet.', 4, 2),
  ('Pariatur beatae nihil cum molestiae provident vel.', 4, 4),
  ('Aperiam sunt aliquam illum impedit.', 1, 4),
  ('Aut laudantium necessitatibus harum eaque.', 5, 3),
  ('Debitis voluptatum nesciunt quisquam voluptatibus fugiat nostrum sed dolore quasi.', 3, 2),
  ('Praesentium velit voluptatem distinctio ut voluptatum at aut.', 2, 2),
  ('Voluptates nihil voluptatum quia maiores dolorum molestias occaecati.', 1, 4),
  ('Quisquam modi labore.', 3, 2),
  ('Fugit quia perferendis magni doloremque dicta officia dignissimos ut necessitatibus.', 1, 4),
  ('Tempora ipsam aut placeat ducimus ut exercitationem quis provident.', 5, 3),
  ('Expedita ducimus cum quibusdam.', 5, 1),
  ('In voluptates doloribus aut ut libero possimus adipisci iste.', 3, 2),
  ('Sit qui est sed accusantium quidem id voluptatum id.', 1, 5),
  ('Libero eius quo consequatur laudantium reiciendis reiciendis aliquid nemo.', 1, 2),
  ('Officia qui reprehenderit ut accusamus qui voluptatum at.', 2, 2),
  ('Ad similique quo.', 4, 1),
  ('Commodi culpa aut nobis qui illum deserunt reiciendis.', 2, 3),
  ('Tenetur quam aut rerum doloribus est ipsa autem.', 4, 2),
  ('Est accusamus aut nisi sit aut id non natus assumenda.', 2, 4),
  ('Et sit et vel quos recusandae quo qui.', 1, 3),
  ('Velit nihil voluptatem et sed.', 4, 4),
  ('Sunt vitae expedita fugiat occaecati.', 1, 3),
  ('Consequatur quod et ipsam in dolorem.', 4, 2),
  ('Magnam voluptatum molestias vitae voluptatibus beatae nostrum sunt.', 3, 5),
  ('Alias praesentium ut voluptatem alias praesentium tempora voluptas debitis.', 2, 5),
  ('Ipsam cumque aut consectetur mollitia vel quod voluptates provident suscipit.', 3, 5),
  ('Ad dignissimos quia aut commodi vel ut nisi.', 3, 3),
  ('Fugit ut architecto doloremque neque quis.', 4, 5),
  ('Repudiandae et voluptas aut in excepturi.', 5, 3),
  ('Aperiam voluptatem animi.', 5, 1),
  ('Et mollitia vel soluta fugiat.', 4, 1),
  ('Ut nemo voluptas voluptatem voluptas.', 5, 2),
  ('At aut quidem voluptatibus rem.', 5, 1),
  ('Temporibus voluptates iure fuga alias minus eius.', 2, 3),
  ('Non autem laboriosam consectetur officiis aut excepturi nobis commodi.', 4, 3),
  ('Esse voluptatem sed deserunt ipsum eaque maxime rerum qui.', 5, 5),
  ('Debitis ipsam ut pariatur molestiae ut qui aut reiciendis.', 4, 4),
  ('Illo atque nihil et quod consequatur neque pariatur delectus.', 3, 3),
  ('Qui et hic accusantium odio quis necessitatibus et magni.', 4, 2),
  ('Debitis repellendus inventore omnis est facere aliquam.', 3, 3),
  ('Occaecati eos possimus deleniti itaque aliquam accusamus.', 3, 4),
  ('Molestiae officia architecto eius nesciunt.', 5, 4),
  ('Minima dolorem reiciendis excepturi culpa sapiente eos deserunt ut.', 3, 3);
```

The more tables we have, the more interesting quesutions we can answer like:

- Find all the comments for the photo with `ID = 3`, along with the username of the comment author.
- Find the photo with `ID = 10` and get the `number of comments` attacted to it.
- Find the `average number of comments` per photo.
- Find the user with `the most activity` (most comments + most photos)
- Find the photo with `most comments` attacted to it.
- Calculate the `average number of characters` per comment.

To do so, we will use `Joins` and `Aggregation`:

- Joins:
  - Produces values by merging together rows from different related tables.
  - Use a join most times that you're asked to find data that involves multiple resources.
- Aggregation:
  - Looks at many rows and calculates a single value.
  - Works like `most`, `average`, `least` are a sign that you need to use an aggregation.

## Joining Data from Different Tables

1. For each comment, show the contents of the comment and the username of the user who wrote the comment

```sql
SELECT contents, username
FROM comments
JOIN users ON users.id = comments.user_id;
```

- The order of execution is: `FROM`, `JOIN`, `SELECT`

2. For each comment, list the contents of the comment and the URL of the photo the comment was added to.

```sql
SELECT contents, url
FROM comments
JOIN photos ON photos.id = comments.photo_id;
```

## Alternate Forms of Syntax

- Notes on Joins:
  - Table order between `FROM` and `JOIN` frequently makes a difference.
  - We must give context if column names collide.
  - Tables can be renamed using the `AS` keyword
  - There are a few kinds on joins!

```sql
SELECT p.id, c.id
FROM photos AS p
JOIN comments As c ON p.id = c.photo_id;
```

## Missing Data in Joins

Show each photo url and the username of the poster

```sql
-- NOTE: the order doesn't matter here...
SELECT url, username
FROM photos
JOIN users ON users.id = photos.user_id;

SELECT url, username
FROM users
JOIN photos ON photos.user_id = users.id;
```

Now, what we want to do here is that, show each photo listed in the database, even if the photo doesn't have a user_id, for our database right now, all photos already has a user_id, now let's try something interesting, let's add a photo doesn't have a user_id (put user_id to `NULL`):

```sql
INSERT INTO photos (url, user_id)
VALUES ('https://banner.jpg', NULL);
```

Now, Let's try our query again:

```sql
SELECT url, username
FROM photos
JOIN users ON users.id = photos.user_id;
```

You will notice that the image doesn't exist the query result, and if we want to make sure that is the photo exist, we can do that:

```sql
SELECT * FROM photos;
```

Why this happens??

## Why Wasn't It Included

The problem is that, the type of the join we currently use, is if there are any row from the photos table doesn't match a row from the users table, drop that raw from the result set. This is why the photo with user_id is equal to NULL doesn't show in the result set.

What if we want to include this photo in the result set, in this case we should use another kind of Join.

## Four Kinds of Joins

1. Inner Join
2. Outer Join: LEFT Outer Join and RIGHT Outer Join
3. Full Join
4. Cross Join

## Each Join in Practice

```sql
INSERT INTO users(username)
VALUES ('Nicole');

SELECT url, username
FROM photos
LEFT JOIN users ON users.id = photos.user_id;

SELECT url, username
FROM photos
RIGHT JOIN users ON users.id = photos.user_id;

SELECT url, username
FROM photos
FULL JOIN users ON users.id = photos.user_id;

SELECT url, username
FROM photos
CROSS JOIN users;
```

## Does Order Matter?

```sql
SELECT url, username
FROM photos
LEFT JOIN users ON users.id = photos.user_id;

SELECT url, username
FROM users
LEFT JOIN photos ON photos.user_id = users.id;
```

## Exercise

- write a query that will return the `title` of each book, along with the `name` of the author. All authors should be included, even if they do not have a book associated with them.

```sql
SELECT title, name
FROM books
RIGHT JOIN authors ON authors.id = books.author_id;

SELECT title, name
FROM authors
LEFT JOIN books ON books.author_id = authors.id;
```

## Where with Join

- Users can comment on photos that they posted. List the url and contents for every photo/comment where this occured.

```sql
SELECT url, contents
FROM comments
JOIN photos ON photos.id = comments.photo_id
WHERE comments.user_id = photos.user_id;
```

## Three Way Joins

```sql
SELECT url, contents, username
FROM comments
JOIN photos ON photos.id = comments.photo_id
JOIN users ON users.id = comments.user_id AND users.id = photos.user_id
```

## A Bit of Practice

Hmmm...I wonder if any authors are writing their own reviews for books! You are working with a database of `books`, `authors`, and `reviews`

Write a query that will return the `title` of each book, along with the `name` of the author, and the `rating` of a review. Only show rows where the author of the book is also the author of the review.

```sql
SELECT title, name, rating
FROM books
JOIN reviews ON reviews.book_id = books.id
JOIN authors ON authors.id = books.author_id AND auhors.id = reviews.reviewer_id
```
