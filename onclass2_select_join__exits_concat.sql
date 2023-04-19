show columns from customer;
insert into customer (cName, cAge) values 
("Minh Quan", 10),
("Ngoc Oanh", 20),
("Hong Ha", 50);
select * from customer;
show columns from products;
alter table orders modify column oDate date;
insert into orders values 
(1,1, '2006/3/21',1),
(2,2, '2006/3/26',1),
(3,1, '2006/3/16',1);
select * from orders;
insert into products values 
(1,"May Giat", 3),
(2,"Tu Lanh", 5),
(3,"Dieu Hoa", 7),
(4,"Quat", 1),
(5,"Bep Dien", 2);
select * from products;
insert into orderdetail (oID, pID, odQTy) values 
(1,1, 3),
(1,3, 7),
(1,4, 2),
(2,1, 1),
(3,1, 8),
(2,5, 4),
(2,3, 3);
select * from orderdetail;
select oID, oDate, oTotalPrice from orders;
select customer.cName, products.pName from customer 
join orders on orders.cID = customer.cID
join orderdetail on orderdetail.oID = orders.oID
join products on products.pID = orderdetail.pID;
select customer.cName from customer
where not exists (select orders.cID from orders where orders.cID = customer.cID);
select orders.oID, orders.oDate, concat(products.pPrice*orderdetail.odQTy) as Total from orders 
join orderdetail on orderdetail.oID = orders.oID 
join products on orderdetail.pID = products.pID;