USE master
GO
if exists (select * from sysdatabases where name='SQLAssignment')
drop database SQLAssignment
GO	
create database [SQLAssignment]
CONTAINMENT = none
on primary
(
NAME= N'SQLAssignment',
FILENAME =N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SQLAssignment.mdf ',
SIZE = 10MB, 
MAXSIZE = UNLIMITED,
FILEGROWTH = 1MB
)
LOG ON
(
NAME= N'SQLAssignment_log',
FILENAME =N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SQLAssignment_log.ldf ',
SIZE = 1MB, 
MAXSIZE = 2048MB,
FILEGROWTH = 10%
)
GO
USE [SQLAssignment]
CREATE TABLE pack_grades(
grade_id INT IDENTITY PRIMARY KEY,
grade_name VARCHAR(50)	NOT NULL,
min_price INT NOT NULL,
max_price INT NOT NULL);
GO
CREATE TABLE sectors (
sector_id INt IDENTITY PRIMARY KEY,
sector_name VARCHAR(30) NOT NULL);
GO
CREATE TABLE packages(
pack_id INT IDENTITY PRIMARY KEY,
speed VARCHAR(40) NOT NULL,
strt_date DATE NOT NULL,
monthly_paymentment INT NOT NULL,
sector_id INT NOT NULL REFERENCES sectors(sector_id));
GO
CREATE TABLE customers(
customer_id INT IDENTITY PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) ,
birth_date DATE NOT NULL,
join_date DATE NOT NULL,
city VARCHAR(20) NOT NULL,
custstate VARCHAR(20) NOT NULL,
Street VARCHAR(50) NOT NULL,
mainphno VARCHAR(15) NOT NULL,
secondphno VARCHAR(15),
fax VARCHAR(25),
monthlydiscount INT,
pack_id INT NOT NULL REFERENCES packages(pack_id));

GO

INSERT sectors VALUES('Private')
INSERT sectors VALUES('Business')

GO

INSERT packages VALUES('750Kbps',CAST(0x5C2C0B00 AS Date),79,1)
INSERT packages VALUES('750Kbps',CAST(0x8D2D0B00 AS Date),69,1)
INSERT packages VALUES('750Kbps',CAST(0x092E0B00 AS Date),59,1)
INSERT packages VALUES('750Kbps',CAST(0x05300B00 AS Date),49,1)
INSERT packages VALUES('750Kbps',CAST(0xF9310B00 AS Date),39,1)
INSERT packages VALUES('750Kbps',CAST(0x51320B00 AS Date),29,1)
INSERT packages VALUES('750Kbps',CAST(0xA42B0B00 AS Date),69,2)
INSERT packages VALUES('750Kbps',CAST(0x7D2D0B00 AS Date),59,2)
INSERT packages VALUES('750Kbps',CAST(0x342F0B00 AS Date),49,2)
INSERT packages VALUES('750Kbps',CAST(0x9C300B00 AS Date),39,2)
INSERT packages VALUES('750Kbps',CAST(0x29320B00 AS Date),29,2)
INSERT packages VALUES('750Kbps',CAST(0x2C330B00 AS Date),19,2)
INSERT packages VALUES('1.5Mbps',CAST(0xBD2C0B00 AS Date),89,1)
INSERT packages VALUES('1.5Mbps',CAST(0xB52E0B00 AS Date),79,1)
INSERT packages VALUES('1.5Mbps',CAST(0xA2300B00 AS Date),69,1)
INSERT packages VALUES('1.5Mbps',CAST(0x8F310B00 AS Date),59,1)
INSERT packages VALUES('1.5Mbps',CAST(0x76320B00 AS Date),49,1)
INSERT packages VALUES('1.5Mbps',CAST(0x3B2D0B00 AS Date),79,2)
INSERT packages VALUES('1.5Mbps',CAST(0x3C2E0B00 AS Date),69,2)
INSERT packages VALUES('1.5Mbps',CAST(0xA02F0B00 AS Date),59,2)
INSERT packages VALUES('1.5Mbps',CAST(0x4A310B00 AS Date),49,2)
INSERT packages VALUES('1.5Mbps',CAST(0x5F320B00 AS Date),39,2)
INSERT packages VALUES('2.5Mbps',CAST(0x0C2E0B00 AS Date),99,1)
INSERT packages VALUES('2.5Mbps',CAST(0xD82F0B00 AS Date),89,1)
INSERT packages VALUES('2.5Mbps',CAST(0xC6310B00 AS Date),79,1)
INSERT packages VALUES('2.5Mbps',CAST(0x09330B00 AS Date),69,1)
INSERT packages VALUES('2.5Mbps',CAST(0x8B2E0B00 AS Date),89,2)
INSERT packages VALUES('2.5Mbps',CAST(0x7C2F0B00 AS Date),79,2)
INSERT packages VALUES('2.5Mbps',CAST(0xEC300B00 AS Date),69,2)
INSERT packages VALUES('2.5Mbps',CAST(0x66320B00 AS Date),59,2)
INSERT packages VALUES('5Mbps',CAST(0x55300B00 AS Date),109,1)
INSERT packages VALUES('5Mbps',CAST(0xF6300B00 AS Date),99,1)
INSERT packages VALUES('5Mbps',CAST(0xDF320B00 AS Date),89,1)
INSERT packages VALUES('5Mbps',CAST(0xD1300B00 AS Date),99,2)
INSERT packages VALUES('5Mbps',CAST(0x24320B00 AS Date),89,2)
INSERT packages VALUES('5Mbps',CAST(0x5D330B00 AS Date),79,2)
INSERT packages VALUES('10Mbps',CAST(0xE8300B00 AS Date),119,1)
INSERT packages VALUES('10Mbps',CAST(0xAF320B00 AS Date),109,1)
INSERT packages VALUES('10Mbps',CAST(0x2A320B00 AS Date),109,2)
INSERT packages VALUES('10Mbps',CAST(0x5C320B00 AS Date),99,2)
INSERT packages VALUES('12Mbps',CAST(0xB2330B00 AS Date),129,1)
INSERT packages VALUES('12Mbps','2005-11-03',119,2)

