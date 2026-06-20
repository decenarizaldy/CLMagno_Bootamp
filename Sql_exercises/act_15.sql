WITH location_revenue AS (
    SELECT
        store_location,
        SUM(amount) AS total_revenue
    FROM sales
    GROUP BY store_location
),
ranked_locations AS (
    SELECT
        store_location,
        total_revenue,
        ROW_NUMBER() OVER (
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM location_revenue
)
SELECT
    store_location,
    total_revenue,
    revenue_rank
FROM ranked_locations
WHERE revenue_rank <= 10
ORDER BY revenue_rank;