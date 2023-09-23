-- code SQL server
-- 1. Classes
-- 2. Subjects
-- 3. Students
-- 4. Results
-- 5. Student_Subjects
CREATE TABLE Classes (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(255) NOT NULL UNIQUE,
	room int NOT NULL
);
CREATE TABLE Subjects (
	id varchar(50) PRIMARY KEY,
	name varchar(255) NOT NULL
);
CREATE TABLE Students (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(255) NOT NULL,
	dob date NOT NULL check(dob < getdate()),
	classes_id int NOT NULL FOREIGN KEY REFERENCES Classes(id)
);
CREATE TABLE Results (
	id int PRIMARY KEY IDENTITY(1,1),
	result varchar(20) NOT NULL check(result = 'Fail' or result = 'Pass'),
	mark int NOT NULL check(mark >= 0 AND mark <= 10),
	student_id int NOT NULL FOREIGN KEY REFERENCES Students(id),
	subject_id varchar(50) NOT NULL FOREIGN KEY REFERENCES Subjects(id)
);
CREATE TABLE Student_Subjects (
	student_id int NOT NULL FOREIGN KEY REFERENCES Students(id),
	subject_id varchar(50) NOT NULL FOREIGN KEY REFERENCES Subjects(id)
);