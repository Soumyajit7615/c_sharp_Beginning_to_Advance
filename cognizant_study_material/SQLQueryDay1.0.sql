use UHG

create table tblStudent
(
RollNo int PRIMARY KEY,
SName varchar(50) NOT NULL,
SClass varchar(3) NOT NULL,
SEmail varchar(30) NOT NULL 
)

SP_HELP tblStudent
insert into tblStudent values (1001,'Shubham','V','subh@am.com')
insert into tblStudent values (1002,'Venkatesh','III','Venk@tesh.com')
insert into tblStudent values (1003,'Mayank','I','May@nk.com')

select * from tblStudent

create table tblStudents
(
RollNo int PRIMARY KEY IDENTITY (1001,1),
SName varchar(50) NOT NULL,
SClass varchar(3) NOT NULL,
SEmail varchar(30) NOT NULL 
)

insert into tblStudents values ('Shubham','V','subh@am.com')
insert into tblStudents values ('Venkatesh','III','Venk@tesh.com')
insert into tblStudents values ('Mayank','I','May@nk.com')

select * from tblStudents
select * from tblstud


create table tblTrainees
(
TId int PRIMARY KEY IDENTITY (101,1),
TName varchar(30) NOT NULL,
Course varchar(30),
TEmail varchar(50) NOT NULL
)

insert into tblTrainees values ('Mayank',null,'Monk@nk.com')
insert into tblTrainees (TName,TEmail) values ('Poornashree','Poorna@shree.com')

select * from tblTrainees

--'alter table tblTrainees alter column Course default 'DOT NET'

DROP TABLE tblTrainees

create table tblTrainees
(
TId int PRIMARY KEY IDENTITY (101,1),
TName varchar(30) NOT NULL,
Course varchar(30) DEFAULT 'DOT NET',
TEmail varchar(50) NOT NULL
)
insert into tblTrainees (TName,TEmail) values ('Poornashree','Poorna@shree.com')
insert into tblTrainees values ('Mayank',null,'Monk@nk.com')
select * from tblTrainees

alter table tblTrainees add CourseDuration int -- Added new column into table

sp_help tblTrainees
--ALTER - ADD , ALTER

alter table tblTrainees alter column TName varchar(50) -- varchar(30) to varchar(50)

--SELECT RECORD
select * from tblTrainees
--SELECT SPECIFIC COLUMN
select [TId],[TName] from tblTrainees

--UPDATE RECORD

update tblTrainees set TName='Mayank Khare' where Tid=102 -- 


insert into tblTrainees values ('Abneet',null,'ab@neet.com',40)

--delete record

delete from tblTrainees where  TId=103




















