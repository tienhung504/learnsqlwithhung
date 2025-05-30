WITH ranked AS (SELECT 
    user_id, MONTH(time_id) AS months,
    RANK() OVER (PARTITION BY user_id ORDER BY time_id ASC) AS r
FROM fact_events),

firstinmonth AS (SELECT user_id, months, MIN(r) AS ranks
    FROM ranked
    GROUP BY user_id, months
    )
    
SELECT 
    months,
    SUM(CASE WHEN ranks = 1 THEN 1 ELSE 0 END) / COUNT(*) AS first_time,
    SUM(CASE WHEN ranks != 1 THEN 1 ELSE 0 END) / COUNT(*) AS existing
FROM firstinmonth
GROUP BY months