GO

INSERT pack_grades VALUES ('Very Low', 0, 10)
INSERT pack_grades VALUES ('Low', 11, 20)
INSERT pack_grades VALUES ('Medium', 21, 40)
INSERT pack_grades VALUES ('High', 41, 80)
INSERT pack_grades VALUES ('Very High', 81, 150)

GO

INSERT customers VALUES('Alvin','Smith','1962-06-27',CAST(0x812D0B00 AS Date),'NewYork','NewYork','5953HollisterAvenue','567.867.3945','936.228.9436','762.788.3400',CAST(28.00 AS Decimal(4,2)),18);
INSERT customers VALUES('Jose','Jones','1968-01-17',CAST(0x12300B00 AS Date),'LosAngeles','California','4081HollisterAvenue','520.336.8373','939.115.6982','711.883.3345',CAST(12.00 AS Decimal(4,2)),31);
INSERT customers VALUES('Amado','Taylor','1965-08-17',CAST(0x802C0B00 AS Date),'Chicago','Illinois','3402BroderickStreet','522.501.6331','976.113.3737','767.944.7131',NULL,7);
INSERT customers VALUES('Stuart','Williams','1983-05-01',CAST(0xF32E0B00 AS Date),'Houston','Texas','5543JenningsStreet','530.339.4737','963.891.4185','756.186.3634',CAST(17.00 AS Decimal(4,2)),23);
INSERT customers VALUES('Demarcus','Brown','1971-12-02',CAST(0xD62C0B00 AS Date),'Philadelphia','Pennsylvania','5321LagunaStreet','580.733.2184',NULL,'760.663.2046',CAST(11.00 AS Decimal(4,2)),13);
INSERT customers VALUES('Mark','Davies','1970-09-01',CAST(0xAB310B00 AS Date),'Phoenix','Arizona','5868CameronWay','557.701.1366','919.345.5511',NULL,CAST(18.00 AS Decimal(4,2)),39);
INSERT customers VALUES('Merlin','Evans','1962-04-13',CAST(0xD52B0B00 AS Date),'SanAntonio','Texas','8177BrannanStreet','542.753.9215','992.959.8999',NULL,CAST(23.00 AS Decimal(4,2)),1);
INSERT customers VALUES('Elroy','Wilson','1963-01-28',CAST(0x19330B00 AS Date),'SanDiego','California','1873KeyAvenue','544.172.1347','985.345.8501',NULL,CAST(6.00 AS Decimal(4,2)),42);
INSERT customers VALUES('Charles','Thomas','1960-05-13',CAST(0x44320B00 AS Date),'SanJose','California','9164ValenciaStreet','515.656.3047',NULL,'799.101.7626',CAST(29.00 AS Decimal(4,2)),37);
INSERT customers VALUES('Rudolph','Roberts','1973-11-05',CAST(0x412C0B00 AS Date),'Jacksonville','Florida','6308GilbertStreet','549.569.1762','942.671.2496','729.973.1742',CAST(7.00 AS Decimal(4,2)),7);
INSERT customers VALUES('Laurence','Johnson','1975-11-25',CAST(0xC62F0B00 AS Date),'Indianapolis','Indiana','7529McLarenAvenue','527.138.3311','916.219.9787',NULL,CAST(9.00 AS Decimal(4,2)),34);
INSERT customers VALUES('Pasquale','Lewis','1969-05-24',CAST(0x162F0B00 AS Date),'Austin','Texas','1569ClevelandStreet','566.849.6722','983.706.4341',NULL,NULL,27);
INSERT customers VALUES('Pat','Walker','1985-07-02',CAST(0x8D300B00 AS Date),'SanFrancisco','California','4687SloatBoulevard','582.885.8362','938.219.8802',NULL,NULL,31);
INSERT customers VALUES('Harland','Robinson','1974-04-17',CAST(0xFD2F0B00 AS Date),'Columbus','Ohio','5390MontgomeryStreet','520.519.1795','944.392.2529','721.443.8826',CAST(30.00 AS Decimal(4,2)),31);
INSERT customers VALUES('Herschel','Wood','1974-07-24',CAST(0xE9320B00 AS Date),'FortWorth','Texas','7842CorbettAvenue','588.826.5279','997.263.1636','779.791.4617',CAST(30.00 AS Decimal(4,2)),41);
INSERT customers VALUES('Galen','Thompson','1964-12-08',CAST(0x902B0B00 AS Date),'Charlotte','NorthCarolina','5466FarragutAvenue','599.783.7133',NULL,'753.251.6433',CAST(16.00 AS Decimal(4,2)),1);
INSERT customers VALUES('Brain','White','1978-02-13',CAST(0x1F300B00 AS Date),'Detroit','Michigan','3728IngersonStreet','561.654.2679','957.711.4041','794.811.7354',NULL,34);
INSERT customers VALUES('Marcel','Watson','1978-10-12',CAST(0x452E0B00 AS Date),'ElPaso','Texas','9157LeidesdorffStreet','567.827.2421','937.806.4116','723.277.6166',CAST(28.00 AS Decimal(4,2)),23);

