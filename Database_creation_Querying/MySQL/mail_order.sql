CREATE DATABASE IF NOT EXISTS MAILORDER;
USE MAILORDER;

DROP TABLE IF EXISTS PARTS;
CREATE TABLE PARTS
(Pno INT(20) PRIMARY KEY,
 Pname varchar(100),
 Qoh INT(20),
 Price float(10),
 Olevel varchar(100)
);

DROP TABLE IF EXISTS CUSTOMERS;
CREATE TABLE CUSTOMERS
(Cno INT(20) PRIMARY KEY,
 Cname varchar(100),
 Street varchar(100),
 Zip INT(10),
 Phone varchar(100)
);

DROP TABLE IF EXISTS EMPLOYEES;
CREATE TABLE EMPLOYEES
(Eno INT(20) PRIMARY KEY,
 Ename varchar(100),
 Zip INT(100),
 Hdate varchar(100)
);

DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS
(Ono INT(20) PRIMARY KEY,
 Cno INT(20),
 Eno INT(20),
 Received varchar(100),
 Shipped varchar(100)
);
 
DROP TABLE IF EXISTS ODETAILS;
CREATE TABLE ODETAILS
(Ono INT(20) PRIMARY KEY,
 Pno INT(20),
 Qty INT(100)
);