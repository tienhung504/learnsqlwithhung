select user_id, SUM(number_of_comments) as comment_received
from fb_comments_count
WHERE DATEDIFF(created_at, '2020-02-10') <= 30
GROUP BY user_id
HAVING comment_received > 0;