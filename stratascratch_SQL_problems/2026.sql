WITH ranking AS (select customer_id, COUNT(*) AS counting,
    DENSE_RANK() OVER (ORDER BY COUNT(*)) AS r
from fact_events
WHERE client_id = 'mobile'
GROUP BY customer_id)

SELECT customer_id, counting 
FROM ranking WHERE r <= 2