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
users.username AS "comment_author_username",
comments.body AS "comment_body"
FROM users
INNER JOIN posts
ON users.id = posts.users_id
INNER JOIN comments
ON users.id = comments.users_id
WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';

-- 101 ssl & nemo
-- 96 FIREWALL & nemo
-- 194 combined

--Additional Queries

--1 19604 WRONG
SELECT posts.users_id, posts.title, users.id, comments.users_id
FROM posts
INNER JOIN users
ON users.id = posts.users_id
INNER JOIN comments
ON users.id = comments.users_id
WHERE comments.users_id = posts.users_id AND comments.users_id = users.id;


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
