create database Assessment01

on primary(name='Assessment_mdf',Filename='K:\Phase3\SQL\Assessments\Dec07\Assessment01_mdf.mdf',size=24MB, filegrowth=8MB)
log on (name='Assessment_ldf',Filename='K:\Phase3\SQL\Assessments\Dec07\Assessment01_ldf.ldf')
COLLATE SQL_Latin1_General_CP1_CI_AS

use Assessment01

create table Product(
PId int primary key,
PName nvarchar(50) not null,
PPrice float check(PPrice>=50 AND PPrice<=100000),
PCompany nvarchar(100),
PQty int default 1 check(PQty>=1)
)

insert into Product(PId, PName,PPrice,PCompany,PQty) values
(50, 'Mobile', 22099, 'Samsung', 2),
(51, 'iPad', 53999, 'Apple', 2),
(52, 'LED TV', 17000, 'Redmi', 4),
(53, 'Mobile', 13499, 'HTC', 3),
(54, 'Laptop', 70000, 'Apple', 1);

select * from Product