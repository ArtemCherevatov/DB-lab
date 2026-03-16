-- 1. Створення нормалізованих таблиць (3НФ)
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Categories (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    CategoryID INTEGER REFERENCES Categories(CategoryID),
    ProductName VARCHAR(255) NOT NULL,
    Price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INTEGER REFERENCES Customers(CustomerID),
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE OrderDetails (
    OrderID INTEGER REFERENCES Orders(OrderID),
    ProductID INTEGER REFERENCES Products(ProductID),
    Quantity INTEGER NOT NULL,
    UnitPrice NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID)
);

-- 2. Видалення початкової ненормалізованої таблиці
DROP TABLE IF EXISTS Raw_Orders;