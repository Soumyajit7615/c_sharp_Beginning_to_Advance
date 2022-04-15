create database UHG

--drop database UHGDatabase

use UHG

select * from RawTable

create table tblNormal
(
ID int PRIMARY KEY IDENTITY (1,1), -- SEEDING , INCREMENT
A int NOT NULL,
B int NOT NULL,
C int NOT NULL 
)

-- DESC in oracle to see into about table

sp_help tblNormal

select * from RawTable
select * from tblNormal

select distinct * from RawTable

--insert into table values (1,2,3)
insert into tblNormal select distinct * from RawTable








 














