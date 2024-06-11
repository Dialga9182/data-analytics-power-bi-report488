--CREATE VIEW question_4
--AS
SELECT dim_store.store_type, SUM(dim_product.cost_price*orders.product_quantity) as total_sales,
count(dim_product.cost_price*orders.product_quantity) * 100.0 / sum(count(dim_product.cost_price*orders.product_quantity)) over() as percentage_of_total_sales,
SUM(product_quantity) as count_of_orders
FROM dim_store
JOIN orders
ON dim_store.store_code = orders.store_code
JOIN dim_product
ON orders.product_code = dim_product.product_code
GROUP BY dim_store.store_type;

