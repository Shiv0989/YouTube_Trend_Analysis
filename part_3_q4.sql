--part3 q4
select distinct country,category_title, total_category_video, total_country_video ,round((total_category_video/total_country_video)*100,2) as percentage
from
(select *, rank() over (partition by country order by total_category_video DESC) as rk
from
(select *, count(distinct video_id) over (partition by category_title, country) as total_category_video, COUNT (distinct video_id) over(partition by country) as total_country_video
from table_youtube_final))
where rk =1
order by category_title, country;



