WITH high_value_sales AS (
    SELECT
        id,
        store_location,
        amount
    FROM sales
    WHERE amount > 500
)
SELECT
    id,
    store_location,
    amount
FROM high_value_sales
ORDER BY amount DESC;