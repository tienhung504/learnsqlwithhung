WITH selected_users AS (select 
    user_id, client_id,
    SUM(CASE WHEN event_type IN ('video call received', 'video call sent', 'voice call received', 'voice call sent') THEN 1 ELSE 0 END) / CAST(COUNT(*) AS FLOAT) AS proportion
from fact_events
GROUP BY user_id
HAVING proportion >= 0.5)

SELECT client_id, COUNT(*) FROM selected_users
GROUP BY client_id
