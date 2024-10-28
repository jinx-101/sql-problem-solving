-- highest-grossing-items
--https://datalemur.com/questions/sql-highest-grossing

-- top 2 highest grossing products within each category
-- in the year 2022



WITH category_product_wise_spend 
AS 
(
SELECT CATEGORY , PRODUCT , SUM(SPEND) AS TOTAL_SPEND ,
dense_rank() OVER (PARTITION BY category ORDER BY SUM(SPEND) DESC) as d_rnk
FROM product_spend 
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY CATEGORY , PRODUCT
)
 

select CATEGORY , PRODUCT ,  TOTAL_SPEND  from category_product_wise_spend
WHERE d_rnk <3;


