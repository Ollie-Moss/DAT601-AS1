USE master;
DROP DATABASE IF EXISTS business_database;
go
CREATE DATABASE business_database;
go 
USE business_database;
go

-- DDL 
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer
(
	CustID		CHAR(10)	NOT NULL,
	CustName	CHAR(50)	NOT NULL,
	CustAddress	CHAR(50)	,
	CustCity	CHAR(50)	,
	CustContact	CHAR(50)	,
	CustPhone	CHAR(15)	,
	CustEmail	CHAR(255)	
);

DROP TABLE IF EXISTS OrderEntry;
CREATE TABLE OrderEntry
(
	OrderID		INTEGER		NOT NULL,
	OrderDate	DATETIME	NOT NULL,
	CustID		CHAR(10)	NOT NULL
);

DROP TABLE IF EXISTS Vendor;
CREATE TABLE Vendor
(
	VendorID		CHAR(10)	NOT NULL,
	VendorName		CHAR(50)	NOT NULL,
	VendorAddress	CHAR(50)	,
	VendorCity		CHAR(50)	,
	VendorPhone		CHAR(15)
);

DROP TABLE IF EXISTS OrderItem;
CREATE TABLE OrderItem
(
	OrderID		INTEGER		NOT NULL,
	OrderItem	INTEGER		NOT NULL,
	ProductID	CHAR(10)	NOT NULL,
	Quantity	INTEGER		NOT NULL,
	ItemPrice	DECIMAL(8,2)NOT NULL
);

DROP TABLE IF EXISTS Product;
CREATE TABLE Product
(
	ProductID		CHAR(10)	NOT NULL,
	VendorID		CHAR(10)	NOT NULL,
	ProductName		CHAR(255)	NOT NULL,
	ProductPrice	DECIMAL(8,2)NOT NULL,
	ProductDesc		VARCHAR(100)		
);

-- ALTER TABLE TO ADD contraints: PRIMARY KEYs, and FOREIGN  KEYs 

ALTER TABLE Customer 
    ADD 
		CONSTRAINT PK_Customer
			PRIMARY KEY(CustID);

ALTER TABLE OrderEntry 
	ADD 
		CONSTRAINT PK_Order
			PRIMARY KEY(OrderID),
		CONSTRAINT FK_OrderCustomer
			FOREIGN KEY(CustID) REFERENCES Customer(CustID);

ALTER TABLE Vendor 
    ADD 
		CONSTRAINT PK_Vendor
			PRIMARY KEY(VendorID);

ALTER TABLE Product 
    ADD 
		CONSTRAINT PK_Product
			PRIMARY KEY(ProductID),
		CONSTRAINT FK_ProductVendor
			FOREIGN KEY(VendorID) REFERENCES Vendor(VendorID);

ALTER TABLE OrderItem
	ADD
		CONSTRAINT PK_OrderItem
			PRIMARY KEY(OrderID, OrderItem),
		CONSTRAINT FK_OrderItemEntry
			FOREIGN KEY(OrderID) REFERENCES OrderEntry(OrderID),
		CONSTRAINT FK_OrderProduct
			FOREIGN KEY(ProductID) REFERENCES Product(ProductID);


-- DML insert data
INSERT INTO Customer(CustID,CustName,CustAddress,CustCity,CustPhone,CustContact,CustEmail)
VALUES('1000000001','Village Toys','200 Oak Lane','Wellington','09-389-2356','John Smith','sales@villagetoys.co.nz');

INSERT INTO Customer(CustID,CustName,CustAddress,CustCity,CustPhone,CustContact)
VALUES('1000000002','Kids Place','333 Tahunanui Drive','Nelson','03-545-6333','Michelle Green');

INSERT INTO Customer(CustID,CustName,CustAddress,CustCity,CustPhone,CustContact,CustEmail)
VALUES('1000000003','Fun4All','1 Sunny Place','Nelson','03-548-2285','Jim Jones','jjones@fun4all.co.nz');

INSERT INTO Customer(CustID,CustName,CustAddress,CustCity,CustPhone,CustContact,CustEmail)
VALUES('1000000004','Fun4All','829 Queen Street','Auckland','09-368-7894','Denise L. Stephens','dstephens@fun4all.co.nz');

