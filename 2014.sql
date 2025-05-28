WITH hourly_rank AS (
    SELECT 
        HOUR(order_timestamp_utc) AS peak_hour, 
        (COUNT(*) / COUNT(DISTINCT DATE_FORMAT(order_timestamp_utc, '%y-%m-%d'))) AS average_order_volume,
        RANK() OVER (ORDER BY (COUNT(*) / COUNT(DISTINCT DATE_FORMAT(order_timestamp_utc, '%y-%m-%d'))) DESC) AS rnk
    FROM postmates_orders
    GROUP BY peak_hour
)
SELECT peak_hour, average_order_volume
FROM hourly_rank
WHERE rnk = 1
ORDER BY average_order_volume DESC, peak_hour ASC;