-- users_third_transaction
-- https://datalemur.com/questions/sql-third-transaction

-- obtain third transaction per user 
-- partition by user_id and order by transaction_date desc and row_number = 3

WITH user_transaction AS 
(
SELECT t.* ,
row_number() OVER(PARTITION BY user_id order by transaction_date ) as row_num
FROM transactions t
)

SELECT user_id , spend , transaction_date FROM user_transaction
where row_num = 3