GO
--3
SELECT * 
FROM customers;

GO
--4
SELECT pack_id,speed,monthly_paymentment 
FROM packages;

GO
--5
SELECT customer_id,first_name,last_name,mainphno,secondphno,pack_id
FROM customers;

GO
--6
SELECT first_name,last_name,join_date,monthlydiscount,CAST((monthlydiscount+(monthlydiscount*(0.2))) AS FLOAT) AS ADDITION ,CAST((monthlydiscount-(monthlydiscount*(0.2)))AS FLOAT) AS DEDUCTION
FROM customers;

GO
--7
SELECT pack_id,speed,strt_date,monthly_paymentment,monthly_paymentment*12 AS "YEARLY PAYMENT"
FROM packages;

GO
--8
SELECT CONCAT(first_name,' ',last_name) AS FULLNAME, CONCAT(mainphno,',',' ',secondphno) AS CONTACTDETAILS 
FROM customers

GO
--9
SELECT DISTINCT(city) AS UNIQUECITY
FROM customers;

GO
--10
SELECT DISTINCT(custstate) AS UNIQUESTATE
FROM customers;

GO
--11
SELECT DISTINCT city,custstate 
FROM customers;

GO
--12

SELECT CONCAT(last_name,' ',custstate) AS CUSTOMER_AND_STATE
FROM customers;

GO
--13
SELECT first_name FN,last_name LN,monthlydiscount DC,CONCAT(CITY,' ',STREET) FULL_ADDRESS
FROM customers;

