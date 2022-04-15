--AGGREGATE FUNCTION 
use UHG
create table tblCountry
(
ID int PRIMARY KEY,
CountryName varchar(30) NOT NULL,
Population int,
Year int 
)

insert into tblCountry values (1,'India',1000,1990)
insert into tblCountry values (2,'Nepal',200,1990)
insert into tblCountry values (3,'India',1500,1991)
insert into tblCountry values (4,'SriLanka',500,1990)
insert into tblCountry values (5,'Nepal',400,1991)
insert into tblCountry values (6,'India',2500,1992)
insert into tblCountry values (7,'Nepal',700,1992)
insert into tblCountry values (8,'SriLanka',700,1992)
insert into tblCountry values (9,'India',500,1991)
select * from tblCountry

select 
SUM(Population) as TOTAL_POPULATION,
MAX(Population) as MAXPOP,
MIN(Population) as MINPOP,
AVG(Population) as AVGPOP,
COUNT(*) as COUNTROW -- TOTAL NO OF RECORDS
from tblCountry

--GROUP BY ON COUNTRY NAME WITH POPULATION
select CountryName,year,SUM(Population) 
from tblCountry
group by CountryName,year

select year,SUM(Population) 
from tblCountry
group by year


select CountryName,SUM(Population) 
from tblCountry
group by CountryName
having SUM(Population) > 1200

select CountryName,Population 
from tblCountry
--group by CountryName
where Population > 1200
--having Population > 1200


















