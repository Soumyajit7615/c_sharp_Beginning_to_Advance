--PROCEDURE ARE SAME AS FUNCTION , BUT IT WILL NOT RETURNED VALUE
--PROCEDURE AS ALSO KNOWN AS PRECOMPILED STATEMENT
--PROCEDURE HAVE SET OF STATEMENT , WHICH WILL BE EXECUTED AS UNIT / BATCH

--NON PARAMETERIZED STORE PROCEDURE
create procedure spshowemployeedetails
AS
BEGIN
SELECT e.EmpID, e.EmpName, e.DeptID, d.DeptName, d.DeptLoc
FROM dbo.tblEmployee AS e INNER JOIN
dbo.tblDepartment AS d ON e.DeptID = d.DeptId
END

EXEC spshowemployeedetails

--PARAMETERIZED STORE PROCEDURE

create procedure spAddEmployee
@EmpName varchar(30),--IN PARAMTER
@DeptID int-- IN PARAMETER
AS
BEGIN
insert into tblEmployee values (@EmpName,@DeptID)
END

select * from tblEmployee

DECLARE @EmpName as varchar(20)
DECLARE @DeptID as int
SET @EmpName = 'Satyabrata'
SET @DeptID = 106

EXEC spAddEmployee @EmpName,@DeptID
-------------------------------------------
--CREATE PROCEDURE WITH OUTPUT TYPE PARAMETER

create procedure spouttypeselectEmployee
--add parameter to this procedure
@EmpID int,--INPUT PARAMETER
@EmpName varchar(30),--INPUT PARAMETER
@CurrentDateTime datetime output  --OUT PUT PARAMETER
AS
BEGIN
	set @CurrentDateTime = GETDATE()
	select * from tblEmployee where EmpID = @EmpID and  EmpName = @EmpName
	return @@rowcount
	 
END


SELECT * FROM tblEmployee

--CALL PROCEDURE
declare @DateTimeCurrent datetime
declare @RowCount int
EXEC @RowCount = spouttypeselectEmployee 1003,'Mounika',@DateTimeCurrent OUTPUT
print @DateTimeCurrent
print @RowCount


create table tblEmployeeAutoID
(
EmpID int primary key,
EmpName varchar(30),
EmpLoc varchar(20)
)

select * from tblEmployeeAutoID

declare @varid int
declare @rcount int
select  @varid=max(empid),@rcount=@@ROWCOUNT from  tblEmployeeAutoID
print @varid
print @rcount

if @varid IS NULL
begin
print 'hello'
end
else    
begin
print 'HI'
end 

alter procedure SPAddEmployeeAutoID
@EmpName varchar(30),
@EmpLoc varchar(20)
as
begin
declare @varid int
declare @rcount int
select  @varid= max(empid) from  tblEmployeeAutoID
	if  @varid IS NULL
	begin
	insert into tblEmployeeAutoID values (1001,@EmpName,@EmpLoc)
	end
	else    
	begin
	set @varid = @varid + 1
	insert into tblEmployeeAutoID values (@varid,@EmpName,@EmpLoc)
	end
end
exec SPAddEmployeeAutoID 'Satyabrata','ODISHA'

delete from tblEmployeeAutoID where EmpId = 1001
select * from tblEmployeeAutoID

-----------------------
create procedure PCreateDynamicTable
@tblName varchar(30),
@FirstColumnName varchar(30),
@FirstColumnDatatype varchar(30),
@SecondColumnName varchar(30),
@SecondColumnDatatype varchar(30)
As
BEGIN
DECLARE @sqlstring varchar(100)
--set @sqlstring = 'create table' + CAST(@tblName as varchar(30)) +
set @sqlstring = 'create table ' + @tblName +
 '('+@FirstColumnName+' '+@FirstColumnDatatype+','+@SecondColumnName+' '+@SecondColumnDatatype+')'
exec (@sqlstring)
END

EXEC PCreateDynamicTable 'DyTable','ID','int','Name','varchar(10)'

sp_help DyTable

-- SOME SYSTEM DEFINED PROCEDURE

sp_helptext PCreateDynamicTable
sp_help 'tblEmployeeAutoID'
sp_helpdb 'CTSDBINTADM21DF010'
sp_renamedb 'CMS','CMS2'
sp_rename 'tblEmployeeAutoIDGen','tblEmployeeAutoID'
sp_columns 'tblEmployeeAutoID'
sp_databases
sp_tables