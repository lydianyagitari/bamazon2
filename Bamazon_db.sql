
CREATE DATABASE Bamazon_db;

USE Bamazon_db;

CREATE TABLE products
(
	id INT NOT NULL
	AUTO_INCREMENT,
	ProductName VARCHAR
	(100) NOT NULL,
	DepartmentName VARCHAR
	(100) NOT NULL,
	Price DECIMAL
	(10,2) default 0,
	StockQuantity INT default 0,
	PRIMARY KEY
	(id)
);

	INSERT INTO products
		(ProductName, DepartmentName, Price, StockQuantity)
	VALUES
		('Brooks 2', 'Food', 99, 12);
	INSERT INTO products
		(ProductName, DepartmentName, Price, StockQuantity)
	VALUES
		('Nikes 8', 'Running Shoes', 129.95, 20);
	INSERT INTO products
		(ProductName, DepartmentName, Price, StockQuantity)
	VALUES
		('Mizuno', 'Running Shoes', 119.95, 10);
	INSERT INTO products
		(ProductName, DepartmentName, Price, StockQuantity)
	VALUES
		('jim beam', 'Running Shoes', 119.95, 33);
	INSERT INTO products
		(ProductName, DepartmentName, Price, StockQuantity)
	VALUES
		('pumas', 'Running Shoes', 'Apparel', 70, 10);
	INSERT INTO products
		(ProductName, DepartmentName, Price, StockQuantity)
	VALUES
		('Nike Men', 'Running Tank', 'Apparel', 45, 12);
	INSERT INTO products
		(ProductName, DepartmentName, Price, StockQuantity)
	VALUES
		('Nike Women', 'Running Tee', 'Apparel', 75, 40);
	INSERT INTO products
		(ProductName, DepartmentName, Price, StockQuantity)
	VALUES
		('Nike Women', 'Running Tank', 'Apparel', 50, 3);
	INSERT INTO products
		(ProductName, DepartmentName, Price, StockQuantity)
	VALUES
		('Hydration Belt', 'Accessories', 55, 4);
	INSERT INTO products
		(ProductName, DepartmentName, Price, StockQuantity)
	VALUES
		('Headlamp', 'Accessories', 25, 20);
	INSERT INTO products
		(ProductName, DepartmentName, Price, StockQuantity)
	VALUES
		('GPS Watch', 'Electronics', 299.99, 2);

	CREATE TABLE departments
	(
		DepartmentId INT NOT NULL
		AUTO_INCREMENT,
	DepartmentName VARCHAR
		(100) NOT NULL,
	OverheadCost DECIMAL
		(10,2) NOT NULL,
	TotalSales DECIMAL
		(10,2),
	PRIMARY KEY
		(DepartmentId)
);

		INSERT INTO departments
			(DepartmentName, OverheadCost)
		VALUES('Food', 500);
		INSERT INTO departments
			(DepartmentName, OverheadCost)
		VALUES('Apparel', 500);
		INSERT INTO departments
			(DepartmentName, OverheadCost)
		VALUES('Electronics', 500);
		INSERT INTO departments
			(DepartmentName, OverheadCost)
		VALUES('Accessories', 500);