GO
--14
SELECT DISTINCT(monthlydiscount) UNIQUEMONTHLYDISCOUNT
FROM customers;

GO
--15
SELECT DISTINCT(pack_id)
FROM customers;

GO
--16
SELECT first_name,last_name,pack_id
FROM customers
WHERE last_name='King';

GO
--17
SELECT *
FROM packages
WHERE SPEED='5Mbps';

GO
--18
SELECT first_name,last_name,pack_id,monthlydiscount
FROM customers
WHERE monthlydiscount <30;

GO
--19
SELECT *
FROM customers
WHERE join_date <'2007-01-01';

GO
--20
SELECT customer_id,first_name,custstate,city,pack_id
FROM customers
WHERE pack_id IN (21,28,14);

GO
--21
SELECT customer_id,first_name,custstate,city,pack_id
FROM customers
WHERE pack_id IN (27,10,3);

GO
--22
SELECT last_name,mainphno,monthlydiscount,pack_id
FROM customers
WHERE customer_id IN(703,314,560);

GO
--23
SELECT first_name,monthlydiscount
FROM customers
WHERE first_name LIKE '%e';	

GO
--24
SELECT last_name,pack_id
FROM customers
WHERE last_name LIKE '_d%';

GO
--25
SELECT *
FROM CUSTOMERS
WHERE last_name LIKE '%L%'
OR last_name LIKE '%J%'
OR last_name LIKE '%H%'
ORDER BY monthlydiscount DESC;

GO
--26
SELECT first_name,join_date,pack_id,monthlydiscount
FROM customers
WHERE last_name NOT LIKE '%A%'
ORDER BY pack_id;

GO 
--27
SELECT pack_id 
FROM customers
WHERE pack_id IS NULL;

GO
--28
SELECT CONCAT(first_name,' ',last_name) AS FULLNAME
FROM customers
WHERE monthlydiscount NOT BETWEEN 20 AND 30 
ORDER BY FULLNAME;

GO
--29
SELECT CONCAT(first_name,' ',last_name) AS FULL_NAME,CONCAT(mainphno,' ',Street) CONTACTS,monthlydiscount DC 
FROM customers
WHERE monthlydiscount BETWEEN 11 AND 27

GO
--30
SELECT *
FROM customers
WHERE city='NEW YORK' 
AND monthlydiscount BETWEEN 30 AND 40
UNION 
SELECT *
FROM customers
WHERE pack_id NOT IN (8,19,30)
AND join_date < '2007-01-01';

GO
--31
SELECT last_name,pack_id,birth_date
FROM customers
WHERE join_date IN(SELECT join_date
				   FROM	customers
				   WHERE join_date BETWEEN '2007-12-12' AND '2010-04-17');

GO
--32
SELECT pack_id,strt_date,speed
FROM packages
WHERE strt_date <(SELECT strt_date
				  FROM packages
				  WHERE strt_date='2007-01-01');

GO
--33
DECLARE @TEST INT
SET @TEST=1
SELECT pack_id,speed,sector_id
FROM packages
WHERE sector_id=@TEST;

GO
--34
DECLARE @VAR1 VARCHAR(20),@VAR2 VARCHAR(20)
SET @VAR1='5Mbps'
SET @VAR2 ='10Mbps'
SELECT pack_id,speed,sector_id
FROM packages
WHERE SPEED =@VAR1
OR speed=@VAR2;

GO
--35
DECLARE @CITYCHECK VARCHAR(20)
SET @CITYCHECK='ORLANDO'
SELECT last_name,monthlydiscount
FROM customers
WHERE city=@CITYCHECK;

GO
--36
DECLARE @VAR1 INT,@VAR2 INT
SET @VAR1=9
SET @VAR2=18
SELECT last_name,pack_id
FROM customers
WHERE pack_id IN (@VAR1,@VAR2);

GO

DECLARE @VAR1 INT,@VAR2 INT
SET @VAR1=9
SET @VAR2=18
SELECT last_name,pack_id
FROM customers
WHERE pack_id=@VAR1
OR pack_id=@VAR2

GO
--37
SELECT first_name,mainphno,secondphno
FROM customers
WHERE secondphno IS NULL;

GO
--38
SELECT first_name,monthlydiscount,pack_id
FROM customers
WHERE monthlydiscount IS NULL;

