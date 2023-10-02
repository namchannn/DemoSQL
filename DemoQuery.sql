-- SELECT column1, column2... FROM table;
select id as masv, name as tensv, dob from Students;
select * from Students;
select (mark+1) as diemsv from Results;

-- select Order_Product.*, (qty*price) as thanhtien from Order_Product;

-- Filter
-- select ... from table where condition;
select * from Students where id > 10 and id < 1004 or id != 0; -- and xử lý trước or xử lý sau
select * from Students where name like 'Nguyen Van An'; -- like là tìm chính xác, chuỗi thì nên dùng like, số thì dùng toán tử  "="
select * from Students where dob <= '2001-09-11'; -- sinh trước 2001-09-11
select * from Students where id = 1 or id = 3 or id = 5 or id = 7 or id = 9;
select * from Students where id in (1, 3, 5, 7, 9);
select * from Students where dob between '1998-01-01' and '2001-09-11'; -- trong khoảng thời gian
select * from Students where dob between '2001-09-11' and getdate();
select * from Students where dob >= '2000-01-01'; -- sinh sau 2000-01-01

select * from Students where name like '%An'; -- tìm tên có chữ An
select * from Students where name like 'Nguyen%'; -- tìm tên có họ Nguyen
select * from Students where name like '%Van%'; -- tìm tên có tên đệm là Van

-- Sort
-- asc:
---- string: alphabet
---- number: low to high
---- date/datetime: old to new
-- dasc >< asc
select * from Students order by name asc, dob desc;

-- Statistical
select count(*) as sl from Students; -- đếm số hàng
select count(*) as sl from Results;
select sum(mark) as td from Results; -- tổng điểm
select avg(mark) as dtb from Results; -- điểm trung bình

select count(*), student_id from Results group by student_id;
select sum(mark), student_id from Results group by student_id;
select avg(mark), student_id from Results group by student_id;

select avg(mark), student_id from Results where mark > 3 group by student_id having student_id < 2;

-- Sub-query
-- Nguyen Van An
-- select * from Students where name like 'Nguyen Van An';
-- select * from Results where student_id in (1, 3);
select * from Results where student_id in (select id from Students where name like 'Nguyen Van An');
select * from Student_Subjects where student_id in (select id from Students where name like 'Nguyen Van An');
select * from Subjects where id in (select subject_id from Student_Subjects where student_id in (select id from Students where name like 'Nguyen Van An'));
-- select * from Products where id in (select product_id from Order_Product where order_id in (select id from Orders where customer_id in (select id from Customers where name like 'Nguyen Van An')));

insert into Student_Subjects (student_id, subject_id)
	values (
		(select id from Students where name like 'Nguyen Van An'),
		(select id from Subjects where name like 'Database')
	);

select * from Students;
-- select * from A left/inner/right join B on A.FK = B.PK;
select Students.*, Classes.name as class_name, room from Students inner join Classes on Students.class_id = Classes.id;
select Students.*, Classes.name as class_name, room from Students left join Classes on Students.class_id = Classes.id;
select Students.*, Classes.name as class_name, room from Students right join Classes on Students.class_id = Classes.id;

select A.*, B.name as class_name, room from Students A left join Classes B on A.class_id = B.id;
select * from Student_Subject A left join Students B on A.student_id = B.id left join Subjects C on A.subject_id = C.id;

select B.id, B.name as student_name, B.dob, D.name as class_name, C.name as subject_name from Student_Subjects A
left join Students B on A.student.id = B.id
left join Subjects C on A.subject_id = C.id
left join Classes D on B.class_id = D.id;

select B.name as student_name, count(C.name) as total from Student_Subjects A
left join Students B on A.student_id = B.id
left join Subjects C on A.subject_id = C.id
left join Classes D on B.class_id = D.id
group by B.name;

select student_id, count(subject_id) as total from Student_Subjects group by student_id;

---
alter table Students add gender varchar(20); -- thêm cột
alter table Students alter column gender varchar(15); -- sửa cột
alter table Students drop column gender; -- xóa cột

alter table Students as check(gender in ('Male', 'Famale'));

alter table Students drop constraint CK_Students_gender_5AEE8289;

alter table Students add constraint check_gender check(gender in ('Male', 'Famale'));
alter table Students drop constraint check_gender;

---
create view student_info as
select B.id, B.name as student_name, D.name as class_name, C.id as c_id, C.name as subject_name from Student_Subjects A
left join Students B on A.student_id = B.id
left join Subjects C on A.subject_id = C.id
left join Classes D on B.class_id = D.id;
-- drop view student_info;

---
insert into Students(name, dob, gender, class_id)
	values('Dang Thi Thuy', '2000-06-12', 'Famale', 1002);

--- Stored procedure
create procedure add_student as insert into Students(name, dob, gender, class_id)
	values('Dang Thi Thuy', '2000-06-12', 'Famale', 1002);
-- drop procedure add_student;

exec add_student;

create procedure add_student @name varchar(255), @dob date, @gender varchar(20), @class int as insert into Students(name, dob, gender, class_id)
	values(@name, @dob, @gender, @class);
exec add_student @name = 'Le Trong Bach', @dob = '2001-09-11', @gender = 'Male', @class = 1;

create procedure add_student add_student_advance @name varchar(255), @dob date, @gender varchar(20), @class varchar(150)
as if exists (select * from Classes where name like @class) insert into Students(name, dob, gender, class_id)
	values(@name, @dob, @gender, (select top 1 id from  Classes where name like @class));
else
	print 'Class is not exists';
exec add_student @name = 'Le Trong Bach', @dob = '2001-09-11', @gender = 'Male', @class = 'T2305E';