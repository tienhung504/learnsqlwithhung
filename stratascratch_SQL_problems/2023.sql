WITH 3calls AS (select request_id, COUNT(*) AS noOfCalls from redfin_call_tracking
WHERE HOUR(created_on) BETWEEN 15 AND 18
GROUP BY request_id
HAVING noOfCalls >= 3)

SELECT COUNT(*) AS noOfCustomer FROM 3calls 