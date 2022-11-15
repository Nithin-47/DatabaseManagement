create database Nithin_insurance;
use Nithin_insurance;

create table person(
driver_id varchar(30) primary key,
person_name varchar(40),
address varchar(60)
);

create table car(
reg_num varchar(40),
model varchar(40),
buy_year int,
primary key(reg_num)
);

create table owns(
driver_id varchar(30),
reg_num varchar(40),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num)
);

create table accident(
report_num int,
accident_date date,
location varchar(50),
primary key(report_num));

create table participated(
driver_id varchar(30),
reg_num varchar(40),
report_num int,
damage_amt int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num)
);


insert into person
values('AC01','Rishabh','Bangalore'),('AC05','Vayush','Tumkur'),('AC109','Gireesh','karwar'),('AC98','prachand samhara nivedan','Bangalore'),('AC87','Kalpa Rudra Srivara Santhope','Kaiga');

insert into car
values('KA 03 B 1956','S2',2020),('KA 09 C 6657','S3',2021),('KA 41 K 2354','S5',1999),('KA 32 L 8903','A3',2003),('KA 05 M 9034','A2',2020);

insert into accident
values(197,'2021-08-02','Bangalore'),(190,'2020-09-21','Mangalore'),(167,'2008-09-15','Bangalore'),(183,'2020-09-17','Delhi'),(097,'2007-11-27','Hyderabad');

insert into owns
values('AC01','KA 03 B 1956'),('AC05','KA 09 C 6657'),('AC109','KA 41 K 2354'),('AC98','KA 32 L 8903'),('AC87','KA 05 M 9034');

insert into participated
values('AC01','KA 03 B 1956',197,90000),('AC05','KA 09 C 6657',190,80000),('AC109','KA 41 K 2354',167,79000),('AC98','KA 32 L 8903',183,167000),('AC87','KA 05 M 9034',097,289000);



select * from car order by buy_year asc;
select count(report_num) from car c,participated p where c.reg_num=p.reg_num and c.model='S2';

select count(distinct driver_id) CNT from participated a,accident b where a.report_num=b.report_num and b.accident_date like '__08';


select avg(damage_amt) from participated;


select p.person_name from person p,participated pa where p.driver_id=pa.driver_id and pa.damage_amt>(select avg(damage_amt) from participated);

select max(damage_amt) from participated;


delete from participated where
damage_amt<(select t.amt from (select avg(damage_amt) as amt from participated) t);


select c.model from car c,accident a,participated p where p.report_num=a.report_num and p.reg_num=c.reg_num and a.location="Bangalore";


