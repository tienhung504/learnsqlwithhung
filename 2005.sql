select 100 * (COUNT(DISTINCT user_id) / (SELECT COUNT(*) FROM fb_active_users))
from fb_active_users
WHERE status = 'open'
AND country = 'USA'

-- SELECT 100 * (COUNT(CASE WHEN status = 'open' AND country = 'USA' THEN 1 ELSE 0 END)) / COUNT(*)
-- FROM fb_active_users