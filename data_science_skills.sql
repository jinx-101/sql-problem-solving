

/*
SELECT c.candidate_id FROM candidates c 
WHERE c.skill  = 'Python' and c.skill = 'Tableau' and c.skill = 'PostgreSQL'
ORDER BY candidate_id ASC;
*/

WITH CTE AS 
(
SELECT c.candidate_id 
FROM candidates c 
where c.skill in ('Python','Tableau','PostgreSQL')

)
, 
GROUPED_CTE AS 
(
SELECT candidate_id , count(1)
FROM CTE 
GROUP BY candidate_id 
HAVING COUNT(1)=3
)

select candidate_id from GROUPED_CTE;



