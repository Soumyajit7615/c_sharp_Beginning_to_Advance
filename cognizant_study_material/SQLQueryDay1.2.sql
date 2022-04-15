--PRIMARY KEY AND FOREIGN KEY CONCEPTS

USE UHG
--TABLE DEPARTMENT 
create table tblDepartment
(
DeptId int PRIMARY KEY IDENTITY(101,1),
DeptName varchar(30) NOT NULL,
DeptLoc varchar(50) NOT NULL
)

--TABLE EMPLOYEE

create table tblEmployee
(
EmpID int PRIMARY KEY IDENTITY(1001,1),
EmpName varchar(30) NOT NULL,
DeptID int FOREIGN KEY REFERENCES tblDepartment(DeptId)
)
--INSERT RECORDS INTO tblDepartment
insert into tblDepartment values ('IT','Bangalore')
insert into tblDepartment values ('HR','Hydrabad')
insert into tblDepartment values ('SD','Bangalore')
insert into tblDepartment values ('BA','Pune')
insert into tblDepartment values ('CC','Gurgaon')
--SELECT RECORDS FROM tblDepartment
select *  from tblDepartment

-- INSERT RECORDS INTO EMPLOYEE TABLE
insert into tblEmployee values ('Jyoti',102)
--insert into tblEmployee values ('Jyoti',106) IT WON'T ALLOW FK NOT EXIST
insert into tblEmployee values ('Mounika',102)
insert into tblEmployee values ('Dhiraj',105)
insert into tblEmployee values ('Jesna',103)
insert into tblEmployee values ('Swati',104)

select * from tblEmployee

--SHOW EMPLOYEES DETAILS

select * from tblEmployee,tblDepartment 
where tblEmployee.DeptID = tblDepartment.DeptId
--SHOW EMPLOYEES DETAILS WITH TABLE ALIAS 

select e.EmpID,e.EmpName,e.DeptID,d.DeptName,d.DeptLoc from tblEmployee e,tblDepartment d 
where e.DeptID = d.DeptId

--SHOW EMPLOYEES DETAILS WITH TABLE ALIAS AND COLUMN ALIAS

select e.EmpID as ID,e.EmpName as NAME,e.DeptID as DEPT_ID ,d.DeptName as DEPT_NAME,d.DeptLoc as DEPT_LOC 
from tblEmployee e,tblDepartment d 
where e.DeptID = d.DeptId

--TRY TO DELETE RECORDS FROM  tblDepartment
select * from tblDepartment
select * from tblEmployee

delete from tblDepartment where DeptId=102

--CONSTRAINTS
--UNIQUE KEY
--NOT NULL
--CHECK
--DEFAULT
--PRIMARY KEY
--FOREIGN KEY
 
 -- ADD CONTRAINTS IN THE TABLE 

 alter table tblEmployee add constraint  Fk_DeptID 
 FOREIGN KEY(DeptId) REFERENCES tblDepartment(DeptId)
 ON DELETE CASCADE ON UPDATE CASCADE

select * from tblDepartment
select * from tblEmployee

update tblDepartment set DeptId=107 where DeptId=105

delete from tblDepartment where DeptId=102
--DROP CONSTRAINT
alter table tblEmployee drop constraint Fk_DeptID



select * from tbltrainees

select Tid,TName,ISNULL(course,'N/A') as Course,TEmail,ISNULL(CourseDuration,0) as CourseDuration from tbltrainees 


--COPYING THE STRUCTURE OF TABLE
select * from tblEmployee

select * into NewEmployee from  tblEmployee -- COPYING INTO NEW TABLE ALONG WITH DATA
select * into NewEmp from  tblEmployee where 1=0 --COPYING ONLY STRUCTURE
select * into NEmp from  tblEmployee where DeptID = 102 --COPYING ONLY STRUCTURE


select * from NEmp
sp_help  NewEmp

-- CHECK CONSTRAINT 

select * from tbltrainees

alter table tbltrainees
add constraint  check_duration Check(CourseDuration > 40)

insert into tblTrainees (TName,TEmail,CourseDuration) 
values ('Pratyush','Pr@tyush.com',41)

--DEFAULT CONSTRAINT FOR TABLE LEVEL
alter table tbltrainees
add constraint Default_CourseDuration default(40) FOR CourseDuration

alter table tbltrainees alter column Course varchar(30) NOT NULL

 


 


 
   











  






    








 











 








 

 



)






