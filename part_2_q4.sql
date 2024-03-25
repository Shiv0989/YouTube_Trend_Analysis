--part 2 q4
UPDATE table_youtube_final 
SET category_title = 29
WHERE category_title is NULL;

select distinct(category_title)-- to check whether NULL category title has been replaced by 29 or not
from table_youtube_final;