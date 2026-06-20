SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    c.customer_name
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.order_date BETWEEN DATE '2026-03-01'
                       AND DATE '2026-03-31'
ORDER BY o.order_date;