INSERT INTO Customer(CustID,CustName,CustAddress,CustCity,CustPhone,CustContact)
VALUES('1000000005','The Toy Store','50 Papanui Road','Christchurch','04-345-4545','Kim Howard');


INSERT INTO OrderEntry(OrderID,OrderDate,CustID)
VALUES(20005,'1999/5/1','1000000001');

INSERT INTO OrderEntry(OrderID,OrderDate,CustID)
VALUES(20006,'1999/1/12','1000000003');

INSERT INTO OrderEntry(OrderID,OrderDate,CustID)
VALUES(20007,'1999/1/30','1000000004');

INSERT INTO OrderEntry(OrderID,OrderDate,CustID)
VALUES(20008,'1999/2/3','1000000005');

INSERT INTO OrderEntry(OrderID,OrderDate,CustID)
VALUES(20009, '1999/2/8','1000000001');


INSERT INTO Vendor(VendorID, VendorName, VendorAddress, VendorCity, VendorPhone)
VALUES('BRS01','Bears R Us','123 Main Street','Richmond','03-523-8871');

INSERT INTO Vendor(VendorID, VendorName, VendorAddress, VendorCity, VendorPhone)
VALUES('BRE02','Bear Emporium','500 Park Street','Auckland','06-396-8854');

INSERT INTO Vendor(VendorID, VendorName, VendorAddress, VendorCity, VendorPhone)
VALUES('DLL01','Doll House Inc.','555 High Street','Motueka','03-455-7898');

INSERT INTO Vendor(VendorID, VendorName, VendorAddress, VendorCity, VendorPhone)
VALUES('FRB01','Furball Inc.','1 Clifford Avenue','Nelson','03-546-9978');

INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
VALUES('BR01', 'BRS01', '8 inch teddy bear',5.99,'8 inch teddy bear, comes with cap and jacket');

INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
VALUES('BR02', 'BRS01', '12 inch teddy bear',8.99,'12 inch teddy bear, comes with cap and jacket');

INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
VALUES('BR03', 'BRS01', '18 inch teddy bear',11.99,'18 inch teddy bear, comes with cap and jacket');

INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
VALUES('BNBG01', 'DLL01', 'Fish bean bag toy',3.49,'Fish bean bag toy, complete with bean bag worms with which to feed it');

INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
VALUES('BNBG02', 'DLL01', 'Bird bean bag toy',3.49,'Bird bean bag toy, eggs are not included');

INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
VALUES('BNBG03', 'DLL01', 'Rabbit bean bag toy',3.49,'Rabbit bean bag toy, comes with bean bag carrots');

INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
VALUES('RGAN01', 'DLL01', 'Raggedy Ann',4.99,'18 inch Raggedy Ann doll');

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20005,1,'BR01',100,5.49);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20005,2,'BR03',100,10.99);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20006,1,'BR01',20,5.99);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20006,2,'BR02',10,8.99);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20006,3,'BR03',10,11.99);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20007,1,'BR03',50,11.49);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20007,2,'BNBG01',100,2.99);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20007,3,'BNBG02',100,2.99);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20007,4,'BNBG03',100,2.99);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20007,5,'RGAN01',50,4.49);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20008,1,'RGAN01',5,4.99);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20008,2,'BR03',5,11.99);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20008,3,'BNBG01',10,3.49);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20008,4,'BNBG02',10,3.49);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20008,5,'BNBG03',10,3.49);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20009,1,'BNBG01',250,2.49);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20009,2,'BNBG02',250,2.49);

INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
VALUES(20009,3,'BNBG03',250,2.49);

-- QUERIES AND VIEWS
GO

USE business_database;

-- 1
SELECT 
	ProductID, 
	ProductDesc 
FROM 
	Product 
WHERE 
	VendorID != 'DLL01';

-- 2
SELECT 
	ProductDesc, 
	ProductPrice 
FROM 
	Product 
WHERE 
ProductPrice BETWEEN 5 AND 10;

-- 3
SELECT 
	ProductDesc, 
	ProductPrice 
FROM 
	Product 
