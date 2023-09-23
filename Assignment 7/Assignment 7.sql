-- code SQL server
-- 1. Departments
-- 2. Employees
-- 3. Devices
-- 4. Employee_Devices
CREATE TABLE Departments (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(255)
);
CREATE TABLE Employees (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(255),
	dob date,
	degree varchar(255),
	address varchar(255),
	tel varchar(20),
	position varchar(50),
	salary varchar(10),
	department_id int FOREIGN KEY REFERENCES Departments(id)
);
CREATE TABLE Devices (
	id varchar(20) PRIMARY KEY,
	name varchar(100),
	quantity int
);
CREATE TABLE Employee_Devices (
	employee_id int FOREIGN KEY REFERENCES Employees(id),
	device_id varchar(20) FOREIGN KEY REFERENCES Devices(id)
);