-- 
-- https://datalemur.com/questions/laptop-mobile-viewership
 

/*
WITH CTE AS 
(
SELECT v.* ,'1',
CASE 
WHEN device_type IN ('tablet','phone') THEN 'mobile_views'
WHEN device_type IN ('laptop') THEN 'laptop_views'
ELSE 'N/A'
END AS view_type
FROM viewership v 
)

select view_type , count(1)
from cte 
group by view_type
*/


-- here approach is to look at output , they clearly want 2 more colums as laptop_views and mobile_views 
-- one case statement generates 1 column hence we will have to write 2 case statements here 


SELECT 
SUM(CASE WHEN device_type = 'laptop' then 1 else 0 END) AS laptop_views,
SUM(CASE WHEN device_type IN ('phone','tablet') then 1 else 0 END) AS mobile_views
FROM viewership

 





-- better and interesting approach below
 