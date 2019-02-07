CREATE DATABASE Bamazon_db;

USE Bamazon_db;

CREATE TABLE products(
	Id INT NOT NULL AUTO_INCREMENT,
	ProductName VARCHAR(100) NOT NULL,
	DepartmentName VARCHAR(100) NOT NULL,
	Price DECIMAL(10,2) default 0,
	StockQuantity INT default 0,
	PRIMARY KEY(Id)
);

INSERT INTO products(ProductName, DepartmentName, Price, StockQuantity) VALUES ('Jim Beam', 'Liquor', 18.99, 50);
INSERT INTO products(ProductName, DepartmentName, Price, StockQuantity) VALUES ('Adidas Supernova Glide 8', 'Running Shoes', 129.95, 20);
INSERT INTO products(ProductName, DepartmentName, Price, StockQuantity) VALUES ('Mizuno Wave Rider 18', 'Food', 119.95, 10);
INSERT INTO products(ProductName, DepartmentName, Price, StockQuantity) VALUES ('Hennessy ', 'Liquor', 31.99, 16);
INSERT INTO products(ProductName, DepartmentName, Price, StockQuantity) VALUES ('collards', 'Food', 1.99, 10);
INSERT INTO products(ProductName, DepartmentName, Price, StockQuantity) VALUES ('sugar', 'Baking', 45, 12);
INSERT INTO products(ProductName, DepartmentName, Price, StockQuantity) VALUES ('baking soda', 'Baking', 75, 40);
INSERT INTO products(ProductName, DepartmentName, Price, StockQuantity) VALUES ('Nike Women', 'Apparel', 50, 3);
INSERT INTO products(ProductName, DepartmentName, Price, StockQuantity) VALUES ('Hydration Belt', 'Accessories', 55, 4);
INSERT INTO products(ProductName, DepartmentName, Price, StockQuantity) VALUES ('Headlamp', 'Accessories', 25, 20);
INSERT INTO products(ProductName, DepartmentName, Price, StockQuantity) VALUES ('GPS Watch', 'Electronics', 299.99, 2);

CREATE TABLE departments (
	DepartmentId INT NOT NULL AUTO_INCREMENT,
	DepartmentName VARCHAR(100) NOT NULL,
	OverheadCost DECIMAL(10,2) NOT NULL,
	TotalSales DECIMAL(10,2),
	PRIMARY KEY(DepartmentId)
);

INSERT INTO departments(DepartmentName, OverheadCost) VALUES('Liquor', 500);
INSERT INTO departments(DepartmentName, OverheadCost) VALUES('Food', 500);
INSERT INTO departments(DepartmentName, OverheadCost) VALUES('Baking', 500);
INSERT INTO departments(DepartmentName, OverheadCost) VALUES('Accessories', 500);
