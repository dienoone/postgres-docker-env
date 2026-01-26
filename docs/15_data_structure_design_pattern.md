# Data Structure Design pattern

## Instgram App Initial Design:

`dbdigram.io`

```shell
Table users {
  id SERIAL [pk, increment]
  username VARCHAR(30)
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table posts {
  id SERIAL [pk, increment]
  url VARCHAR(200)
  user_id INTEGER [ref: > users.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table comments {
  id SERIAl [pk, increment]
  contents VARCHAR(240)
  user_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > posts.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
}
```

## How to build a 'Like' system

Rules of 'Likes':

- Each user can like a specific post a single time.
- A user should be able to 'unlike' a post.
- Need to be able to figure out how many users like a post.
- Need to be able to list which users like a post.
- Something besides a post might need to be liked (comments, maybe?).
- We might want to think about 'dislikes' or other kinds of reactions like facebook.

`I like the Polymorphic Associations`

```shell
Table users {
  id SERIAL [pk, increment]
  username VARCHAR(30)
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table posts {
  id SERIAL [pk, increment]
  url VARCHAR(200)
  user_id INTEGER [ref: > users.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table comments {
  id SERIAl [pk, increment]
  contents VARCHAR(240)
  user_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > posts.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table likes {
  id SERIAL [pk, increment]
  user_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > posts.id]
  comment_id INTEGER [ref: > comments.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
}
```

We will add this check later:

```sql
ADD CHECK of
(
  COALESCE((post_id)::BOOLEAN::INTEGER, 0)
  +
  COALESCE((comment_id)::BOOLEAN::INTEGER, 0)
) = 1
```

## Final tables

```bash
Table users {
  id SERIAL [pk, increment]
  username VARCHAR(30)
  bio VARCHAR(400)
  avatar VARCHAR(200)
  phone VARCHAR(25)
  email VARCHAR(40)
  password VARCHAR(50)
  status VARCHAR(15)
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table posts {
  id SERIAL [pk, increment]
  url VARCHAR(200)
  caption VARCHAR(240)
  lat REAL
  lng REAL
  user_id INTEGER [ref: > users.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table comments {
  id SERIAl [pk, increment]
  contents VARCHAR(240)
  user_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > posts.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table likes {
  id SERIAL [pk, increment]
  user_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > posts.id]
  comment_id INTEGER [ref: > comments.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table photo_tags {
  id SERIAL [pk, increment]
  x INTEGER
  y INTEGER
  user_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > posts.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table caption_tags {
  id SERIAL [pk, increment]
  user_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > posts.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table hashtags {
  id SERIAL [pk, increment]
  title VARCHAR(20)
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table hashtag_posts {
  id SERIAL [pk, increment]
  hashtag_id INTEGER [ref: > hashtags.id]
  post_id INTEGER [ref: > posts.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
}

Table followers {
  id SERIAL [pk, increment]
  leader_id INTEGER [ref: > users.id]
  follower_id INTEGER [ref: > users.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
}
```