GO
--39
DECLARE @VAR1 INT,@VAR2 INT
SET @VAR1=80
SET @VAR2=150
SELECT customer_id,LOWER(first_name) AS FIRSTNAME ,UPPER(last_name) AS LASTNAME  
FROM customers
WHERE customer_id 
BETWEEN @VAR1 AND @VAR2;

GO
--40
SELECT first_name,last_name,CONCAT(lower(SUBSTRING(first_name,1,1)),lower(SUBSTRING(last_name,1,3)),'myemail.com') EMAIL
FROM CUSTOMERS;

GO

SELECT first_name,last_name,CONCAT(lower(SUBSTRING(first_name,1,1)),lower(SUBSTRING(last_name,LEN(last_name)-2,3)),'myemail.com') EMAIL
FROM CUSTOMERS;

GO
--41
SELECT last_name, LEN(last_name) LENGTHOFLASTNAME
FROM customers
WHERE LEN(last_name)>9;

GO
--42
SELECT first_name,mainphno,REPLACE(mainphno,'515','$$$') NEWPHONENO
FROM customers;

SELECT first_name,mainphno,CONCAT(REPLACE(LEFT(mainphno,3),'515','$$$'),SUBSTRING(mainphno,4,LEN(MAINPHNO)-3)) NEWPHONENO
FROM customers

GO
--43
SELECT first_name,monthlydiscount,monthlydiscount+(MONTHLYDISCOUNT*(19.7/100)) ADDITIONALMNTHLYDISCOUNT,ROUND(monthlydiscount+(MONTHLYDISCOUNT*(19.7/100)),0) ROUNDWHOLE,FLOOR(monthlydiscount+(MONTHLYDISCOUNT*(19.7/100))) ROUNDDOWN,CEILING(monthlydiscount+(MONTHLYDISCOUNT*(19.7/100))) ROUNDUP
FROM customers

GO
--44
SELECT first_name,join_date,DATEADD(DAY,-10,join_date) '10DAYSBFORE',DATEADD(MONTH,1,join_date) '1MONTHLATER',DATEDIFF(DAY,join_date,GETDATE()) DAYSDIFFERENCE
FROM customers;

GO
--45
SELECT first_name,birth_date,DATEDIFF(YEAR,birth_date,GETDATE()) AGE
FROM customers
WHERE DATEDIFF(YEAR,birth_date,GETDATE()) >50;

GO
--46
SELECT *
FROM customers
WHERE DATEPART(D,birth_date)=DATEPART(D,GETDATE())
AND	  DATEPART(M,birth_date)=DATEPART(M,GETDATE());

GO
--47
SELECT first_name,join_date,DATEDIFF(YEAR,join_date,GETDATE()) AS NOOFYEARSOFEXPERIENCE
FROM customers
WHERE DATEDIFF(YEAR,join_date,GETDATE())>5;

GO
--48
SELECT CONCAT(first_name,' ',CAST(join_date AS nvarchar)) FIRSTNAMEANDJOINDATE,CONCAT(last_name,' ',CAST(monthlydiscount AS nvarchar)) LASTNAMEANDMONTHLYDISCOUNT
FROM customers

GO
--49
SELECT  last_name,
                UPPER(custstate) + ' / ' + CONVERT(varchar , customer_id , 102) ,
                CONVERT(varchar , birth_date , 103) + ' / ' + CONVERT(varchar , join_date ,  103)
FROM customers
WHERE SUBSTRING(last_name , 1 , 1) IN ('D' , 'K')

GO
--50.
SELECT  first_name ,
                last_name ,
                ISNULL(mainphno , 'N / A'),
                ISNULL(secondphno, 'N / A'),
                ISNULL(fax, 'N / A')
FROM customers
WHERE pack_id = 27 

GO
 
 SELECT  first_name ,
                last_name ,
                birth_date ,
                ISNULL(mainphno , 'N / A'),
                ISNULL(secondphno, 'N / A'),
                ISNULL(fax, 'N / A')
FROM customers
WHERE pack_id = 27
AND
              year(birth_date) = 1972

