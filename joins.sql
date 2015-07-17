--1 50000
SELECT * FROM users;

--2 1
SELECT * FROM posts WHERE users_id = 100;

--3 1
SELECT posts.*, users.first_name, users.last_name
FROM posts
INNER JOIN users
ON posts.users_id = users.id
WHERE posts.users_id = 200;

--4 1
SELECT posts.*, users.username
FROM posts
INNER JOIN users
ON posts.users_id = users.id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

--5 26598
SELECT username, posts.created_at
FROM users
INNER JOIN posts
ON users.id = posts.users_id
WHERE posts.created_at > 'January 1, 2015';

--6 23488
SELECT posts.title, posts.content, users.username
FROM users
INNER JOIN posts
ON users.id = posts.users_id
WHERE users.created_at < 'January 1, 2015';

--7 19729
SELECT comments.*, posts.title AS "Post Title"
FROM comments
INNER JOIN posts
ON posts.id = comments.posts_id;

--8 9126
SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_url"
FROM comments
INNER JOIN posts
ON posts.id = comments.posts_id
WHERE posts.created_at < 'January 1, 2015';

--9 10603
SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_url"
FROM comments
INNER JOIN posts
ON posts.id = comments.posts_id
WHERE posts.created_at > 'January 1, 2015';

--10 728
SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_url"
FROM comments
INNER JOIN posts
ON posts.id = comments.posts_id
WHERE comments.body LIKE '%USB%';

--11 855
SELECT posts.title AS "post_title", users.first_name, users.last_name, comments.body AS "comment_body"
FROM users
INNER JOIN posts
ON users.id = posts.users_id
INNER JOIN comments
ON posts.id = comments.posts_id
WHERE comments.body LIKE '%matrix%';

--12 102
SELECT users.first_name, users.last_name, comments.body AS "comment_body"
FROM users
INNER JOIN posts
ON users.id = posts.users_id
INNER JOIN comments
ON posts.id = comments.posts_id
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

--13 194 instead of 197
SELECT
users.first_name AS "post_author_first_name",
users.last_name AS "post_author_last_name",
posts.title AS "post_title",
comment_users.username AS "comment_author_username",
comments.body AS "comment_body"
FROM users
INNER JOIN posts
ON users.id = posts.users_id
INNER JOIN comments
ON posts.id = comments.posts_id
INNER JOIN users comment_users
ON comment_users.id = comments.id
WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';

-- Johns code
-- select
-- post_users.first_name as post_author_first_name,
-- post_users.last_name as post_author_last_name,
-- posts.title as post_title,
-- comment_users.username as comment_author_username,
-- comments.body as comment_body

-- from users post_users
--   inner join posts
--   on posts.user_id = post_users.id

--   inner join comments
--   on comments.post_id = posts.id

--   inner join users comment_users
--   on comment_users.id = comments.id

--   where (comments.body like '%SSL%' or comments.body like '%firewall%')
--   and posts.content like '%nemo%';



-- 101 ssl & nemo
-- 96 FIREWALL & nemo
-- 194 combined

--Additional Queries

--1 0
SELECT posts.id, posts.title, users.id
FROM comments
INNER JOIN posts
ON (comments.posts_id = posts.id)
INNER JOIN users
ON (posts.users_id = users.id)
WHERE comments.users_id = users.id;


--2 27 instead of 25
SELECT count(*)
FROM comments
INNER JOIN posts
ON posts.id = comments.posts_id
WHERE posts.created_at > 'July 14, 2015 00:00:00+00';

--3 -337 DONE
SELECT count(*)
FROM comments
WHERE comments.body LIKE '%programming%';
