select 
    DATE_FORMAT(time_id, '%y-%m') AS months,
    customer_id,
    COUNT(DISTINCT user_id)
from fact_events
GROUP BY months, customer_id