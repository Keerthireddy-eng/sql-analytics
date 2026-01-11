-- Total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Orders placed in the last 30 days
SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';

-- Revenue per order
SELECT
    o.order_id,
    SUM(oi.quantity * oi.item_price) AS order_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id;
