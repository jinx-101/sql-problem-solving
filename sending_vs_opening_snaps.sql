-- GOOD QUESTION
-- sending_vs_opening_snaps
-- https://datalemur.com/questions/time-spent-snaps

/*
Learnings from this question :- 

1) we can filter out irrelevant data at the time of performing joins using WHERE
2) always have a look at the output how they want the data , columnar or rowwise
3) Here they want data colunnar wise , i.e send_time and open_time should be in columns 
4) in our dataset after join , send_time and open_time are in rows in activity_type column
5) hence we made use of case statements to generate 2 more columns from the row data 
6) also to aggregate the data on basis of age_bucket we added a SUM() function as well
7) also we are multiplying by 100.0 first in order to avoid 0 in percentages.
*/

WITH CTE AS 
(
SELECT ab.age_bucket,
SUM(CASE
WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0
END )AS total_open_time,
SUM(CASE
WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0
END) AS total_send_time
FROM activities a RIGHT JOIN age_breakdown ab 
ON a.user_id = ab.user_id
WHERE a.activity_type != 'chat'
GROUP BY ab.age_bucket
)

SELECT age_bucket , 
ROUND(total_send_time * 100.0 / (total_open_time + total_send_time),2) as send_perc,
ROUND(total_open_time * 100.0 / (total_open_time + total_send_time),2) as open_perc
from CTE ;

