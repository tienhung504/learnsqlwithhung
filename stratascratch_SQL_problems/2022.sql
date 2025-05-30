WITH initial_calls AS (
    SELECT request_id, call_duration,
    ROW_NUMBER() OVER (PARTITION BY request_id ORDER BY created_on) AS rn
    FROM redfin_call_tracking)
    
SELECT AVG(call_duration) FROM initial_calls
WHERE rn != 1