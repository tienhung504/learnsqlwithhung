select loan_id, 
CASE WHEN rate_type = "fixed" THEN 1 ELSE 0 END AS fixed,
CASE WHEN rate_type = "variable" THEN 0 ELSE 1 END as variable
FROM submissions;