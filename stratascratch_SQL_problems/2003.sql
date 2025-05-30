WITH most_recent AS (
    SELECT user_id, MAX(created_at) AS latest_date
    FROM loans
    WHERE type = 'Refinance'
    GROUP BY user_id
)

SELECT 
    l.user_id, 
    SUM(s.balance) AS total_balance
FROM loans l
JOIN submissions s ON l.id = s.loan_id
JOIN most_recent mr 
    ON l.user_id = mr.user_id AND l.created_at = mr.latest_date
GROUP BY l.user_id;
