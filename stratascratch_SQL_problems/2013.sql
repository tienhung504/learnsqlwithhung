select 
    COUNT(DISTINCT customer_id) AS no_of_customer,
    AVG(amount) AS average_amount
from postmates_orders;