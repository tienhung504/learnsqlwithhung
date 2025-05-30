WITH loyal_clients AS (
    select user_id, client_id from fact_events
    GROUP BY user_id
    HAVING COUNT(DISTINCT client_id) = 1)
    
SELECT client_id, COUNT(DISTINCT user_id) AS loyal_customer_number
FROM fact_events 
WHERE user_id IN (SELECT user_id FROM loyal_clients)