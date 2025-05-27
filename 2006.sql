select DAY(post_date) AS calendar_day, COUNT(*) 
from facebook_posts
GROUP BY calendar_day;