GO
--51.
SELECT first_name , last_name , monthlydiscount ,
              CASE WHEN monthlydiscount BETWEEN 0 AND 10 THEN 'A'
                WHEN monthlydiscount BETWEEN 11 AND 20 THEN 'B'
                WHEN monthlydiscount BETWEEN 21 AND 30 THEN 'C'
                ELSE 'D'
             END AS 'Grades'
FROM customers

GO
--52.
select min(last_name)
from customers

GO
--53.
select avg(monthly_payment) AVG
from packages

GO
--54.
select max (last_name)
from customers

GO
--55.
select count(pack_id) as No_OF_Packages
from packages

GO
--56.
select count(Customer_id) as Total_Records
from customers

GO
--57.
select count(distinct custstate) as dis_states
from customers

GO
--58.
select count(distinct speed) as distinct_speed
from packages

GO
--59..
select count(fax) Count_FAx
from customers
where fax IS NOT NULL

GO
--60.
select count(*) Count_FAx
from customers
where fax is NULL

GO
select max(monthlydiscount) HIGHESt,min(monthlydiscount) LOWEST,avg(monthlydiscount) AVG
from customers

GO
--61.
select custstate, count(distinct custstate) 
from customers
group by  custstate
order by  custstate

GO
--62.
SELECT COUNT(custstate),custstate FROM CUSTOMERS GROUP BY custstate   
 
GO
--63.
select speed,AVG(monthly_payment) as AVG
from packages
group by speed

GO
--64.
select sector_id ,max(monthly_payment) max
from packages
group by sector_id

GO
--66a
select pack_id,avg(monthlydiscount) avg
from customers
group by pack_id

GO

select pack_id,avg(monthlydiscount) avg
from customers
where pack_id in(22,13)
group by pack_id

GO
--67.
select speed,max(monthly_payment) max,min(monthly_payment) min,avg(monthly_payment) avg
from packages
group by speed

GO
--68.
select pack_id,count(customer_id) as count
from customers
group by pack_id

GO
select pack_id,count(customer_id) as count
from customers
where monthlydiscount>20 
group by pack_id

GO
--69
select custstate,city,COUNT(customer_id) as no_of_customer
from customers
group by custstate, city

GO
--70.
select city,AVG(monthlydiscount)
from customers 
group by city

GO
select city,AVG(monthlydiscount)
from customers 
where monthlydiscount>20
group by city

GO
--71.
select min(monthlydiscount) as min_monthlydiscountount, custstate 
from customers 
group by custstate;

GO
select min(monthlydiscount) as min_monthlydiscountount, custstate 
from customers where(monthlydiscount > 10)
group by custstate;

GO
--72.
select count(speed), speed  from packages 
group by speed having count(speed)>  8;

GO
--73. 
select first_name, last_name, packages.pack_id, speed from customers,packages;

GO
SELECT customers.pack_id
FROM packages
INNER JOIN customers ON packages.pack_id = customers.pack_id;

GO
select first_name, last_name, packages.pack_id, speed  
from customers,packages 
where (packages.pack_id =22 OR packages.pack_id=27)

GO
SELECT customers.pack_id
FROM packages
INNER JOIN customers ON packages.pack_id = customers.pack_id;

GO
--74.
select pack_id, monthly_payment, speed, sector_name  
from sectors,packages
--where sectors.pack_=packages.pack_id;

GO 
SELECT customers.first_name,packages.pack_id,packages.speed,packages.monthly_payment,sectors.sector_name
FROM customers 
INNER JOIN 
(packages INNER JOIN sectors
ON sectors.sector_id=packages.pack_id) 
ON customers.customer_id=packages.pack_id

GO
SELECT customers.first_name,packages.pack_id,packages.speed,packages.monthly_payment,sectors.sector_name
FROM customers 
INNER JOIN 
(packages INNER JOIN sectors
ON sectors.sector_id=packages.pack_id) 
ON customers.customer_id=packages.pack_id
where sectors.sector_name='Business';


GO
--75. 
SELECT customers.first_name,customers.last_name,customers.join_date,packages.pack_id,packages.speed,packages.monthly_paymentment,sectors.sector_name
FROM customers 
INNER JOIN 
(packages INNER JOIN sectors
ON sectors.sector_id=packages.pack_id) 
ON customers.customer_id=packages.pack_id
where customers.join_date='2006' and sectors.sector_name='Private';

