-- List all customers sorted by join_date (newest first)
SELECT * FROM Customers ORDER BY join_date DESC;

-- Find all orders placed in January 2023
SELECT * FROM Orders WHERE order_date BETWEEN '2023-01-01' AND '2023-01-31';

-- Calculate total revenue from all orders
SELECT SUM(oi.quantity * p.price) AS total_revenue 
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id;

-- Show all orders with customer names and order dates
SELECT o.order_id, c.name, o.order_date 
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

-- List products that have never been ordered
SELECT * FROM Products 
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items);

-- Find the top-spending customer (Fixing LIMIT issue)
SELECT TOP 1 c.name, SUM(oi.quantity * p.price) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- Update the price of "Laptop" to 899.99
UPDATE Products SET price = 899.99 WHERE product_name = 'Laptop';

-- Delete all orders placed before 2023-01-02
DELETE FROM Orders WHERE order_date < '2023-01-02';

-- Add a new product "Headphones" priced at 149.99
INSERT INTO Products (product_name, price) VALUES ('Headphones', 149.99);

-- Calculate the average order value per customer
SELECT c.name, AVG(oi.quantity * p.price) AS avg_order_value
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.name;

-- Find products ordered more than 2 times in total
SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(oi.quantity) > 2;

-- Bonus: Create an index to optimize querying orders by customer_id
CREATE INDEX idx_orders_customer ON Orders(customer_id);
