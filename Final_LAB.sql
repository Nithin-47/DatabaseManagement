create database if not exists student_accomodation;
use student_accomodation;

show tables;

create table student(
    sid varchar(255) primary key,
    fname varchar(255),
	lname varchar(255),
    street varchar(255),
    city varchar(255),
    postcode int,
    nationality varchar(255),
    age int,
    email varchar(255),
    phno int,
    dob date,
    gender char(1),
    studylvl varchar(255),
    currstatus varchar(255),
    school varchar(255),
    nature_of_study varchar(255),
    place_no varchar(255),
    foreign key (place_no) references residenceoffice(place_no)
);

drop table student;

select * from student;

insert into student
values('S1','Siddarth','Sid','Red Route','Mangalore',575004,'Indian',19,'sid@gmail.com',45672839,'2003-06-17','M','UG','Staying','SIT','Full-Time','H1R1'),('S2','Gagan','Dio','Blue Route','Bangalore',376980,'Indian',19,'gag@gmail.com',48672849,'2003-07-17','M','UG','Staying','SIT','Full-Time','H1R5'),('S3','Gaurav','Gora','Yellow Route','Tumkur',575008,'Indian',19,'gau@gmail.com',85732839,'2003-06-09','M','UG','Staying','SIT','Full-Time','A1D1P1'),('S4','Sovesh','Hasbulla','Green Route','Rasputin',875643,'Russian',20,'sov@gmail.com',87965839,'2002-08-17','M','UG','Staying','SIT','Full-Time','A1D1P2'),('S5','Hasaranga','Thirumalai','Red Route','Bangalore',575078,'Indian',19,'has@gmail.com',987672839,'2003-05-12','M','UG','Staying','SIT','Full-Time','A1D1P3'),('S6','Suryakumar','Yadav','Blue Route','Mumbai',329817,'Indian',19,'sur@gmail.com',94857352,'2003-02-17','M','UG','Staying','SIT','Full-Time','A1D4P1'),('S7','Virat','Kohli','Green Route','Bangalore',543827,'Indian',19,'vir@gmail.com',77794560,'2003-01-19','M','UG','Staying','SIT','Full-Time','H7R6'),('S8','Rohit','Sharma','Raj Gajanan Route','Bangalore',575564,'Indian',19,'roh@gmail.com',534212839,'2003-03-27','M','UG','Staying','SIT','Full-Time','A3D2P1'),('S9','Shinchan','Nohara','Black Mumba Route','Kohlapur',324504,'Indian',20,'shi@gmail.com',99967563,'2002-06-20','M','UG','Staying','SIT','Full-Time','A3D2P2'),('S10','Madhav','Soodhana','Red Route','Mangalore',575098,'Indian',19,'mav@gmail.com',78562839,'2003-08-17','M','UG','Staying','SIT','Full-Time','A1D4P2');

create table residenceoffice(
	place_no varchar(255),
    bed_no int,
    room_no varchar(255),
    primary key(place_no),
    foreign key (room_no) references room(room_no)
);

drop table residenceoffice;

select * from residenceoffice;

insert into residenceoffice
values('H1R1',0,'H1R1'),('H1R5',0,'H1R5'),('A1D1P1',1,'A1D1'),('A1D1P2',2,'A1D1'),('A1D1P3',3,'A1D1'),('A1D4P1',1,'A1D4'),('H7R6',0,'H7R6'),('A3D2P1',1,'A3D2'),('A3D2P2',2,'A3D2'),('A1D4P2',2,'A1D4');

create table hall(
	hno int primary key,
	hname varchar(255),
    address varchar(255),
    telno int,
    manager varchar(255),
    monthly_rent int
);

drop table hall;

select * from hall;

insert into hall
values(1,'Gracia','Jayanagar',8435672,'Joshua Triveni',500),(7,'Arisona','Basavangudi',8465372,'Pankaj Tripathi',700);

create table room(
	hall_no int,
    flat_no int,
    room_no varchar(255),
    primary key(room_no),
    foreign key (hall_no) references hall(hno),
	foreign key (flat_no) references apartments(flat_no)
	
);

drop table room;

select * from room;

insert into room
values(1,null,'H1R1'),(1,null,'H1R5'),(null,1,'A1D1'),(null,1,'A1D4'),(7,null,'H7R6'),(null,3,'A3D2');

create table apartments(
	flat_no int primary key,
    num_dorms int,
    address varchar(255)
);

drop table apartments;

select * from apartments;

insert into apartments
values(1,3,'Jayanagar'),(3,4,'Basavangudi');

create table bed(
	bed_no int,
    monthly_rent int,
    place_no varchar(255),
    primary key(bed_no,place_no),
    foreign key (place_no) references residenceoffice(place_no)
);

drop table bed;

select * from bed;

insert into bed
values(0,500,'H1R1'),(0,500,'H1R5'),(1,1000,'A1D1P1'),(2,800,'A1D1P2'),(3,600,'A1D1P3'),(1,1000,'A1D4P1'),(0,700,'H7R6'),(1,1000,'A3D2P1'),(2,800,'A3D2P2'),(2,800,'A1D4P2');

create table payment(
	invoicenum int primary key,
    term varchar(5),
    due int,
    sname varchar(255),
    sid varchar(255),
    place_no varchar(255),
    roomno varchar(255),
    address varchar(255),
    payment_date date,
    method varchar(255),
    rem1 date,
    rem2 date,
    foreign key (place_no) references residenceoffice(place_no),
    foreign key (sid) references student(sid)
);


drop table payment;

select * from payment;

insert into payment
values(1,'T1',0,'Siddarth','S1','H1R1','H1R1','Jayanagar','2019-05-19','visa',NULL,null),(2,'T2',10000,'Gagan','S2','H1R5','H1R5','Jayanagar','2019-07-19','visa','2019-08-19','2019-10-19'),(3,'T1',0,'Gaurav','S3','A1D1P1','A1D1','Jayanagar','2019-05-19','visa',NULL,null),(4,'T3',5000,'Sovesh','S4','A1D1P2','A1D1','Jayanagar','2020-03-19','visa','2020-04-19','2020-05-19'),(5,'T1',0,'Hasaranga','S5','A1D1P3','A1D1','Jayanagar','2019-05-19','visa',NULL,null),(6,'T2',0,'Suryakumar','S6','A1D4P1','A1D4','Jayanagar','2019-08-19','visa',NULL,null),(7,'T3',30000,'Virat','S7','H7R6','H7R6','Jayanagar','2019-07-19','visa','2019-08-19','2019-10-19'),(8,'T1',0,'Rohit','S8','A3D2P1','A3D2','Jayanagar','2019-05-19','visa',NULL,null),(9,'T1',0,'Shinchan','S9','A3D2P2','A3D2','Jayanagar','2019-05-19','visa',NULL,null),(10,'T3',0,'Madhav','S10','A1D4P2','A1D4','Jayanagar','2019-05-19','visa',NULL,null);

create table inspection(
	staffname varchar(255),
    doi date,
    condn varchar(255),
    hall_no int,
    flat_no int,
    primary key(staffname,doi),
    foreign key (hall_no) references hall(hno),
    foreign key (flat_no) references apartments(flat_no)
);

drop table inspection;

select * from inspection;

insert into inspection
values('Girish','2020-1-18','Yes',1,NULL),('Varun','2020-2-18','Yes',7,NULL),('Vimal','2020-3-18','No',NULL,1),('Karan','2020-5-18','Yes',null,3);
