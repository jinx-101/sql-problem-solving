-- https://datalemur.com/questions/yoy-growth-rate
-- CALCULATE YEAR WISE SPEND FOR EACH PRODUCT_ID 
--Y-on-Y Growth Rate

WITH yearly_product_wise_total_spend AS 
(
SELECT EXTRACT(year FROM transaction_date) AS year , product_id , SUM(spend) AS curr_year_spend,
LAG(SUM(spend)) OVER(PARTITION BY product_id  ORDER BY EXTRACT(year FROM transaction_date)) as prev_year_spend
FROM user_transactions 
GROUP BY EXTRACT(year FROM transaction_date) , product_id 
)
,
yoy_growth as 
(
SELECT * , 
ROUND((curr_year_spend - prev_year_spend)*100.00 / prev_year_spend,2)  as yoy_rate
FROM yearly_product_wise_total_spend
)


SELECT * FROM yoy_growth 
ORDER BY product_id



