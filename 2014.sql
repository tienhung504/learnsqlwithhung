select 
    HOUR(order_timestamp_utc) as peak_hour, 
    (COUNT(*) / COUNT(DISTINCT DATE_FORMAT(order_timestamp_utc, '%y-%m-%d'))) AS average_order_volume
from postmates_orders
GROUP BY peak_hour
ORDER BY average_order_volume DESC
