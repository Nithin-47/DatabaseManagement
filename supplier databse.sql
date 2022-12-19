create database if not exists Supplier_database;
use Supplier_database;

-- creating Supplier table --
create table Supplier(
 sid int,
 sname varchar(30),
 city varchar(30),
 primary key(sid)
) 
select * from Supplier;

-- creating parts table --
create table parts(
 pid int,
 pname varchar(30),
 color varchar(30),
 primary key(pid)
)
select * from parts;

-- creating Catalog table--
create table Catalog(
 sid int,
 pid int,
 cost int,
 foreign key(pid) references parts(pid),
 foreign key(sid) references Supplier(sid)
)
select * from parts;
-- inserting into Supplier table --
insert into Supplier 
values('10001','Eren Yeager','Bangalore'),
	  ('10002','Levi Ackerman','Kolkatta'),
      ('10003','Tenzen Uzui','Mumbai'),
      ('10004','Erwin Smith','Delhi'),
      ('10005','Rengoku Kyojuro','Chennai');
select * from Supplier;

-- inserting into parts table --
insert into parts
values('20001','Book','Red'),
	  ('20002','Pen','Red'),
      ('20003','Pencil','Green'),
      ('20004','Mobile','Green'),
      ('20005','Charger','Black');
select * from parts;

-- inserting into Catalog table --
insert into Catalog 
values ('10001','20001','30'),
       ('10001','20002','10'),
       ('10001','20003','10'),
       ('10001','20004','50'),
       ('10001','20005','20'),
       ('10002','20004','50'),
       ('10002','20002','15'),
       ('10003','20003','10'),
       ('10004','20003','15');
select * from Catalog;
 
 

--     week 7 todo queries   --

 #todo 3:
 
 select distinct(p.pname)
 from parts p,Catalog c
 where p.pid=c.pid;
 
 #todo 4:
  -- before running query delete a tuple from table parts so that query gives output --
  --  delete from parts  --
  --  where pid='20006';  --
  
  select (s.sname)
  from Supplier s,Catalog c
  where s.sid=c.sid and c.pid=all(select pid
								   from parts);
                                   
                                   