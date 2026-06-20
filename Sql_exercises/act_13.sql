DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE NOT NULL
);

INSERT INTO customers VALUES
    (1, 'Ana Santos'),
    (2, 'Ben Cruz'),
    (3, 'Carlo Reyes');

INSERT INTO orders VALUES
    (101, 1, '2026-03-01'),
    (102, 2, '2026-03-02'),
    (103, 1, '2026-03-03');

SELECT
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY o.order_date;
