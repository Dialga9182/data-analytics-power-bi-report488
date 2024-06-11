SELECT category, SUM(Profit) as Profit
FROM (SELECT dim_product.category,
        (dim_product.sale_price - dim_product.cost_price) * orders.total_orders as Profit,
        dim_store.full_region,
        dim_date.year
FROM orders
JOIN dim_product
ON orders.product_code = dim_product.product_code
JOIN dim_store
ON orders.store_code = dim_store.store_code
JOIN dim_date
ON orders.order_date = dim_date.date) as sub_query
WHERE year = '2021' AND full_region = 'Wiltshire, UK'
GROUP BY category, full_region, year
ORDER BY Profit DESC
LIMIT 1;
