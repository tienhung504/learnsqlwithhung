WITH rank_by_company AS (
    SELECT 
        company_id, COUNT(*) as noOfCalls,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
    FROM rc_calls c
    RIGHT JOIN rc_users u ON c.user_id = u.user_id
    GROUP BY company_id)
    
SELECT * FROM rank_by_company
WHERE ranking = 2