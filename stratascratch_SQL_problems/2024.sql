select 
    DATE_FORMAT(time_id, '%y-%m') AS months,
    client_id,
    COUNT(DISTINCT user_id)
from fact_events
GROUP BY months, client_id