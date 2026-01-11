-- Rank customers by total spending
SELECT
    customer_id,
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM (
    SELECT
        c.customer_id,
        SUM(oi.quantity * oi.item_price) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id
) t;

-- Running total revenue by order date
SELECT
    order_date,
    SUM(daily_revenue) OVER (ORDER BY order_date) AS running_total_revenue
FROM (
    SELECT
        o.order_date,
        SUM(oi.quantity * oi.item_price) AS daily_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.order_date
) t;
