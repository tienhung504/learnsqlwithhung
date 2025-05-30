WITH order_totals AS (
    SELECT
        pm.name,
        SUM(CASE WHEN DATE(order_timestamp_utc) = '2019-03-11' THEN amount ELSE 0 END) AS march_amount,
        SUM(CASE WHEN DATE(order_timestamp_utc) = '2019-04-11' THEN amount ELSE 0 END) AS april_amount
    from postmates_orders po JOIN postmates_markets pm
    ON po.city_id = pm.id
    WHERE DATE(order_timestamp_utc) IN ('2019-03-11', '2019-04-11')
    GROUP BY po.city_id),

amount_diff AS(
    SELECT name, (april_amount - march_amount) AS amount_change
    FROM order_totals),

ranked AS (    
    SELECT 
        name,
        amount_change,
        RANK() OVER (ORDER BY amount_change DESC) AS growth_rank,
        RANK() OVER (ORDER BY amount_change ASC) AS drop_rank
    FROM amount_diff)
    
SELECT name, amount_change
FROM ranked WHERE growth_rank = 1 OR drop_rank = 1