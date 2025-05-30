SELECT user_id FROM loans
GROUP BY user_id
HAVING 
SUM(CASE WHEN type = 'Refinance' THEN 1 ELSE 0 END) >= 1
AND SUM(CASE WHEN type = 'InSchool' THEN 1 ELSE 0 END) >= 1;

-- CACH 2
SELECT DISTINCT user_id FROM loans
WHERE type = 'Refinance'
INTERSECT
SELECT DISTINCT user_id FROM loans
WHERE type = 'InSchool'