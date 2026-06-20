DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    store_location VARCHAR(50),
    amount NUMERIC(10, 2)
);

INSERT INTO sales (store_location, amount) VALUES
    ('Manila', 1000),
    ('Manila', 1500),
    ('Cebu', 800),
    ('Cebu', 1200),
    ('Davao', 700);

SELECT
    store_location,
    SUM(amount) AS total_sales,
    COUNT(*) AS transaction_count
FROM sales
GROUP BY store_location
ORDER BY total_sales DESC;
