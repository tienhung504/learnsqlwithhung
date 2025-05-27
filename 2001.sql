select rate_type, loan_id, balance, 
balance / SUM(balance) OVER (PARTITION BY rate_type) AS percentage
from submissions;
ORDER BY rate_type, loan_id