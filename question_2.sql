
SELECT month_name, year, sale_price*total_orders as revenue
FROM dim_date
JOIN dim_product
ON dim_date.date = dim_product.date_added
JOIN orders
ON dim_date.date = orders.order_date
WHERE year = 2022
ORDER BY revenue DESC
LIMIT 1;
