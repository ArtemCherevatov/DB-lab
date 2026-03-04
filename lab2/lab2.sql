-- ЧАСТИНА 1: СТВОРЕННЯ ТАБЛИЦЬ (DDL)

-- 1. Створення таблиці Клієнтів
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20)
);

-- 2. Створення таблиці Категорій
CREATE TABLE Categories (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(100) UNIQUE NOT NULL
);

-- 3. Створення таблиці Товарів
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    CategoryID INTEGER REFERENCES Categories(CategoryID),
    ProductName VARCHAR(255) NOT NULL,
    Price NUMERIC(10, 2) NOT NULL CHECK (Price > 0),
    StockQuantity INTEGER NOT NULL DEFAULT 0 CHECK (StockQuantity >= 0)
);

-- 4. Створення таблиці Замовлень
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INTEGER REFERENCES Customers(CustomerID),
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50) DEFAULT 'Нове' NOT NULL
);

-- 5. Створення таблиці Деталей замовлення
CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INTEGER REFERENCES Orders(OrderID) ON DELETE CASCADE,
    ProductID INTEGER REFERENCES Products(ProductID),
    Quantity INTEGER NOT NULL CHECK (Quantity > 0),
    UnitPrice NUMERIC(10, 2) NOT NULL CHECK (UnitPrice > 0)
);

-- ЧАСТИНА 2: ВСТАВКА ТЕСТОВИХ ДАНИХ (DML)

-- Додаємо клієнтів
INSERT INTO Customers (FirstName, LastName, Email, Phone) VALUES
('Олександр', 'Іваненко', 'oleksandr@example.com', '+380501234567'),
('Марія', 'Петренко', 'maria.p@example.com', '+380671234567'),
('Андрій', 'Коваленко', 'andriy.k@example.com', '+380631234567'),
('Олена', 'Сидоренко', 'olena.s@example.com', NULL);

-- Додаємо категорії товарів
INSERT INTO Categories (CategoryName) VALUES
('Смартфони'),
('Ноутбуки'),
('Аксесуари');

-- Додаємо товари
INSERT INTO Products (CategoryID, ProductName, Price, StockQuantity) VALUES
(1, 'iPhone 15 Pro', 45000.00, 10),
(1, 'Samsung Galaxy S24', 40000.00, 15),
(2, 'MacBook Air M2', 55000.00, 5),
(3, 'Бездротовий зарядний пристрій', 1500.00, 50),
(3, 'Чохол силіконовий', 500.00, 100);

-- Додаємо замовлення
INSERT INTO Orders (CustomerID, OrderDate, Status) VALUES
(1, '2023-10-01 10:30:00', 'Доставлено'),
(2, '2023-10-02 14:15:00', 'В обробці'),
(1, '2023-10-05 09:00:00', 'Нове'),
(3, '2023-10-06 18:45:00', 'Відправлено');

-- Додаємо деталі замовлень (вміст чеків)
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 45000.00), -- Олександр купив iPhone
(1, 4, 2, 1500.00),  -- та дві зарядки
(2, 3, 1, 55000.00), -- Марія купила MacBook
(3, 5, 3, 500.00),   -- Олександр купив 3 чохли пізніше
(4, 2, 1, 40000.00); -- Андрій купив Samsung

