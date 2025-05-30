WITH desktop_clients AS (
    select user_id, client_id from fact_events
    GROUP BY user_id
    HAVING COUNT(DISTINCT client_id) = 1
    AND client_id = 'desktop'),
    
no_of_such AS (SELECT 
    customer_id, 
    RANK() OVER (ORDER BY COUNT(*)) AS r
FROM fact_events
WHERE user_id IN (SELECT user_id FROM desktop_clients)
GROUP BY customer_id)

SELECT customer_id FROM no_of_such
WHERE r = 1