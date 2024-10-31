--https://datalemur.com/questions/teams-power-users
-- teams_power_user

select sender_id , count(message_id) as message_count 
FROM messages 
WHERE EXTRACT(YEAR from sent_date) = 2022 AND EXTRACT(month from sent_date)=08
GROUP BY sender_id 
ORDER BY message_count DESC
limit 2 