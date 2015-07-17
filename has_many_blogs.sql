CREATE USER has_many_user;
CREATE DATABASE has_many_blogs OWNER has_many_user ENCODING 'utf8';

CREATE TABLE IF NOT EXISTS users
(
  id serial NOT NULL,
  username varchar(90) NOT NULL,
  first_name varchar(90) DEFAULT NULL NOT NULL,
  last_name varchar(90) DEFAULT NULL,
  created_at timestamp with time zone DEFAULT now() NOT NULL,
  updated_at timestamp with time zone DEFAULT now() NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS posts
(
  id serial NOT NULL,
  title varchar(180) DEFAULT NULL,
  url varchar(510) DEFAULT NULL,
  content text DEFAULT NULL,
  created_at timestamp with time zone DEFAULT now() NOT NULL,
  updated_at timestamp with time zone DEFAULT now() NOT NULL,

  users_id integer NOT NULL,
  CONSTRAINT users_id_fk FOREIGN KEY (users_id) REFERENCES users (id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,

  PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS comments
(
  id serial NOT NULL,
  body varchar(510) DEFAULT NULL,
  created_at timestamp with time zone DEFAULT now() NOT NULL,
  updated_at timestamp with time zone DEFAULT now() NOT NULL,
  users_id integer NOT NULL,
  posts_id integer NOT NULL,
  CONSTRAINT users_id_fk FOREIGN KEY (users_id) REFERENCES users (id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT posts_id_fk FOREIGN KEY (posts_id) REFERENCES posts (id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,

  PRIMARY KEY (id)
);

-- CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES user (id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
-- CONSTRAINT posts_id_fk FOREIGN KEY (posts_id) REFERENCES posts (id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,

\i ~/Devleague/Has-Many-Relationships/scripts/blog_data.sql
