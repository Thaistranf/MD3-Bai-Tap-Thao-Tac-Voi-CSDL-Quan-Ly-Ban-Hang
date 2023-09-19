create database quanlybanhang;
use quanlybanhang;
create table Customer (
cID int primary key,
name varchar(25),
cAge tinyint
);

create table Orders (
oID int primary key,
cID int,
oDate datetime,
oTotalPrice int,
foreign key (cID) references customer (cID)
);

create table Product (
pID int primary key,
pName varchar(25),
pPrice int
);

create table OrderDetail (
oID int,
pID int,
odQTY int,
foreign key (oID) references Orders (oID),
foreign key (pID) references Product (pID)
);

insert into Customer (cID, name, cAge)
values (1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

insert into Orders (oID, cID, oDate)
values (1, 1, '2006-3-21'),
(2, 2, '2006-3-23'),
(3, 1, '2006-3-16');

insert into Product (pID, pName, pPrice)
values (1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into OrderDetail (oID, pID, odQTY)
values (1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

select oID, oDate, oTotalPrice
from Orders;

select Od.oID, C.name, P.pName
from Customer C join Orders O on C.cID = O.cID join OrderDetail Od on O.oID = Od.oID join Product P on Od.pID = P.pID;

select C.name
from Customer C left join Orders O on C.cID = O.cID
where O.cID is null;

select O.oID, O.oDate, sum(Od.odQTY * P.pPrice) as oTotalPrice
from Orders O join OrderDetail Od on O.oID = Od.oID join Product P on Od.pID = P.pID
group by O.oID, O.oDate;