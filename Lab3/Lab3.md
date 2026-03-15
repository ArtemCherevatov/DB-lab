# Лабораторна робота №3 | Маніпулювання даними SQL (OLTP)

### Мета роботи
Тестування бази даних шляхом виконання запитів у стилі транзакцій (OLTP). Практичне застосування основних операцій маніпулювання даними (DML) у PostgreSQL: `SELECT`, `INSERT`, `UPDATE` та `DELETE`.

### База даних складається з наступних таблиць:

* **Customer**(`customer_id`[PK], `first_name`, `last_name`, `email`, `phone`)
* **Order**(`order_id`[PK], `customer_id`[FK], `order_date`, `status`)
* **OrderDetail**(`order_detail_id`[PK], `order_id`[FK], `product_id`[Fk], `quantity`, `unit_price`)
* **Product**(`product_id`[PK], `category_id`[FK], `product_name`, `price`, `stock_quantity`)
* **Category**(`category_id`[PK], `category_name`)

### Виконані операції маніпулювання даними

Згідно з вимогами, базу даних було протестовано наступними запитами:
1. **INSERT:** Додано нові рядки в таблиці `STUDENT` та `LOAN`, щоб кожна таблиця містила щонайменше 5 записів.
2. **UPDATE:** Змінено існуючі дані з використанням речення `WHERE` (зафіксовано факт повернення книги студентом шляхом проставлення `return_date`).
3. **DELETE:** Виконано безпечне видалення тестового запису з використанням речення `WHERE`.
4. **SELECT:** Виконано вибірку даних для перевірки результатів змін.

### Результати виконання 
