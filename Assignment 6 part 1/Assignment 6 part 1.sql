-- code SQL server
-- Publishers
-- Authors
-- Books
CREATE TABLE Publishers (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(255),
	address varchar(255)
);
CREATE TABLE Authors (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(255),
	publisher_id int FOREIGN KEY REFERENCES Publishers(id)
);
CREATE TABLE Books (
	id varchar(255) PRIMARY KEY,
	name varchar(255),
	dob date,
	publishtime int,
	category varchar(100),
	price decimal,
	author_id int FOREIGN KEY REFERENCES Authors(id)
);