-- SQL server

-- Create table
create table Customers (
	id int primary key identity(1,1),
	name varchar(50) not null,
	address varchar(150) not null,
	tel varchar(20) not null unique
);
create table Products (
	id int primary key identity(1,1),
	name varchar(50) not null,
	description varchar(150) not null,
	unit varchar(20) not null,
	price decimal not null
);
create table Orders (
	id int primary key,
	date date not null check(date < getdate()),
	customer_id int not null foreign key references Customers(id),
	grandtotal decimal not null
);
create table Orderdetails (
	order_id int not null foreign key references Orders(id),
	product_id int not null foreign key references Products(id),
	quantity int not null,
	total decimal not null
);

-- Create data
insert into Customers(name, address, tel) values('Nguyen Van An', '111 Nguyen Trai, Thanh Xuan, Ha Noi', '0987654321');
insert into Customers(name, address, tel) values('Nguyen Van A', '112 Nguyen Trai, Thanh Xuan, Ha Noi', '0987654322');
insert into Customers(name, address, tel) values('Nguyen Van C', '113 Nguyen Trai, Thanh Xuan, Ha Noi', '0987654323');

insert into Products(name, description, unit, price) values('May Tinh T450', 'May nhap moi', 'Chiec', 1000);
insert into Products(name, description, unit, price) values('Dien Thoai Nokia5670', 'Dien thoai dang hot', 'Chiec', 200);
insert into Products(name, description, unit, price) values('May In Samsung 450', 'May in dang e', 'Chiec', 100);

insert into Orders(id, date, customer_id, grandtotal) values(123, '11-18-09', 1, 1500);
insert into Orders(id, date, customer_id, grandtotal) values(124, '11-18-09', 2, 1000);
insert into Orders(id, date, customer_id, grandtotal) values(125, '11-18-09', 3, 2500);

insert into Orderdetails(order_id, product_id, quantity, total) values(123, 1, 1, 1000);
insert into Orderdetails(order_id, product_id, quantity, total) values(123, 2, 2, 400);
insert into Orderdetails(order_id, product_id, quantity, total) values(123, 3, 1, 100);
insert into Orderdetails(order_id, product_id, quantity, total) values(124, 2, 3, 600);
insert into Orderdetails(order_id, product_id, quantity, total) values(124, 3, 4, 400);
insert into Orderdetails(order_id, product_id, quantity, total) values(125, 1, 2, 2000);
insert into Orderdetails(order_id, product_id, quantity, total) values(125, 3, 5, 500);

-- Read data
-- 4
-- a
select * from Customers;
-- b
select * from Products;
-- c
select * from Orderdetails;
-- 5
-- a
select * from Customers order by name asc;
-- b
select * from Products order by price desc;
-- c
select * from Products where id in (select product_id from Orderdetails where order_id in (select id from Orders where customer_id in(select id from Customers where name like 'Nguyen Van An')));
-- 6
-- a
select count(*) as totalcustomer from Customers;
-- b
select count(*) as totalproduct from Products;
-- c
select * from Orders;
