-- SQL server
-- 1. Client
-- 2. Topic
-- 3. Category
-- 4. Author
-- 5. Post
-- 6. Comment
-- 7. Topic_Post
CREATE TABLE Client (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(155) NOT NULL,
	password varchar(32) NOT NULL
);
CREATE TABLE Topic (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar (155) NOT NULL UNIQUE
);
CREATE TABLE Category (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(155) NOT NULL UNIQUE
);
CREATE TABLE Author (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(155) NOT NULL
);
CREATE TABLE Post (
	id int PRIMARY KEY IDENTITY(1,1),
	title varchar(255) NOT NULL UNIQUE,
	content varchar(1000) NOT NULL UNIQUE,
	publication date NOT NULL CHECK(publication < getdate()),
	category_id int NOT NULL FOREIGN KEY REFERENCES Category(id),
	author_id int NOT NULL FOREIGN KEY REFERENCES Author(id)
);
CREATE TABLE Comment (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(155) NOT NULL,
	content varchar(500) NOT NULL,
	post_id int NOT NULL FOREIGN KEY REFERENCES Post(id),
	client_id int NOT NULL FOREIGN KEY REFERENCES Client(id)
);
CREATE TABLE Topic_Post (
	topic_id int NOT NULL FOREIGN KEY REFERENCES Topic(id),
	post_id int NOT NULL FOREIGN KEY REFERENCES Post(id)
);