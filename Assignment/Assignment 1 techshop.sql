task 1
--creating DB
CREATE DATABASE TechShop;
GO
USE TechShop;
GO
--create customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(20),
    Address VARCHAR(200)
);
GO
--create products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description VARCHAR(200),
    Price INT
);
GO
--create orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount INT DEFAULT 0,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);
GO
--create orderdetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO
--create inventory table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT UNIQUE,
    QuantityInStock INT,
    LastStockUpdate DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Inventory_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO
--inserting values to table
GO
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES 
(1, Ravi', 'Sharma', 'ravi.sharma@email.com', '555-1234', '12 MG Road, Mumbai'),
(2, 'Diya', 'Patel', 'diya.patel@email.com', '555-5678', '34 Brigade Road, Bangalore'),
(3, 'Vihaan', 'Singh', 'vihaan.singh@email.com', '555-8765', '56 Connaught Place, Delhi'),
(4, 'Ananya', 'Gupta', 'ananya.gupta@email.com', '555-4321', '78 Park Street, Kolkata'),
(5, 'Advait', 'Joshi', 'advait.joshi@email.com', '555-6789', '90 Jubilee Hills, Hyderabad'),
(6, 'Ishaan', 'Malhotra', 'ishaan.malhotra@email.com', '555-9876', '123 Koregaon Park, Pune'),
(7, 'Myra', 'Reddy', 'myra.reddy@email.com', '555-2345', '45 Boat Club Road, Chennai'),
(8, 'Kavya', 'Iyer', 'kavya.iyer@email.com', '555-3456', '67 Banjara Hills, Hyderabad'),
(9, 'Arjun', 'Mehta', 'arjun.mehta@email.com', '555-5679', '89 Church Street, Bangalore'),
(10, 'Anika', 'Choudhary', 'anika.choudhary@email.com', '555-6780', '101 Marine Drive, Mumbai');

GO

INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES 
(1, 'Laptop', 'i7 laptop', 7200),
(2, 'Smartphone', '%G smartphone', 40000),
(3, 'Tablet', '9-inch screen tablet', 30000),
(4, 'Smartwatch', 'Wearable OLED smartwatch', 2500),
(5, 'Earphones', 'Noise-canceling Earphones', 1500),
(6, 'Keyboard', 'Wireless keyboard', 1000),
(7, 'Mouse', 'Wireless mouse', 500),
(8, 'Monitor', '23-inch LED monitor', 2000),
(9, 'Speakers', 'Bluetooth speakers', 1800),
(10, 'External HDD', '500GB external hard drive', 9000);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES 
(1, 1, '2025-03-01', 2400),
(2, 2, '2025-03-02', 1600),
(3, 3, '2025-03-03', 800),
(4, 4, '2025-03-04', 250),
(5, 5, '2025-03-05', 300),
(6, 6, '2025-03-06', 1200),
(7, 7, '2025-03-07', 400),
(8, 8, '2025-03-08', 500),
(9, 9, '2025-03-09', 150),
(10, 10, '2025-03-10', 90);
go

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES 
(1, 1, 1, 2),  
(2, 2, 2, 2), 
(3, 3, 3, 1), 
(4, 4, 4, 1), 
(5, 5, 5, 2),  
(6, 6, 1, 1),  
(7, 7, 6, 2),  
(8, 8, 7, 5), 
(9, 9, 5, 1), 
(10, 10, 10, 1); 
GO

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES 
(1, 1, 50, '2025-03-01'),
(2, 2, 100, '2025-03-02'),
(3, 3, 30, '2025-03-03'),
(4, 4, 25, '2025-03-04'),
(5, 5, 60, '2025-03-05'),
(6, 6, 70, '2025-03-06'),
(7, 7, 90, '2025-03-07'),
(8, 8, 40, '2025-03-08'),
(9, 9, 55, '2025-03-09'),
(10, 10, 80, '2025-03-10');
GO

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Inventory;
GO

--task 2
--find the total number of orders placed by each customer and list their names along with the order count

SELECT FirstName, LastName, Email FROM Customers;

--q2 to list all orders with their order dates and corresponding customer names.
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName 
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--q3 to insert a new customer record into the "Customers" table
UPDATE Customers
SET FirstName = 'Reshhma', LastName = 'Ramesh', Email = 'reshhmaramesh@gmail.com', Phone = '8590441738', Address = '123 Main, Trivandrum, India'
WHERE CustomerID = 12;

--q4 y to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
UPDATE Products 
SET Price = Price * 1.10 
WHERE Description LIKE '%electronic%';

--q5  to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables.
DELETE FROM dbo.OrderDetails  
WHERE OrderID = 3;  

DELETE FROM dbo.Orders  
WHERE OrderID = 3;

--q6 o insert a new order into the "Orders" table. Include the customer ID, order date,
 insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
values
(10, 10, '2025-03-11', 900.87);

--q7  to update the contact information specific customer in the "Customers" table
 update dbo.Customers
set Email='abc@example.com',
	Address= '123 New Street, palara,Trivandrum'
	where CustomerID=1;

--q8  SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.
 UPDATE Orders 
SET TotalAmount = (
    SELECT SUM(Products.Price * OrderDetails.Quantity) 
    FROM OrderDetails 
    JOIN Products ON OrderDetails.ProductID = Products.ProductID 
    WHERE OrderDetails.OrderID = Orders.OrderID
);

--q9 to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails"
DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 101);
DELETE FROM Orders WHERE CustomerID = 101;

