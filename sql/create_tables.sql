DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    signup_date DATE,
    country TEXT,
    segment TEXT
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    category TEXT,
    price REAL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    order_date DATE,
    quantity INTEGER,
    revenue REAL,
    discount REAL,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);
