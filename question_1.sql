SELECT country_code, SUM(staff_numbers) FROM dim_store
GROUP BY country_code