--q10  insert a new electronic gadget product into the "Products" table, 
INSERT INTO Products (ProductID,ProductName,Description, Price) 
VALUES (11,'Smartphone X', 'Latest electronic smartphone with AI features', 569.99);

--q11 o update the status of a specific order in the "Orders" table
 UPDATE Orders 
SET TotalAmount = '900'
WHERE OrderID = '11';

-- query to calculate and update the number of orders placed by each customer UPDATE Customers 
SET FirstName = (
    SELECT COUNT(*) 
    FROM Orders 
    WHERE Orders.CustomerID = Customers.CustomerID
);
--Task 3
--q1  to retrieve a list of all orders along with customer information
SELECT o.OrderID, o.OrderDate, o.TotalAmount, 
       c.FirstName, c.LastName, c.Email, c.Phone, c.Address
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

--q2 to find the total revenue generated by each electronic gadget product.
SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;

--q3 list all customers who have made at least one purchase with name and contact
SELECT DISTINCT c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NOT NULL;

--q4 find the most popular electronic gadget with highest quanitity ordered
SELECT TOP 1 p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC;

--q5 retrieve a list of electronic gadgets along with their corresponding categories. 
SELECT p.ProductName,p.Description
FROM Products p
WHERE p.ProductName LIKE '%Gadget%';

--q6 calculate the average order value
SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;

--q7 find the order with the highest total revenue
SELECT TOP 1 o.OrderID, c.FirstName, c.LastName, c.Email, o.TotalAmount AS TotalRevenue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC;

--q8 the number of times each product has been ordered and list it.

SELECT p.ProductName, COUNT(od.OrderDetailID) AS TimesOrdered
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TimesOrdered DESC;

--q9 to find customers who have purchased a specific electronic gadget

DECLARE @ProductName VARCHAR(100) = 'Laptop';

SELECT DISTINCT c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = @ProductName;

--q10  the total revenue generated within a specific time period

DECLARE @StartDate DATETIME = '2025-03-01';
DECLARE @EndDate DATETIME = '2025-03-10';

SELECT SUM(o.TotalAmount) AS TotalRevenue
FROM Orders o
WHERE o.OrderDate BETWEEN @StartDate AND @EndDate;

Task 4

--q1  to find out which customers have not placed any orders

SELECT c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c
WHERE c.CustomerID NOT IN (
    SELECT DISTINCT CustomerID 
    FROM Orders
);

--q2 to find the total number of products available for sale. 

SELECT COUNT(*) AS TotalProductsAvailable
FROM Products;

--q3 to calculate the total revenue generated by TechShop. 
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

--q4 to calculate the average quantity ordered for products in a specific category.
DECLARE @CategoryName VARCHAR(50) = 'Laptop';
SELECT AVG(od.Quantity) AS AverageQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName LIKE '%' + @CategoryName + '%';

--q5 to calculate the total revenue generated by a specific customer
DECLARE @CustomerID INT = 1; 

SELECT SUM(o.TotalAmount) AS TotalCustomerRevenue
FROM Orders o
WHERE o.CustomerID = @CustomerID;

--q6 to find the customers who have placed the most orders.

SELECT TOP 1 c.FirstName, c.LastName, COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY NumberOfOrders DESC;

--q7 to find the most popular product category, which is the one with the highest total quantity ordered across all orders.
SELECT TOP 1 p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od, Products p WHERE od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC;
Go

--q8 to find the customer who has spent the most money on electronic gadgets. List their name and total spending
SELECT TOP 1 c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpending
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IN (
    SELECT od.OrderID
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE p.Description LIKE '%electronic%' OR p.ProductName LIKE '%electronic%'
)
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSpending DESC;

--q9to calculate the average order value (total revenue divided by the number of orders) for all customers.
SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;

--q10 find the total number of orders placed by each customer and list their names along with the order count

SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY OrderCount DESC;