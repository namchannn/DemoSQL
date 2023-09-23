-- create data
INSERT INTO Classes(name, room) VALUES('T2306E', 12);
INSERT INTO Subjects(id, name) VALUES('DMS', 'Database');
INSERT INTO Students(name, dob, classes_id) VALUES('Nguyen Van An', '2000-06-17', 1);
INSERT INTO Results(result, mark, student_id, subject_id) VALUES('Pass', 9, 1, 'DMS');
INSERT INTO Student_Subjects(student_id, subject_id) VALUES(1, 'DMS');

-- Read data
select * from Classes;
select * from Subjects;
select * from Students;
select * from Results;
select * from Student_Subjects;

-- Update data
UPDATE Classes set room = 8 where id = 1;
UPDATE Classes set room = 12, name = 'T2306E' where id = 2;

-- Delete data
DELETE FROM Classes where id = 2;