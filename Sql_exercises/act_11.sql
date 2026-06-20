DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL CHECK (price >= 0)
);

INSERT INTO products (name, price) VALUES
    ('Keyboard', 1200.00),
    ('Mouse', 650.00),
    ('Monitor', 7500.00);

SELECT * FROM products;
