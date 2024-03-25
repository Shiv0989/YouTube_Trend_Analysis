--part3 q2
select country, count(distinct title) CT from table_youtube_final
WHERE title LIKE '%BTS%'
group by country
order by ct desc;

