--part3 q1
select country, title, channeltitle, view_count, rk
from 
(select *,
rank() over (partition by country order by view_count DESC) as rk 
from table_youtube_final where trending_date = '2021-10-17' and category_title = 'Sports')
where rk<4
order by country, rk;

