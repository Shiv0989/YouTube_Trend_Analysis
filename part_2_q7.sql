--part2 q7

CREATE OR REPLACE TABLE table_youtube_duplicates as 
select a.id, a.VIDEO_ID,a.TRENDING_DATE, a.COUNTRY, a.RowNumber
from 
(select ID, VIDEO_ID,TRENDING_DATE,COUNTRY
 ,ROW_NUMBER() over (partition by VIDEO_ID,TRENDING_DATE,COUNTRY
 order by VIEW_COUNT desc) RowNumber 
from table_youtube_final) a
where RowNUmber>1;

select * from table_youtube_duplicates;
