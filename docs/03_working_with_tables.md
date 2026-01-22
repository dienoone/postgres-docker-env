# Working with Tables

- Database for a photo-sharing application

- Tables:

1. users
2. photos
3. comments
4. likes

- There are 4 different kinds of relationships:

1. One-To-Many Relationship (a user `has many` photos)

2. Many-To-One Relationship (a photo `has one` user, many different photos belongs to one user)

- Examples of One-to-Many / Many-to-One Relationships:
  - Boat <=> Crew members
  - Scool <=> Students
  - Company <=> Employees

3. One-To-One Relationship

- Examples
  - Boats <=> Captains
  - Company <=> CEO
  - Capital <=> Country
  - Student <=> Desk
  - Person <=> Driver's License

4. Many-To-Many Relationship

- Examples

  - Students <=> Classes
  - Tasks <=> Engineers
  - Players <=> Football Matches
  - Movies <=> Actors / Actresses
  - Conference Calls <=> Employees

- Primary Key: Uniquely identifies a record inside a table
- Foreign Key: identifies a record (usually in another table) that a row is associated with.
- In the Many-to-One / One-to-Many relationships the many side will have the foreign key column

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
  - Exactly equal to the primary key of the referenced row
  - Will change if the relationship changes

## Implementation

```sql
-- create users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50)
);

INSERT INTO users (username)
VALUES
  ('monahan93'),
  ('pfeffer'),
  ('si93onis'),
  ('99stroman');

-- ensure that id was generated automatically
SELECT * FROM users;

------------------------------------------------


CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(50),
  user_id INTEGER REFERENCES users(id)
);


-- insert photos into photos table
INSERT INTO photos (url, user_id)
VALUES
  ('http://one.jpg', 4);

-- ensure that data correctly worked
SELECT * FROM photos;
```

## Running Queries on Associated Data

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

~

## Foreign Key Constraints Around Insertion

- There are three options that we have here:

1. We insert a photo that is tied to a user that exists => Everything works OK!
2. We insert a photo that refers to a user that doesn't exist => An error!
3. We insert a photo that isn't tied to any user => PUT in a value of 'NULL' for the user_id

## Constraints Around Deletion

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
