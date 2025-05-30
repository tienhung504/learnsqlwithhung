select 
    session_type,  
    AVG(TIMESTAMPDIFF(SECOND, session_start, session_end)) AS average_duration
from twitch_sessions
GROUP BY session_type;