GO
--76
select p.pack_id,p.speed,p.monthly_payment,pg.grade_id
from packages p 
JOIN pack_grades pg
on  p.pack_id = pg.grade_id

GO
--77
select concat(c.First_Name,' ',c.Last_Name),p.pack_id,p.speed,p.monthly_payment
from customers c 
inner join packages p
on (c.pack_id=p.pack_id)

GO
--78
select c.First_Name,c.Last_Name,c.pack_id
from customers c 
join customers c1
on (c.pack_id=c1.pack_id)
where c1.Last_Name = 'Taylor' AND c1.First_Name = 'Amado'

GO
--79
select c.First_Name,c.Last_Name,c.pack_id,c1.monthlydiscount
from customers c 
join customers c1
on (c.pack_id=c1.pack_id)
where  c1.Customer_id = 103
       AND c.monthlydiscount < c1.monthlydiscount

GO
select First_Name , Last_Name ,pack_id,monthlydiscount
from customers
where monthlydiscount < (select monthlydiscount from customers where customer_id = 170)

GO
--80
select speed,pack_id from
 packages where speed=(select speed from packages
 where pack_id=10)
 
 GO
 --81
 select first_name,last_name,city,custstate from customers
 where custstate=(select custstate from customers 
 where customer_id=17)
 
 GO
 --82
select pack_id,speed,sector_id from packages
where sector_id=(select sector_id from packages 
where pack_id=10)

GO
--83
select first_name,last_name,join_date from customers
where join_date >(select join_date from customers 
where customer_id =5)

GO
--84
SELECT first_name , last_name , join_date
FROM customers
WHERE year(join_date) = (SELECT year(join_date) FROM customers WHERE customer_id = 3)
AND
month(join_date) = (SELECT month(join_date) FROM customers WHERE customer_id = 3)
 
GO
-- 85
SELECT first_name , last_name , city , custstate, pack_id
FROM customers
WHERE pack_id IN (SELECT pack_id FROM packages WHERE speed = '5Mbps')

GO 
-- 86
SELECT pack_id , speed , strt_date
FROM packages
WHERE year(strt_date) = (SELECT year(strt_date) FROM packages WHERE pack_id = 7)
 
GO
-- 87
SELECT first_name , monthlydiscount , pack_id , mainphno ,secondphno
FROM customers
WHERE pack_id IN
        (SELECT pack_id
            FROM packages
            WHERE sector_id IN
                    (SELECT sector_id
                     FROM sectors
                     WHERE sector_name = 'Business'))

GO 
-- 88
SELECT first_name , monthlydiscount, pack_id
FROM customers
WHERE pack_id IN
                 (SELECT  pack_id
                  FROM packages
                  WHERE monthly_payment >
                             (SELECT AVG(monthly_payment)
                              FROM packages))

GO
-- 89
SELECT customer_id , first_name , city , custstate ,birth_date , monthlydiscount
FROM customers
WHERE birth_date =
             (SELECT birth_date FROM customers WHERE customer_id = 10)
              AND
              monthlydiscount >
                 (SELECT monthlydiscount FROM customers WHERE customer_id = 10)
 
GO
-- 90
SELECT *
FROM packages
WHERE speed =
         (SELECT speed FROM packages WHERE pack_id = 30)
AND
             monthly_payment >
             (SELECT monthly_payment FROM packages WHERE pack_id = 7)

GO 
-- 91
SELECT pack_id ,speed , monthly_payment
FROM packages
WHERE monthly_payment
        > ALL(SELECT monthly_payment FROM packages WHERE speed = '5Mbps')
 
GO
-- 92
SELECT pack_id ,speed , monthly_payment
FROM packages
WHERE monthly_payment >
         ANY (SELECT monthly_payment FROM packages WHERE speed = '5Mbps')
 
GO
-- 93
SELECT pack_id ,speed , monthly_payment
FROM packages
WHERE monthly_payment
         < ANY (SELECT monthly_payment FROM packages WHERE speed = '5Mbps')
 
GO
-- 94
SELECT first_name ,monthlydiscount , pack_id
FROM customers
WHERE monthlydiscount <
        (SELECT AVG(monthlydiscount) FROM customers)
AND
             pack_id IN
             (SELECT pack_id FROM customers WHERE first_name = 'Kevin')