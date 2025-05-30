WITH call_count AS (
    SELECT 
        company_id,
        SUM(CASE WHEN DATE_FORMAT(call_date, '%y-%m') = '20-04' THEN 1 ELSE 0 END) AS april_calls,
        SUM(CASE WHEN DATE_FORMAT(call_date, '%y-%m') = '20-03' THEN 1 ELSE 0 END) AS march_calls
    FROM rc_calls c
    RIGHT JOIN rc_users u ON c.user_id = u.user_id
    GROUP BY company_id),

decline_in_calls AS (
    SELECT 
        company_id, 
        (march_calls - april_calls) AS decline
    FROM call_count)
    
SELECT * FROM decline_in_calls
ORDER BY decline DESC 
LIMIT 1
