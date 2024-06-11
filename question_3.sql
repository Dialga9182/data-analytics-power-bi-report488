SELECT  dim_store.store_type,
        dim_store.country_code,
        dim_date.year,
        ROUND(SUM(dim_product.cost_price*product_quantity)) as revenue
FROM orders
JOIN dim_product
ON orders.product_code = dim_product.product_code
JOIN dim_date
ON orders.order_date = dim_date.date
JOIN dim_store
ON orders.store_code = dim_store.store_code
WHERE dim_date.year = 2022 AND dim_store.country_code = 'DE'
GROUP BY store_type, dim_store.country_code, dim_date.year
ORDER BY revenue DESC;