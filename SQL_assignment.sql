CREATE DATABASE app_store;
USE app_store;

create table sales_people(
	Snum int primary key,
	Sname varchar(50),
	city varchar (50) NOT NULL,
	comm int);
    
select * from sales_people;
	insert into sales_people(Snum,Sname,city,comm) values (1001, "Peel", "London", 12);
	insert into sales_people(Snum,Sname,city,comm) values (1002, "Serres", "Sanjose", 13);
	insert into sales_people(Snum,Sname,city,comm) values (1004, "Motika", "London", 11);
	insert into sales_people(Snum,Sname,city,comm) values (1007, "rifkin", "Barcelona", 15);
	insert into sales_people(Snum,Sname,city,comm) values (1003, "Axelrod", "New York", 10);


CREATE TABLE CUSTOMERS (
    Cnum int primary key,
    Cname varchar(50),
    City varchar(50) ,
    snum int,
	FOREIGN KEY(snum) REFERENCES sales_people(Snum));
    
select * from CUSTOMERS;
	insert into customers(Cnum,Cname,City,snum) values (2001, "Hoffman", "London", 1001);
    insert into customers(Cnum,Cname,City,snum) values (2002, "Giovanni ", "Rome", 1003);
    insert into customers(Cnum,Cname,City,snum) values (2003, "Liu", "Sanjose", 1002);
    insert into customers(Cnum,Cname,City,snum) values (2004, "Grass", "Berlin", 1002);
    insert into customers(Cnum,Cname,City,snum) values (2006, "Clemens", "London", 1001);
    insert into customers(Cnum,Cname,City,snum) values (2008, "Cisneros", "Sanjose", 1007);
    insert into customers(Cnum,Cname,City,snum) values (2007, "Pereira", "Rome", 1004);
    
    
create table orders(
	Onum int primary key,
    Amt decimal(6,2),
    Odate date,
    Cnum int,
    FOREIGN KEY(Cnum) REFERENCES customers(Cnum),
    Snum int,
    FOREIGN KEY(Snum) REFERENCES sales_people(Snum)
    );
select * from orders;
	insert into orders(Onum, Amt, Odate, Cnum, Snum) values (3001, 18.69, '1990-10-03', 2008, 1007);
    insert into orders(Onum, Amt, Odate, Cnum, Snum) values (3003, 767.19, '1990-10-03', 2001, 1001);
	insert into orders(Onum, Amt, Odate, Cnum, Snum) values (3002, 1900.0, '1990-10-03', 2007, 1004);
    insert into orders(Onum, Amt, Odate, Cnum, Snum) values (3005, 5160.45, '1990-10-03', 2003, 1002);
	insert into orders(Onum, Amt, Odate, Cnum, Snum) values (3006, 1098.16, '1990-10-03', 2008, 1007);
    insert into orders(Onum, Amt, Odate, Cnum, Snum) values (3009, 1713.23, '1990-10-04', 2002, 1003);
    insert into orders(Onum, Amt, Odate, Cnum, Snum) values (3007, 75.75, '1990-10-04', 2004, 1002);
    insert into orders(Onum, Amt, Odate, Cnum, Snum) values (3008, 4273.00, '1990-10-05', 2006, 1001);
    insert into orders(Onum, Amt, Odate, Cnum, Snum) values (3010, 1309.95, '1990-10-06', 2004, 1002);
    insert into orders(Onum, Amt, Odate, Cnum, Snum) values (3011, 9891.88, '1990-10-06', 2006, 1001);
    
    
#1. count the number of salesperson whose name beign with'a'/'A'.
    SELECT * FROM sales_people where Sname like 'A%';
    
#2.Display all the salesperson whose all orders worth is morethan Rs.2000.
    SELECT orders.snum,orders.amt, sales_people.sname FROM orders INNER JOIN sales_people ON orders.snum=sales_people.snum WHERE orders.amt>2000;

    
#3. count the number of salesperson belonging to newyork.
    SELECT * FROM sales_people where city ="New York";
    
    
#4.Display the number of Salespeople belonging to London and belonging to Paris.
   
    SELECT * FROM sales_people where city = "London" or "Paris";

#5.Display the number of orders taken by each Salesperson and their date of orders.
    SELECT  Sname,Odate,COUNT(*) 
     FROM sales_people,orders
     WHERE sales_people.Snum = orders.Snum 
     GROUP BY Sname,Odate;
     
     
     