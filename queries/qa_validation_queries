-- Check for null customer references
SELECT COUNT(*) AS null_customer_ids
FROM orders
WHERE customer_id IS NULL;

-- Detect duplicate customer records
SELECT customer_id, COUNT(*) AS record_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Find orphan orders (orders without valid customers)
SELECT o.order_id
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Check for invalid quantities or prices
SELECT *
FROM order_items
WHERE quantity <= 0
   OR item_price <= 0;
