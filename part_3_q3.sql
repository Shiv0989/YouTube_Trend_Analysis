--part3 q3
select country, year_month,title, channeltitle, view_count,round((likes/view_count)*100,2) as likes_ratio
from 
(select *,
rank() over (partition by year_month, country order by view_count DESC) as rk
from (
select *, date_trunc('MONTH', trending_date) as year_month
from table_youtube_final)
)
where rk=1
order by year_month,country;

