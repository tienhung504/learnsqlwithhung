select p.name, AVG(amount)
FROM postmates_orders o
JOIN postmates_markets m ON o.city_id = m.id
JOIN postmates_partners p ON o.seller_id = p.id
WHERE m.name = 'Boston'
AND p.name LIKE '%pizza%'
GROUP BY p.name