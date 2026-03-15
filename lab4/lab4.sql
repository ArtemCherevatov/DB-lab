-- Лабораторна робота №4 | Аналітичні SQL-запити (OLAP)


-- БЛОК 1: Агрегатні функції та групування


-- 1. Підрахунок кількості замовлень за їхнім статусом

SELECT Status AS "Статус замовлення", COUNT(OrderID) AS "Кількість замовлень"
FROM Orders
GROUP BY Status;

-- 2. Розрахунок загальної суми кожного чека

SELECT OrderID AS "Номер замовлення", SUM(Quantity * UnitPrice) AS "Загальна сума чека"
FROM OrderDetails
GROUP BY OrderID;

-- 3. Статистика цін товарів по категоріях

SELECT CategoryID AS "ID Категорії", 
       ROUND(AVG(Price), 2) AS "Середня ціна", 
       MIN(Price) AS "Мінімальна ціна", 
       MAX(Price) AS "Максимальна ціна"
FROM Products
GROUP BY CategoryID;

-- 4. Фільтрація згрупованих даних

SELECT CategoryID, COUNT(ProductID) AS "Кількість товарів"
FROM Products
GROUP BY CategoryID
HAVING COUNT(ProductID) >= 2;


-- БЛОК 2: Об'єднання таблиць (JOIN)

-- 1. Отримання товарів разом із назвами їхніх категорій

SELECT p.ProductName AS "Товар", c.CategoryName AS "Категорія", p.Price AS "Ціна"
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID;

-- 2. Список усіх клієнтів та їхніх замовлень

SELECT c.FirstName, c.LastName, o.OrderID, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 3. Усі категорії та товари в них

SELECT p.ProductName, c.CategoryName
FROM Products p
RIGHT JOIN Categories c ON p.CategoryID = c.CategoryID;


-- БЛОК 3: Підзапити (Subqueries)


-- 1. Пошук товарів, які дорожчі за середню ціну по магазину

SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

-- 2. Виведення списку клієнтів разом із загальною кількістю їхніх замовлень

SELECT FirstName, LastName, 
       (SELECT COUNT(*) FROM Orders o WHERE o.CustomerID = c.CustomerID) AS "Всього замовлень"
FROM Customers c;

-- 3. Пошук клієнтів, які ще нічого не купили

SELECT FirstName, LastName, Email
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);
