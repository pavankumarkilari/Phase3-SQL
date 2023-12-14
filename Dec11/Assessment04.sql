create database ExerciseDb
 
use ExerciseDb

create table Products
(PId int primary key,
PQ int not null,
PPrice float not null,
DiscountPercent float not null,
ManufacturingDate date)

--inserting records
insert into Products (PId,PQ,PPrice,DiscountPercent,ManufacturingDate) values (106,1,29000.40,18,'2023/04/09')
insert into Products (PId,PQ,PPrice,DiscountPercent,ManufacturingDate) values (102,5,2500.50,12,'2023/08/17')
insert into Products (PId,PQ,PPrice,DiscountPercent,ManufacturingDate) values (107,1,32000.90,20,'2021/05/07')
insert into Products (PId,PQ,PPrice,DiscountPercent,ManufacturingDate) values (101,3,5400.60,9,'2022/07/16')
insert into Products (PId,PQ,PPrice,DiscountPercent,ManufacturingDate) values (103,2,8400.40,33,'2018/02/25')
insert into Products (PId,PQ,PPrice,DiscountPercent,ManufacturingDate) values (105,1,25000.90,25,'2022/11/21')

--function to calculate the discounted value
create function discountedValue
(
@price float, @discount float
)
returns float As
begin
return (select (@price*(100-@discount))/100);
end

--display PId, price, discount,price after discount
select PId, PPrice as 'Price', DiscountPercent as 'Discount', dbo.discountedValue(PPrice, DiscountPercent) AS 'Price after discount' FROM Products;