create database if not exists Supplier_database;
drop database Supplier_database;
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
 cost real,
 foreign key(pid) references parts(pid) on delete cascade,
 foreign key(sid) references Supplier(sid) on delete cascade
)
select * from parts;
-- inserting into Supplier table --
insert into Supplier 
values('10001','Basavaraj Chitoor','Bangalore'),
	  ('10002','Aadarsh Hosahalli','Kolkatta'),
      ('10003','Chatrapathi Brijesh','Mumbai'),
      ('10004','Kaarthik Sharma','Delhi');
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
values ('10001','20001','10'),
       ('10001','20002','10'),
       ('10001','20003','30'),
       ('10001','20004','10'),
       ('10001','20005','10'),
       ('10002','20001','10'),
       ('10002','20002','20'),
       ('10003','20003','30'),
       ('10004','20003','40');
select * from Catalog;
 
 

-- --     week 7 todo queries   --

--  #todo 3:
--  
--  select distinct(p.pname)
--  from parts p,Catalog c
--  where p.pid=c.pid;
--  
--  #todo 4:
--   -- before running query delete a tuple from table parts so that query gives output --
--   --  delete from parts  --
--   --  where pid='20006';  --
--   
--   select (s.sname)
--   from Supplier s,Catalog c
--   where s.sid=c.sid and c.pid=all(select pid
-- 								   from parts);


select distinct P.pname from parts P,Catalog C where C.sid=some(select sid from Catalog group by pid );

select S.sname from Supplier S where S.sid in (select C.sid from Catalog C group by C.sid having count(distinct C.pid)=(select count(*) from parts));



-- select S.sname from Supplier S where S.sid in(select C.sid from Catalog C group by C.sid having count(distinct C.pid)>=(select count(*) from parts where color='Red'));

-- select S.sname from Supplier S where S.sid in(select C.sid from Catalog C where C.pid 

select distinct(sname) from Supplier S where not exists(select p.pid,p.color from parts p where not exists(select * from Catalog C where C.sid=S.sid and p.pid=C.pid) and p.color='Red');

select P.pname from parts P where P.pid in(select C.pid from Catalog C where C.sid=10001 and C.pid not in(select ca.pid from Catalog ca where ca.sid!=10001)); 


select S.sid from Supplier S where S.sid in (select C.sid from Catalog C where C.cost>(select avg(C1.cost) from Catalog C1 where C1.pid=C.pid group by pid));


-- select S.sname from Supplier S where S.sid in (select C.sid from Catalog C group by C.pid having max(C.cost));



select c.pid,s.sname from Supplier s,Catalog c where c.sid=s.sid and c.cost=(select max(c1.cost) from Catalog c1 where c1.pid=c.pid group by c1.pid);
