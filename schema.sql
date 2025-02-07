CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    join_date DATE DEFAULT GETDATE()
);

CREATE TABLE Products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0) NOT NULL
);

CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id) ON DELETE CASCADE,
    order_date DATE DEFAULT GETDATE()
);

CREATE TABLE Order_Items (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT FOREIGN KEY REFERENCES Orders(order_id) ON DELETE CASCADE,
    product_id INT FOREIGN KEY REFERENCES Products(product_id) ON DELETE CASCADE,
    quantity INT CHECK (quantity >= 1) NOT NULL
);

--Display the schema
DESCRIBE Customers;
DESCRIBE Products;
DESCRIBE Orders;
DESCRIBE Order_Items;