WHERE 
	ProductPrice > 10 AND (VendorID = 'DLL01' OR VendorID = 'BRS01');

-- 4
SELECT 
	AVG(ProductPrice) AS AveragePrice 
FROM 
	Product;

-- 5
SELECT 
	COUNT(*) AS NumberOfCustomers 
FROM 
	Customer;

-- 6
SELECT 
	COUNT(CustEmail) AS NumberOfEmailCustomers 
FROM 
	Customer;

-- 7
SELECT 
	COUNT(ProductName) as NumberOfProducts, 
	MIN(ProductPrice) as MinPrice, 
	MAX(ProductPrice) as MaxPrice, 
	AVG(ProductPrice) as AveragePrice 
FROM 
	Product;

-- 8
SELECT 
	v.VendorName, 
	p.ProductName, 
	p.ProductPrice 
FROM 
	Vendor AS v, 
	Product AS p 
WHERE 
	p.VendorID = v.VendorID;

-- 9
SELECT 
	p.ProductName, 
	v.VendorName, 
	p.ProductPrice, 
	o.Quantity 
FROM 
	Product AS p, 
	Vendor AS v, 
	OrderItem AS o
WHERE 
	o.ProductID = p.ProductID AND 
	v.VendorID = p.VendorID AND 
	o.OrderID = 20007;

-- 10
SELECT 
	CustName, 
	CustContact 
FROM 
	Customer 
WHERE 
	CustID IN 
	(
		SELECT CustID 
		FROM OrderEntry 
		WHERE OrderID IN 
		(
			SELECT OrderID 
			FROM OrderItem 
			WHERE ProductID = 'RGAN01'
		)
	);

-- 11
SELECT 
	CustName, 
	CustCity, 
	(
	SELECT COUNT(*) 
	FROM OrderEntry AS o 
	WHERE o.CustID = c.CustID
	) AS NumOfOrders 
FROM 
	Customer AS c
ORDER BY 
	CustName;

-- 12 NOTE: INCORRECT QUERY PROVIDES CORRECT RESULT! WHAT IS A REPORT?
SELECT CustName, CustContact, CustEmail 
FROM Customer 
WHERE (CustCity = 'Nelson' OR CustCity = 'Wellington') OR CustName = 'Fun4All'
ORDER BY CustName, CustContact;

SELECT 
	CustName, 
	CustContact, 
	CustEmail
FROM
	Customer
WHERE 
	CustCity IN ('Nelson', 'Wellington')
UNION
SELECT
	CustName, 
	CustContact, 
	CustEmail
FROM
	Customer
WHERE
	CustName = 'Fun4All'
ORDER BY
	CustName, 
	CustContact;

-- 13
DROP VIEW IF EXISTS vProductCustomer;

GO 
CREATE VIEW vProductCustomer AS
	SELECT 
		oi.OrderID, 
		oi.ProductID, 
		c.*, 
		oe.OrderDate, 
		oi.OrderItem, 
		oi.Quantity, 
		oi.ItemPrice 
	FROM 
		Customer AS c
		INNER JOIN 
			OrderEntry AS oe ON oe.CustID = c.CustID
		INNER JOIN 
			OrderItem AS oi ON oi.OrderID = oe.OrderID;

GO

SELECT 
	CustName, 
	CustContact 
FROM 
	vProductCustomer 
WHERE 
	ProductID = 'RGAN01'
ORDER BY 
	CustName;

-- 14
INSERT INTO Customer(CustID,CustName,CustPhone)
VALUES('1000000006','The Toy Emporium', '09-546-8552');

DROP VIEW IF EXISTS vCustomerMailingLabel
GO
CREATE VIEW vCustomerMailingLabel AS
	SELECT 
		CustName, 
		CustAddress, 
		CustCity, 
		CustPhone 
	FROM 
		Customer;

GO

-- GETS ALL MAILING LABELS
SELECT 
	* 
FROM 
	vCustomerMailingLabel;

-- ONLY GETS VALID MAILING LABELS
SELECT 
	* 
FROM 
	vCustomerMailingLabel 
WHERE 
	CustName IS NOT NULL AND
	CustAddress IS NOT NULL AND
	CustCity IS NOT NULL AND
	CustPhone IS NOT NULL;
