-- 
-- https://datalemur.com/questions/tesla-unfinished-parts

 
SELECT p.part , p.assembly_step from parts_assembly p   
where p.finish_date IS NULL 
 


-- better and interesting approach below
 