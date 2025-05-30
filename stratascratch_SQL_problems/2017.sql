select COUNT(*)
FROM rc_calls c
JOIN rc_users u ON c.user_id = u.user_id
WHERE status = 'Paid'
AND DATE_FORMAT(call_date, '%Y-%m') = '2020-04'