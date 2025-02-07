-- Insert Customers
INSERT INTO Customers (name, email) VALUES 
('John Doe', 'john@example.com'),
('Jane Smith', 'jane@example.com');

-- Insert Products
INSERT INTO Products (product_name, price) VALUES 
('Laptop', 999.99),
('Smartphone', 499.99);

-- Insert Orders
INSERT INTO Orders (customer_id, order_date) VALUES 
((SELECT customer_id FROM Customers WHERE name = 'John Doe'), '2023-01-01'),
((SELECT customer_id FROM Customers WHERE name = 'Jane Smith'), '2023-01-02');

-- Insert Order Items
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES 
((SELECT order_id FROM Orders WHERE customer_id = (SELECT customer_id FROM Customers WHERE name = 'John Doe')), 
 (SELECT product_id FROM Products WHERE product_name = 'Laptop'), 1),

((SELECT order_id FROM Orders WHERE customer_id = (SELECT customer_id FROM Customers WHERE name = 'John Doe')), 
 (SELECT product_id FROM Products WHERE product_name = 'Smartphone'), 2),

((SELECT order_id FROM Orders WHERE customer_id = (SELECT customer_id FROM Customers WHERE name = 'Jane Smith')), 
 (SELECT product_id FROM Products WHERE product_name = 'Laptop'), 3);

--Display the tables
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
