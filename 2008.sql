WITH one_stop AS 
(select a.origin, b.destination, (a.cost + b.cost) AS cost
from da_flights a JOIN da_flights b
ON a.destination = b.origin),

two_stops AS (
SELECT c.origin, d.destination, (c.cost + d.cost) AS cost
FROM one_stop c JOIN da_flights d
ON c.destination = d.origin),

merged_flights AS (
SELECT origin, destination, cost FROM one_stop
UNION SELECT origin, destination, cost FROM two_stops
UNION SELECT origin, destination, cost FROM da_flights
)

SELECT origin, destination, MIN(cost) FROM merged_flights
GROUP BY origin, destination
ORDER BY origin, destination;