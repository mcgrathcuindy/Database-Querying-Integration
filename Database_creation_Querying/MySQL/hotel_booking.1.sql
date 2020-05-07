CREATE DATABASE IF NOT EXISTS hotel_booking;
USE hotel_booking;

DROP TABLE IF EXISTS booking;
CREATE TABLE booking
(hotelNo INT(5),
 guestNo INT(5),dateFrom varchar(35),
 dateTo varchar(35),
 roomNo INT(5),
 PRIMARY KEY(hotelNo,guestNo,dateFrom)
);
INSERT INTO booking VALUES('1','3','2020-03-01 09:10:17','2020-03-07 09:10:17','3');
INSERT INTO booking VALUES('1','4','2020-01-01 10:10:10','2020-01-04 10:10:10','2');
INSERT INTO booking VALUES('2','2','2020-02-01 08:10:10','2020-02-03 08:10:10','1');
INSERT INTO booking VALUES('3','3','2020-02-01 17:18:10','2020-02-03 17:18:10','3');
INSERT INTO booking VALUES('7','1','2020-05-01 09:10:17','2020-06-07 09:10:17','2');
INSERT INTO booking VALUES('10','5','2020-08-01 07:18:10','2020-08-15 07:18:10','1');

DROP TABLE IF EXISTS guest;
CREATE TABLE guest
(guestNo char(5) PRIMARY KEY, 
guestName varchar(20),
guestAddress varchar(35)
);
INSERT INTO guest VALUES('1','Paul Smith', '2 Fergus Dr. Aberdeen AB2');
INSERT INTO guest VALUES('2','Tina Murphy', '63 Well St. Indianapolis G42');
INSERT INTO guest VALUES('3', 'Tony Shaw', '12 Park Pl. Cleveland G4 0QR');
INSERT INTO guest VALUES('4', 'Carrol Farrel', '6 Achray St. Glasgow G32 90X');
INSERT INTO guest VALUES('5', 'Mary how', '232 Governer St. London C5');

DROP TABLE IF EXISTS hotel;
CREATE TABLE hotel
(hotelNo INT(5) PRIMARY KEY,
hotelName varchar(20), 
city varchar(20)
);
INSERT INTO hotel VALUES('1', 'Paradise', 'Las Vegas');
INSERT INTO hotel VALUES('2', 'Flamingo', 'Reno');
INSERT INTO hotel VALUES('3' , 'Mariott', 'Indianapolis');
INSERT INTO hotel VALUES('4', 'Hamilton', 'Washington');
INSERT INTO hotel VALUES('5', 'Hive', 'Washington');
INSERT INTO hotel VALUES('6', 'Flamingo', 'Reno');
INSERT INTO hotel VALUES('7', 'Westin', 'Indianapolis');
INSERT INTO hotel VALUES('8', 'Hilton', 'Cleveland');
INSERT INTO hotel VALUES('9', 'Freehand', 'Los Angeles');
INSERT INTO hotel VALUES('10', 'Mayfair', 'Los Angeles');

DROP TABLE IF EXISTS room;
CREATE TABLE room
(roomNo INT(5),
hotelNo INT(5),
roomType char(5),
price FLOAT(5),
PRIMARY KEY (roomNo, hotelNo)
);
INSERT INTO room VALUES('1','1','S','80');
INSERT INTO room VALUES('1','2','S','15');
INSERT INTO room VALUES('1','3','S','55');
INSERT INTO room VALUES('1','4','S','80');
INSERT INTO room VALUES('1','5','D','120');
INSERT INTO room VALUES('1','6','D','60');
INSERT INTO room VALUES('1','7','S','155');
INSERT INTO room VALUES('1','8','S','10');
INSERT INTO room VALUES('1','9','D','55');
INSERT INTO room VALUES('1','10','S','185');
INSERT INTO room VALUES('2','1','D','100');
INSERT INTO room VALUES('2','2','D','70');
INSERT INTO room VALUES('2','3','D','60');
INSERT INTO room VALUES('2','4','D','100');
INSERT INTO room VALUES('2','5','Q','15');
INSERT INTO room VALUES('2','6','S','90');
INSERT INTO room VALUES('2','7','D','130');
INSERT INTO room VALUES('2','9','S','150');
INSERT INTO room VALUES('3','1','Q','120');
INSERT INTO room VALUES('3','2','Q','60');
INSERT INTO room VALUES('3','3','Q','75');
INSERT INTO room VALUES('3','7','Q','30');