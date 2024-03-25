--part4
create or replace table table_youtube_frequency(
    country varchar(150),
    category_title varchar(150),
    title varchar(150),
    channeltitle varchar(150),
    view_count varchar(150),
    rk varchar(1)
);

insert into table_youtube_frequency
select country, category_title ,title, channeltitle, view_count, rk
from 
(select *,
rank() over (partition by country order by view_count DESC) as rk 
from table_youtube_final where category_title != 'Entertainment' and category_title != 'Music')
where rk<4
order by country, rk;

select * from table_youtube_frequency;

SELECT CATEGORY_TITLE, COUNT(category_title)AS Frequency
FROM table_youtube_frequency
GROUP BY category_title
ORDER BY
COUNT(category_title) DESC;
