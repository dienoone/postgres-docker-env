# SQL and PostgreSQL: The Complete Developer's Guide

we can use an online tool called `pg-sql.com`

## Simple - But Powerful - SQL Statements

### Creating a Table

```sql
CREATE TABLE cities (
  name VARCHAR(50),
  country VARCHAR(50),
  population INTEGER,
  area INTEGER
);
```

### Inserting Data Into Tables

```sql
INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo', 'Japan', 38505000, 8223);

INSERT INTO cities (name, country, population, area)
VALUES
  ('Delhi', 'India', 28125000, 2240),
  ('Shanghai', 'China', 22125000, 4015),
  ('Sao Paulo', 'Brazil', 20935000, 3043);
```

### Retrieving Data with Select

```sql
SELECT * FROM cities;
SELECT name, country FROM cities;
SELECT name, population FROM cities;
SELECT area, name, population FROM cities;
SELECT name, name, name FROM cities;
```

### Calculated Columns

- Math operations

1. \+ Add
2. \- Subtract
3. \* Multiply
4. / Divide
5. ^ Exponent
6. |/ Square root
7. @ Absoulte Value
8. % Remainder

```sql
SELECT name, population / area FROM cities;

SELECT name, population / area AS population_density
FROM cities;

-- Exerice
SELECT name, price * units_sold AS revenue
FROM phones
```

### String Opreations and Functions

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

## Filtering Records

### Filtering Rows with "Where"

```sql
SELECT name, area FROM cities WHERE area > 4000;
```

- The Actual order of this query: `FROM cities`, `WHERE area > 4000`, `SELECT name, area`

- comparison Math Operators

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

### Updating Rows

```sql
UPDATE cities
SET population = 39505000
WHERE name = 'Tokyo';
```

### Delete Rows

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

## Working with Tables

- Database for a photo-sharing application

- Tables:

1. users
2. photos
3. comments
4. likes

- There are 4 different kinds of relationships:

1. One-To-Many Relationship (a user has many photos)

- Examples:
  - Boat and Crew members
  - Scool and Students
  - Company and Employees

2. Many-To-One Relationship (a photo has one user)
3. One-To-One Relationship

- Examples
  - Boats and Captains
  - Company and CEO
  - Capital and Country
  - Student and Desk
  - Person and Driver's License

4. Many-To-Many Relationship

- Examples

  - Students and Classes
  - Tasks and Engineers
  - Players and Football Matches
  - Movies and Actors / Actresses
  - Conference Class and Employees

- Primary Key: Uniquely identifies a record inside a table
- Foreign Key: identifies a record (usually in another table) that a row is associated with.
- In the Many-to-one / One-to-Many relationships the many side will have the foreign key column

- Primary Key:

  - Each row in every table has one primary key
  - no other row in the same table can have the same value
  - 99% of the time called `id`
  - Either an integer or a UUID
  - Will never change

- Foreign Key:
  - Rows only have this if they belong to other record
  - Many rows in the same table can have the same foregin key
  - Name varies, usually called something like `xyz_id`
  - Exactly equal to the primary key of the refereced row
  - Will change if the relationship changes

### Implementation

```sql
-- CREATE users table
CREATE TABLE users (
  -- SERIAL or AUTOINCREMENT
  id SERIAL PRIMARY KEY,
  username VARCHAR(50)
);

-- Insert users into users table
INSERT INTO users (username)
VALUES
  ('monahan93'),
  ('pfeffer'),
  ('si93onis'),
  ('99stroman');

-- Ensure that id was generated automatically
SELECT * FROM users;

-- CREATE photos table
CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERECES users(id)
):

-- INSERT photos into photos table
INSERT INTO photos (url, user_id)
VALUES
  ('http://one.jpg', 4);

-- Ensure that data correctly worked
SELECT * FROM photos;
```

### Running Queries on Associated Data

- First we will add some dummy data

```sql
INSERT INTO photos (url, user_id)
VALUES
  ('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);

SELECT * FROM photos;
```

- Meaningful queries

```sql
-- Find all the photos created by user with ID = 4
SELECT * FROM photos
WHERE user_id = 4

-- List all photos with details about the associated user for each
SELECT url, username
FROM photos
JOIN users ON users.id = photos.user_id;
```

### Constraints Around Deletion

- `ON DELETE RESTRICT` => Throw an error! [This is used by default]
- `ON DELETE NO ACTION` => Throw an error!
- `ON DELETE CASCADE` => Delete photos too!
- `ON DELETE SET NULL` => Set the `user_id` of the photos to `NULL`
- `ON DELETE SET DEFAULT` => Set the `user_id` of the photos to a default value, if one is provided

```sql
DROP TABLE photos;

CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERECES users(id) ON DELETE CASCADE
):


INSERT INTO photos (url, user_id)
VALUES
  ('http://one.jpg', 4),
  ('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);

DELETE FROM users
WHERE id = 1;

CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERECES users(id) ON DELETE SET NULL
);
```

## Related Records with Joins

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

- Joins:

  - Produces values by merging together rows from different realted tables.
  - Use a join most times that you're asked to find data that involves multiple resources.

- Aggregation
  - Looks at many rows and calculates a single value.
  - Workds like `most`, `average`, `least` are a sign that you need to use aggregation.

```sql
-- For each comment, show the contents of the comment and the username of the user who wrote the comment
-- the order of execution is `FROM`, `JOIN`, `SELECT`
SELECT contents, username
FROM comments
JOIN users ON users.id = comments.user_id;

-- For each comment, list the contents of the comment and the URL of the photo the comment was added to
SELECT contents, url
FROM comments
JOIN photos ON photos.id = comments.photo_id;

-- Exercise 1
SELECT title, name
FROM books
JOIN authors ON authors.id = books.author_id;


-- Find all the comments for the photo wiht ID = 3, along with the username of the comment author

-- Find the photo with ID = 10 and get the number of comments attached to it

-- Find the average number of comments per photo

-- Find the user with the most activity (most comments + most photos)

-- Find the photo with the most comments attached to it

-- Calculate the average number of characters per comment
```

- NOTES ON Joins
  - Table order between `FROM` and `JOIN` frequently makes a difference.
  - We must give context if column names collide.
  - Tables can be renamed using the `AS` keyword.
  - There are a few kinds of joins!
