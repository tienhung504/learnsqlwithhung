select 
    HOUR(order_timestamp_utc) as peak_hour, 
    RANK() OVER (ORDER BY (COUNT(*) / COUNT(DISTINCT DATE_FORMAT(order_timestamp_utc, '%y-%m-%d'))) DESC) AS rnk
from postmates_orders
GROUP BY peak_hour