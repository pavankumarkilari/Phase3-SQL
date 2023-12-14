--creating database
create database Assessment05Db

use Assessment05Db

--creating schema
create schema bank

--creating Customer table
create table bank.Customer(
CID int primary key identity(1000,1),
CName nvarchar(50) not null,
CEmail nvarchar(50) not null unique,
Contact nvarchar(50) not null unique,
CPWD as substring(Cname, LEN(Cname) - 1,2)+ cast(CID as nvarchar) + left(Contact, 2) persisted)

--creating MailInfo table
create table bank.MailInfo(
MailTo nvarchar(50),
MailDate date,
MailMessage nvarchar(max))

--creating trigger trgMailToCust
create trigger bank.trgMailToCust
on bank.Customer
after insert
as
begin
insert into bank.MailInfo(MailTo,MailDate,MailMessage) 
select CEmail, getdate(), 'Your net banking password is: ' + CPWD + '. It is valid upto 2 days only. Update it.' from inserted
end

--inserting records
insert into bank.Customer (CName,CEmail,Contact) values
('Pavan','pavankumarkilari519@gmail.com',7093456123),
('Praveen','kondrupraveen2001@gmail.com',9904536237),
('Mahesh','maheshbabu@gmail.com',9856234789)

--displaying the tables
select * from bank.Customer
select * from bank.MailInfo