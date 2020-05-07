CREATE DATABASE IF NOT EXISTS books;
USE books;

DROP TABLE IF EXISTS Books;
CREATE TABLE Books
(ISBN varchar(35) PRIMARY KEY,
 Author varchar(100),
 Title varchar(100),
 Price float(10)
);
INSERT INTO Books VALUES('0-672-31509-2','Pruitt, et al.','Teach Yourself GIMP in 24 Hours','24.99');
INSERT INTO Books VALUES('0-672-31697-8','Michael Morgan', 'Java 2 for Professional Developers','34.99');
INSERT INTO Books VALUES('0-672-31745-1','Thomas Down', 'Installing Debian GNU/Linux','24.99');
INSERT INTO Books VALUES('0-672-31769-9','Thomas Schenk','Caldera OpenLinux System Administration Unleashed','49.99');

DROP TABLE IF EXISTS Book_Reviews;
CREATE TABLE Book_Reviews
(ISBN varchar(35) PRIMARY KEY, 
Review varchar(100)
);
INSERT INTO Book_Reviews VALUES('0-672-31697-8','The Morgan book is clearly written and goes well beyond most of the basic Java books out there.');

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers
(CustomerID INT(5) PRIMARY KEY,
Name varchar(30), 
Address varchar(30),
City varchar(30)
);
INSERT INTO Customers VALUES('1','Julie Smith', '25 Oak Street', 'Airport West');
INSERT INTO Customers VALUES('2','Alan Wong','1/47 Haines Avenue','Box Hill');
INSERT INTO Customers VALUES('3','Michelle Arthur','357 North Road', 'Yarraville');

DROP TABLE IF EXISTS Order_Items;
CREATE TABLE Order_Items
(OrderID INT(5),
ISBN varchar(35),
Quantity INT(5),
PRIMARY KEY (OrderID, ISBN)
);
INSERT INTO Order_Items VALUES('1','0-672-31697-8','2');
INSERT INTO Order_Items VALUES('2','0-672-31769-9','1');
INSERT INTO Order_Items VALUES('3','0-672-31509-2','1');
INSERT INTO Order_Items VALUES('3','0-672-31769-9','1');
INSERT INTO Order_Items VALUES('4','0-672-31745-1','3');

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(OrderID INT(5) PRIMARY KEY,
CustomerID INT(5),
Amount float(8),
Date varchar(35)
);
INSERT INTO Orders VALUES('1','3','69.98','2007-04-02');
INSERT INTO Orders VALUES('2','1','49.99','2007-04-15');
INSERT INTO Orders VALUES('3','2','74.98','2007-04-19');
INSERT INTO Orders VALUES('4','3','24.99','2007-05-01');