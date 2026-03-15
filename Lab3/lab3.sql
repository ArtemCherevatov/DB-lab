-- 1. Використання SELECT 
-- Вибір лише певних стовпців 
SELECT FirstName, LastName, Email 
FROM Customers;

-- Фільтрація за допомогою WHERE
SELECT ProductName, Price, StockQuantity 
FROM Products 
WHERE Price > 20000;

-- Фільтрація тексту
SELECT * FROM Orders 
WHERE Status = 'Нове';

-- 2. Використання INSERT

-- Додаємо нового клієнта в базу
INSERT INTO Customers (FirstName, LastName, Email, Phone) 
VALUES ('Іван', 'Франко', 'ivan.franko@example.com', '+380991112233');

-- Додаємо новий товар
INSERT INTO Products (CategoryID, ProductName, Price, StockQuantity) 
VALUES (3, 'Навушники Bluetooth', 2500.00, 30);

-- 3. Використання UPDATE

-- Змінюємо статус замовлення
UPDATE Orders 
SET Status = 'Відправлено' 
WHERE OrderID = 3;

-- Оновлюємо ціну та залишок на складі для конкретного товару
UPDATE Products 
SET Price = 38000.00, StockQuantity = 12 
WHERE ProductName = 'Samsung Galaxy S24';

-- 4. Використання DELETE

-- Спочатку створимо тестового клієнта
INSERT INTO Customers (FirstName, LastName, Email) 
VALUES ('Тест', 'Користувач', 'test.delete@example.com');

-- Тепер видаляємо його за допомогою WHERE
DELETE FROM Customers 
WHERE Email = 'test.delete@example.com';
