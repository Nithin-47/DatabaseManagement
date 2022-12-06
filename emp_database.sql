create database employee_database;
use employee_database;


create table employee(
emp_no int primary key,
ename varchar(40),
mgr_no int,
hire_date int,
sal int,
dept_no int,
foreign key (dept_no) references department(dept_no)
);




create table department(
dept_no int primary key,
d_name varchar(40),
d_loc varchar(40)
);

create table incentives(
emp_no int,
incentive_date int,
incentive_amt int,
primary key(emp_no,incentive_date),
foreign key(emp_no) references employee(emp_no)
);

create table project(
p_no int primary key,
p_loc varchar(40),
p_name varchar(40)
);


create table assigned_to(
emp_no int,
p_no int,
job_role varchar(40),
primary key(emp_no,p_no),
foreign key(emp_no) references employee(emp_no),
foreign key(p_no) references project(p_no)
);

desc department;


desc employee;

desc incentives;

desc project;

desc assigned_to;




insert into department
values(1,'Logistics','bengaluru'),(2,'Statistics','mysuru'),(3,'Marketing','hyderabad'),(4,'Design','bengaluru'),(5,'Management','mysuru'),(6,'Finance','bombay');


select * from department;


insert into employee
values(101,'Avinash',2310,09,56000,1),(102,'Dinesh',2317,07,96000,1),(103,'Balaji',2510,08,66000,1),(104,'Sovesh',9310,09,42000,2),(105,'Avinash',3310,04,76000,2),(106,'Hasbulla',5561,05,47900,3),(107,'Tacitus_Kilgore',7810,11,420000,4),(108,'Gowardana_Prasad',4231,02,327100,5),(109,'Champika',1324,07,87600,5),(110,'Robin',6780,12,123000,5);

select * from employee;

insert into incentives
values(101,01,5000),(106,02,7000),(102,03,5000),(105,05,5000),(110,07,9000);

select * from incentives;


insert into project
values(01,'hyderabad','Project_Zero'),(02,'mysuru','Project_alpha'),(03,'hyderabad','Project_Bozo'),(04,'bengaluru','Project_Waaris'),(05,'bombay','Project_Onslaught'),(06,'mysuru','Project_DivideBY');


select * from project;


insert into assigned_to
values(101,01,'Candidate'),(103,04,'Candidate'),(102,05,'Manager'),(105,03,'Supervisor'),(107,02,'Candidate'),(106,06,'Candidate');


select * from assigned_to;










