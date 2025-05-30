WITH first_session AS (
SELECT user_id, MIN(session_start) as session_start
FROM twitch_sessions
GROUP BY user_id),

first_viewer_session AS (
SELECT * FROM twitch_sessions
WHERE (user_id, session_start) IN (SELECT user_id, session_start FROM first_session)
AND session_type = 'viewer')

SELECT user_id, COUNT(*) AS no_of_streamer_sessions FROM twitch_sessions
WHERE session_type = 'streamer'
AND user_id IN (SELECT user_id FROM first_viewer_session)
GROUP BY user_id
ORDER BY user_id

-- CACH 2
with s as 
(select user_id, session_type,
rank() over(partition by user_id order by session_start) as r
from twitch_sessions)

select user_id, count(*) as tong_so
from twitch_sessions
where (user_id) in (select user_id from s
where r = 1 and session_type = 'viewer')
and session_type = 'streamer'
group by user_id
ORDER BY tong_so DESC, user_id ASC;