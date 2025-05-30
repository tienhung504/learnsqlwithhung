WITH selected_users AS (
    select user_id
    FROM twitch_sessions
    GROUP BY user_id
    HAVING 
        SUM(CASE WHEN session_type = 'streamer' THEN 1 ELSE 0 END) 
        > SUM(CASE WHEN session_type = 'viewer' THEN 1 ELSE 0 END)
)

SELECT user_id FROM twitch_sessions
WHERE user_id IN (SELECT user_id FROM selected_users)
GROUP BY user_id
ORDER BY COUNT(*) DESC
LIMIT 3;

-- CACH 2
WITH selected_users AS (
    select user_id
    FROM twitch_sessions
    GROUP BY user_id
    HAVING 
        SUM(CASE WHEN session_type = 'streamer' THEN 1 ELSE 0 END) 
        > SUM(CASE WHEN session_type = 'viewer' THEN 1 ELSE 0 END)
)

SELECT 
    user_id,
    SUM(TIMESTAMPDIFF(SECOND, session_start, session_end)) AS streaming_time
FROM twitch_sessions
WHERE user_id IN (SELECT user_id FROM selected_users)
GROUP BY user_id
ORDER BY 
streaming_time DESC
LIMIT 3