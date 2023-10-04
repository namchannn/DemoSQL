-- Creat table
create table Persons(
	stt int,
	name varchar(100),
	age int
);

-- Creat data
insert into Persons(stt, name, age) values(2, 'Bach', 21);
insert into Persons(stt, name, age) values(1, 'Quang', 18);
insert into Persons(stt, name, age) values(3, 'Nam', 14);
insert into Persons(stt, name, age) values(5, 'Hieu', 19);
insert into Persons(stt, name, age) values(4, 'Cuong', 15);

-- Read data
select name from Persons;

-- Clustered index (chỉ mục vật lý)
create clustered index stt_clus_index on Persons(stt);
create unique index u_name on Persons(name);
-- Non-Clustered index (chỉ mục phi vật lý)
create index age_non_clus_index on Persons(age);
-- drop index Persons.age_non_clus_index; (lệnh xóa)

-- Triggers
create trigger notify_insert
on Persons
after insert
as
begin
	if exists (select * from inserted where age < 18)
		rollback transaction;
end
print 'Alo vua co dua them du lieu';

insert into Persons(stt, name, age) values(8, 'Duy', 17);

create trigger notify_insert
on Persons
after insert
as
begin
	if exists (select * from inserted where age < 18)
		rollback transaction;
end

create trigger ko_cho_xoa_kq
on Results
after delete
as
	rollback transaction;
-- drop trigger notify_insert; (lệnh xóa)