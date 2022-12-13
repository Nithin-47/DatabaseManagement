create database employee_database;
use employee_database;

create table employee(
emp_no int primary key,
ename varchar(40),
mgr_no int,
hire_date date,
sal int,
dept_no int,
foreign key (dept_no) references department(dept_no) on delete cascade
);




create table department(
dept_no int primary key,
d_name varchar(40),
d_loc varchar(40)
);

create table incentives(
emp_no int,
incentive_date date,
incentive_amt int,
primary key(emp_no,incentive_date),
foreign key(emp_no) references employee(emp_no) on delete cascade
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
foreign key(emp_no) references employee(emp_no) on delete cascade,
foreign key(p_no) references project(p_no) on delete cascade
);

desc department;


desc employee;

desc incentives;

desc project;

desc assigned_to;

drop table employee;
drop table incentives;
drop table assigned_to;


insert into department
values(1,'Logistics','bengaluru'),(2,'Statistics','mysuru'),(3,'Marketing','hyderabad'),(4,'Design','bengaluru'),(5,'Management','mysuru'),(6,'Finance','bombay');


select * from department;


insert into employee
values(7499,'Shruthi',7698,'2013-02-20',16000,1),(7521,'Anvitha',7698,'2015-02-22',12500,1),(7566,'Tanvir',7839,'2008-08-02',29750,1),(7654,'Ramesh',7698,'2014-09-28',12500,2),(7698,'Kumar',7839,'2015-05-01',28500,2),(7782,'Clark',7839,'2017-06-09',30000,3),(7839,'Tacitus_Kilgore',NULL,'2009-11-17',50000,4),(7876,'Gowardana_Prasad',7788,'2013-01-12',11000,5),(7902,'Saritha',7566,'2010-12-03',30000,5);

select * from employee;

insert into incentives
values(7499,'2019-02-01',5000),(7521,'2019-02-02',8000),(7566,'2019-03-01',2500),(7654,'2022-02-01',5000),(7698,'2019-05-21',9000);

select * from incentives;


insert into project
values(01,'hyderabad','Project_Zero'),(02,'mysuru','Project_alpha'),(03,'hyderabad','Project_Bozo'),(04,'bengaluru','Project_Waaris'),(05,'bombay','Project_Onslaught'),(06,'mysuru','Project_DivideBY');


select * from project;


insert into assigned_to
values(7499,01,'Candidate'),(7521,04,'Candidate'),(7698,05,'Manager'),(7566,03,'Supervisor'),(7654,02,'Candidate'),(7902,06,'Candidate');


select * from assigned_to;







select m.ename,count(*) from employee e,employee m where e.mgr_no=m.emp_no group by m.ename having count(*)=(select max(mycount) from (select count(*) mycount from employee group by mgr_no) a);

select E.ename from employee E where E.emp_no in (select P.mgr_no from employee P where sal>(select avg(sal) from employee G where G.mgr_no=E.emp_no));

select G.ename,G.dept_no from employee E,employee M,employee G where E.mgr_no=M.emp_no and M.mgr_no=G.emp_no group by G.dept_no;

select * from employee E,incentives I where E.emp_no=I.emp_no and 2=(select count(*) from incentives J where I.incentive_amt<=J.incentive_amt ) and incentive_date like '2019-02%';

select E.ename from employee E,employee M where E.mgr_no=M.emp_no and M.dept_no=E.dept_no;

