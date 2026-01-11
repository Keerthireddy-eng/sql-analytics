-- Total revenue by country
SELECT
    c.country,
    SUM(oi.quantity * oi.item_price) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.country
ORDER BY total_revenue DESC;

-- Top 5 customers by total spend
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.item_price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 5;
