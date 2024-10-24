
WITH TWEETS_PER_USER AS 
(

SELECT USER_ID , COUNT(1) AS tweet_count
FROM tweets t    
WHERE EXTRACT( YEAR FROM tweet_date) = 2022
GROUP BY USER_ID

)

SELECT tweet_count AS tweet_bucket , count(user_id) as users_num
FROM TWEETS_PER_USER
GROUP BY tweet_count
ORDER BY tweet_bucket ;

