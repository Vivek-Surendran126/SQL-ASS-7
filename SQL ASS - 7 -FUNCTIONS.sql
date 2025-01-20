create database peoples;
use peoples;

create table country ( ID int primary key, 
country_name varchar(100), population int , 
area varchar(100));

create table persons (ID INT primary key,
F_name varchar(100), L_name varchar(100), 
population int,  rating decimal(10,2),
Country_ID int, country_name varchar(100));

insert into country (ID, country_name, population,
area) values (1, 'UK',1200000, 'Europe'),
(2,'Canada',800000,'North America'),
(3,'poland',1300000,'Europe'),
(4,'USA',1800000,'America'),
(5,'India',2500000,'asia'),
(6,'Australia',2000000,'Australia'),
(7,'china',4500000,'Asia'),
(8,'japan',700000,'Asia'),
(9,'france',900000,'Europe'),
(10,'germany',6500000,'Europe');

Insert into persons (ID, F_name, L_name, population,
rating, Country_ID, country_name) values
(1,'ram','kumar',1200000,4.7,1,'UK'),
(2,'raj','mohan',2500000,4.0,5,'India'),
(3,'meera','nandhan',2500000,4.0,5,'India'),
(4,'alexia','cox',2000000,4.2,6,'Australia'),
(5,'faye', 'bowen',800000,4.6,2,'canada'),
(6,'donna','brown',1800000,5.0,4,'USA'),
(7,'michelle','davies',1800000,5.0,4,'USA'),
(8,'sarah','thomas',6500000,4.8,10, 'germany'),
(9,'prasad','varkey',2500000,4.0,5,'India'),
(10,'jackey','rose',1200000,4.7,1,'UK');

#1. CREATING NEW COLUMN NAMED DOB
alter table persons add column DOB date;

update persons set DOB='2000-11-23' where ID=1;
update persons set DOB='1998-11-28' where ID=2;
update persons set DOB='2002-09-23' where ID=3;
update persons set DOB='1995-02-02' where ID=4;
update persons set DOB='1999-07-15' where ID=5;
update persons set DOB='2000-05-23' where ID=6;
update persons set DOB='1990-12-23' where ID=7;
update persons set DOB='2003-04-23' where ID=8;
update persons set DOB='2000-01-23' where ID=9;
update persons set DOB='2005-11-23' where ID=10;

#2.CREATING USERDEFINED FUNCTION TO FIND AGE
delimiter //
create function Age (DOB DATE)
returns int
deterministic
no sql
begin
return  YEAR(current_date) - YEAR( DOB);
end //
delimiter ;

#3. SELECT COMMAND TO PRINT AGE
SELECT F_name , L_name , age(dob) as AGE from persons;

#4. FINDING LENGTH OF COUNTRY NAMES
delimiter $$
create function countrylength(country_name varchar(100))
returns int
deterministic
no sql
begin
return length(country_name);
end $$
delimiter ;

select country_name, countrylength(country_name) as length_of_charactors
from country;

#5.EXTRACT FIRST 3 LETTERS OF COUNTRY NAME
select substring(country_name,1,3) as first_three_letters from country;

#6. CONVERTING COUNTRY NAMES INTO UPPERCASE
select upper(country_name) as COUNTRIES from country;