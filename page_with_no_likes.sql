-- page_with_no_likes
-- https://datalemur.com/questions/sql-page-with-no-likes

 
SELECT p.page_id
FROM pages p LEFT JOIN page_likes pl 
ON p.page_id = pl.page_id
WHERE pl.user_id IS NULL 
ORDER BY p.page_id ;
 


-- better and interesting approach below
/*

This problem screams EXCEPT to me!

SELECT page_id FROM pages
except 
SELECT page_id FROM page_likes GROUP BY page_id ;


(Nice solution! I would have added a group by because in case of big records in page_likes the code would be affected by the multiple check between same ids, so in a real scenario i would suggest to add this :))
*/