-- 1. Monthly revenue and order count
SELECT strftime('%Y-%m', order_date) AS month,
       COUNT(*) AS orders,
       ROUND(SUM(revenue), 2) AS revenue,
       ROUND(AVG(revenue), 2) AS avg_order_value
FROM orders
GROUP BY month
ORDER BY month;

-- 2. Revenue by category
SELECT p.category,
       COUNT(o.order_id) AS orders,
       ROUND(SUM(o.revenue), 2) AS revenue,
       ROUND(AVG(o.revenue), 2) AS avg_order_value
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 3. Repeat customers
WITH customer_orders AS (
    SELECT customer_id, COUNT(*) AS order_count, SUM(revenue) AS revenue
    FROM orders
    GROUP BY customer_id
)
SELECT COUNT(*) AS total_customers,
       SUM(CASE WHEN order_count >= 2 THEN 1 ELSE 0 END) AS repeat_customers,
       ROUND(100.0 * SUM(CASE WHEN order_count >= 2 THEN 1 ELSE 0 END) / COUNT(*), 2) AS repeat_customer_rate_pct
FROM customer_orders;

-- 4. Top 20 customers by revenue
SELECT c.customer_id,
       c.country,
       c.segment,
       COUNT(o.order_id) AS orders,
       ROUND(SUM(o.revenue), 2) AS revenue,
       RANK() OVER (ORDER BY SUM(o.revenue) DESC) AS revenue_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.country, c.segment
ORDER BY revenue DESC
LIMIT 20;

-- 5. Country performance
SELECT c.country,
       COUNT(DISTINCT c.customer_id) AS customers,
       COUNT(o.order_id) AS orders,
       ROUND(SUM(o.revenue), 2) AS revenue,
       ROUND(SUM(o.revenue) / COUNT(DISTINCT c.customer_id), 2) AS revenue_per_customer
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY revenue DESC;
