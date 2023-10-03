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
	date date not null,
	customer_id int not null foreign key references Customers(id)
);
create table Orderdetails (
	order_id int not null foreign key references Orders(id),
	product_id int not null foreign key references Products(id),
	quantity int not null
);

-- Create data
insert into Customers(name, address, tel) values('Nguyen Van An', '111 Nguyen Trai, Thanh Xuan, Ha Noi', '0987654321');
insert into Customers(name, address, tel) values('Nguyen Van A', '112 Nguyen Trai, Thanh Xuan, Ha Noi', '0987654322');
insert into Customers(name, address, tel) values('Nguyen Van C', '113 Nguyen Trai, Thanh Xuan, Ha Noi', '0987654323');

insert into Products(name, description, unit, price) values('May Tinh T450', 'May nhap moi', 'Chiec', 1000);
insert into Products(name, description, unit, price) values('Dien Thoai Nokia5670', 'Dien thoai dang hot', 'Chiec', 200);
insert into Products(name, description, unit, price) values('May In Samsung 450', 'May in dang e', 'Chiec', 100);

insert into Orders(id, date, customer_id) values(123, '11-18-09', 1);
insert into Orders(id, date, customer_id) values(124, '11-18-09', 2);
insert into Orders(id, date, customer_id) values(125, '11-18-09', 3);

insert into Orderdetails(order_id, product_id, quantity) values(123, 1, 1);
insert into Orderdetails(order_id, product_id, quantity) values(123, 2, 2);
insert into Orderdetails(order_id, product_id, quantity) values(123, 3, 1);
insert into Orderdetails(order_id, product_id, quantity) values(124, 2, 3);
insert into Orderdetails(order_id, product_id, quantity) values(124, 3, 4);
insert into Orderdetails(order_id, product_id, quantity) values(125, 1, 2);
insert into Orderdetails(order_id, product_id, quantity) values(125, 3, 5);

-- Read data
-- 4
-- a
select * from Customers;
-- b
select * from Products;
-- c
select * from Orders;
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
select O.id as OrderID, sum(P.price * OD.quantity) as totalprice
from Orders O
inner join Orderdetails OD on O.id = OD.order_id
inner join Products P on OD.product_id = P.id
group by O.id;
-- 7
-- a
alter table Products add constraint check_price check(price > 0);
-- b
alter table Orders add constraint check_date check(date < getdate());
-- c
alter table Products add product_date date;
-- 8
-- a
create index idx_Products_name on Products(name);
create index idx_Customers_name on Customers(name);
-- b
create view View_Customers as
select name as CustomerName, address as CustomerAddress, tel as CustomerTel from Customers;

create view View_Products as
select name as ProductName, price as ProductPrice from Products;

create view View_Customer_Products as
select
	C.name as CustomerName,
	C.tel as CustomerTel,
	P.name as ProductName,
	OD.quantity as Quantity,
	O.date as OrderDate
from Customers as C
inner join Orders as O on C.id = O.customer_id
inner join Orderdetails as OD on O.id = OD.order_id
inner join Products as P on P.id = OD.product_id;
-- c
create procedure Sp_SearchCustomerById @CustomerID int as
select id as CustomerID, name as CustomerName, address as CustomerAddress, tel as CustomerTel
from Customers
where id = @CustomerID;
exec Sp_SearchCustomerById @CustomerID = 2;

create procedure Sp_SearchCustomerByOrderId @OrderID int as
select
	C.id as CustomerID,
	C.name as CustomerName,
	C.address as CustomerAddress,
	C.tel as CustomerTel
from Customers as C
inner join Orders as O on C.id = O.customer_id
where O.id = @OrderID;
exec Sp_SearchCustomerByOrderId @OrderID = 125;

create procedure Sp_SearchProductByCustomerId @CustomerID int as
select
	P.name as ProductName,
	OD.quantity as Quantity
from Customers as C
inner join Orders as O on C.id = O.customer_id
inner join Orderdetails as OD on O.id = OD.order_id
inner join Products as P on P.id = OD.product_id
where C.id = @CustomerID;
exec Sp_SearchProductByCustomerId @CustomerID = 1;