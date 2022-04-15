
--In SQL, a view is a virtual table based on the result-set of an SQL statement.
--A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.
--You can add SQL statements and functions to a view and present the data as if the data were coming from one single table.
--A view is created with the CREATE VIEW statement. 

NOTE :

--You can insert, update, and delete rows in a view, subject to the following limitations: If the view contains joins between multiple --tables, you can only insert and update one table in the view, and you can't delete rows. You can't directly modify data in views based on union

select * from tblEmployee
select * from tblDepartment

--CREATE VIEW SELECT QUERY 
create view VEmpDetails
As
select e.EmpID,e.EmpName,e.DeptID,d.DeptName,d.DeptLoc
from tblEmployee e,tblDepartment d where e.DeptID=d.DeptId

select * from VEmpDetails

--CREATE VIEW WITH SELECT ON DEPARTMENT TABLE
select * from tblDepartment

create view VtblDepartment
as
select * from tblDepartment
--INSERT AND UPDATE ONLY WHEN VIEW WILL HAVE SINGLE TABLE
select * from VtblDepartment

insert into VtblDepartment values ('FIN','USA')
update VtblDepartment set  DeptName='FINANCE' WHERE  DeptName='FIN'
delete VtblDepartment where DeptId =107

sp_help tblDepartment -- see the information about table , description
sp_helptext  VtblDepartment -- when set of statement object , then use helptext

create view VEtblDepartment
WITH ENCRYPTION
as
select * from tblDepartment

select * from VEtblDepartment

sp_helptext VEtblDepartment

ALTER view VEtblDepartment
as
select * from tblDepartment
--ROW HIDING 
Create view VEDtblDepartment
as
select * from tblDepartment where DeptId=102
WITH CHECK OPTION

select * from VEDtblDepartment
--COLUMN HIDING

create view VSBDept
WITH SCHEMABINDING
as
select Deptid,DeptName,DeptLoc from dbo.tblDepartment

drop table dbo.tblDepartment

select * from dbo.tblDepartment

create view VtblStudent
WITH SCHEMABINDING
as
select RollNo,SEmail,SName,SClass  from dbo.tblStudent

 
 drop table tblStudent