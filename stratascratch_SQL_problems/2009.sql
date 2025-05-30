select user_id from twitch_sessions
GROUP BY user_id
HAVING 
SUM(CASE WHEN session_type = 'streamer' THEN 1 ELSE 0 END) > 0 
AND SUM(CASE WHEN session_type = 'viewer' THEN 1 ELSE 0 END) > 0;