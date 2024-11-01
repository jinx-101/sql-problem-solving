
-- https://datalemur.com/questions/sql-avg-review-ratings
-- month as a numerical value, product ID, and average star rating rounded to two decimal places


SELECT EXTRACT(MONTH FROM submit_date) as mth , product_id as product , ROUND(AVG(stars),2) as avg_stars
FROM reviews 
GROUP BY product_id,EXTRACT(MONTH FROM submit_date) 
ORDER BY mth , product
