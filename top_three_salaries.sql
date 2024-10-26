-- top_three_salaries
-- https://datalemur.com/questions/sql-top-three-salaries
 
-- highest earner = be in top 3 salaried employee
-- find these highest earner accorss all dept
-- select name,dept,salary
-- order employees alphabetically
-- use dense_rank
-- 

WITH highest_earner_employee AS 
(
select e.name , e.salary , d.department_name , 
dense_rank() OVER(PARTITION BY d.department_name order by e.salary DESC) as d_rnk
FROM employee e LEFT JOIN department d ON
e.department_id = d.department_id
 
)

SELECT department_name , name , salary 
FROM highest_earner_employee
WHERE d_rnk <4
ORDER BY department_name
 ;







 





-- better and interesting approach below
 