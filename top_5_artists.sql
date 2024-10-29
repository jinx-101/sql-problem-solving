-- top_5_artists
-- https://datalemur.com/questions/top-fans-rank
-- use rank to tie rank if rating / ranking is same 


WITH top_artists AS 
(
SELECT artist_name,COUNT(artist_name) as top_10_occurance,
dense_rank() over(ORDER BY COUNT(artist_name) DESC) AS artist_rank 
FROM artists a LEFT JOIN songs s
ON  a.artist_id = s.artist_id
INNER JOIN global_song_rank gs ON
s.song_id = gs.song_id 
WHERE gs.rank<11
GROUP BY artist_name
ORDER BY COUNT(artist_name) DESC
)

select artist_name, artist_rank 
from top_artists
WHERE artist_rank<6;