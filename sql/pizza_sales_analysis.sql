SELECT * FROM sales_db.pizza_sales_clean;

SELECT CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_revenue
FROM sales_db.pizza_sales_clean;

SELECT CAST((SUM(total_price)/COUNT(DISTINCT order_id)) AS DECIMAL(10,2)) AS Avg_order_value
FROM sales_db.pizza_sales_clean;

SELECT SUM(quantity) AS Toatal_Pizza_Sold
FROM sales_db.pizza_sales_clean;

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM sales_db.pizza_sales_clean;

SELECT CAST(
    CAST(SUM(quantity) AS DECIMAL(10,2)) /
    CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2))
    AS DECIMAL(10,2)
) AS Avg_pizza_per_order
FROM sales_db.pizza_sales_clean;

SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM sales_db.pizza_sales_clean
GROUP BY DAYNAME(order_date)
ORDER BY total_orders;

SELECT MONTHNAME(order_date) AS month_name, COUNT(DISTINCT order_id) AS total_orders
FROM sales_db.pizza_sales_clean
GROUP BY MONTHNAME(order_date);

SELECT
    pizza_category,
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
    CAST(
        SUM(total_price) * 100 /
        (SELECT SUM(total_price) FROM sales_db.pizza_sales_clean)
        AS DECIMAL(10,2)
    ) AS PCT
FROM sales_db.pizza_sales_clean
GROUP BY pizza_category;

SELECT
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
    CAST(
        SUM(total_price) * 100 /
        (SELECT SUM(total_price) FROM sales_db.pizza_sales_clean)
        AS DECIMAL(10,2)
    ) AS PCT
FROM sales_db.pizza_sales_clean
GROUP BY pizza_size
ORDER BY pizza_size;

SELECT pizza_category, SUM(quantity) AS total_quantity_sold
FROM sales_db.pizza_sales_clean
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY total_quantity_sold DESC;

SELECT pizza_name AS top_5_pizza, SUM(total_price) AS total_revenue
FROM sales_db.pizza_sales_clean
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

SELECT pizza_name AS bottom_5_pizza, SUM(total_price) AS total_revenue
FROM sales_db.pizza_sales_clean
GROUP BY pizza_name
ORDER BY total_revenue
LIMIT 5;

SELECT pizza_name AS top_5_by_order, COUNT(DISTINCT order_id) AS total_orders
FROM sales_db.pizza_sales_clean
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;

SELECT pizza_name AS bottom_5_by_order, COUNT(DISTINCT order_id) AS total_orders
FROM sales_db.pizza_sales_clean
GROUP BY pizza_name
ORDER BY total_orders
LIMIT 5;

SELECT pizza_name AS top_5_by_order, SUM(quantity) AS total_pizza_sold
FROM sales_db.pizza_sales_clean
GROUP BY pizza_name
ORDER BY total_pizza_sold DESC
LIMIT 5;

SELECT pizza_name AS bottom_5_by_order, SUM(quantity) AS total_pizza_sold
FROM sales_db.pizza_sales_clean
GROUP BY pizza_name
ORDER BY total_pizza_sold
LIMIT 5;
