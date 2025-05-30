select c.user_id, COUNT(*)
FROM rc_calls c
RIGHT JOIN rc_users u ON c.user_id = u.user_id
WHERE status = 'Free'
AND DATE_FORMAT(call_date, '%Y-%m') = '2020-04'
AND c.call_id IS NULL
