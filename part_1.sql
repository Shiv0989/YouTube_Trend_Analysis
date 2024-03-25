-- creating stage
CREATE OR REPLACE STAGE at13 
STORAGE_INTEGRATION = at12
URL='azure://shiv007.blob.core.windows.net/at1'
;
list @at13;

CREATE OR REPLACE FILE FORMAT file_format_csv --specifying the the file format
TYPE = 'CSV' 
FIELD_DELIMITER = ',' 
SKIP_HEADER = 1
NULL_IF = ('\\N', 'NULL', 'NUL', '')
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
;

-- proceeding by creating an external table for each country and then creating an internal table for each country respectively to transfer the  trending data

--for Canada
CREATE OR REPLACE EXTERNAL TABLE ext_table_youtube_trending_ca -- creating an external table for Canada
(
video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt varchar as (value:c3::varchar),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId varchar as (value:c6::varchar),    
trending_date varchar as (value:c7::varchar),     
view_count varchar as (value:c8::varchar),
likes varchar as (value:c9::varchar),
dislikes varchar as (value:c10::varchar),
comment_count varchar as (value:c11::varchar),
comments_disabled varchar as (value:c12::varchar)
)
WITH LOCATION = @at13
FILE_FORMAT = file_format_csv
PATTERN = 'CA_youtube_trending_data.csv';

SELECT * --to view the first 10 rows
FROM EXT_TABLE_YOUTUBE_TRENDING_CA
LIMIT 10;

--creating an internal table for canada
CREATE OR REPLACE TABLE table_youtube_trending_ca(
    video_id VARCHAR(100),
    title VARCHAR(100),
    publishedAt VARCHAR(100),
    channelId VARCHAR(100),
    channelTitle VARCHAR(100),
    categoryId VARCHAR(100),
    trending_date VARCHAR(100),
    view_count VARCHAR(100),
    likes VARCHAR(100),
    dislikes VARCHAR(100),
    comment_count VARCHAR(100),
    comments_disabled VARCHAR(100)
);

--inserting data from external table to internal table
INSERT INTO table_youtube_trending_ca
select video_id, TITLE, PUBLISHEDAT, CHANNELID, CHANNELTITLE,CATEGORYID, TRENDING_DATE, VIEW_COUNT, LIKES, DISLIKES, COMMENT_COUNT, COMMENTS_DISABLED from EXT_TABLE_YOUTUBE_TRENDING_CA;

-- adding a column for country to the final table
select * from table_youtube_trending_ca;
ALTER TABLE table_youtube_trending_ca
ADD column Country varchar default 'CA';

--for brazil
CREATE OR REPLACE EXTERNAL TABLE ext_table_youtube_trending_br-- creating an external table for Brazil
(
video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt varchar as (value:c3::varchar),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId varchar as (value:c6::varchar),    
trending_date varchar as (value:c7::varchar),     
view_count varchar as (value:c8::varchar),
likes varchar as (value:c9::varchar),
dislikes varchar as (value:c10::varchar),
comment_count varchar as (value:c11::varchar),
comments_disabled varchar as (value:c12::varchar)
)
WITH LOCATION = @at13
FILE_FORMAT = file_format_csv
PATTERN = 'BR_youtube_trending_data.csv';

SELECT * --to view the first 10 rows
FROM EXT_TABLE_YOUTUBE_TRENDING_BR
LIMIT 10;

--creating an internal table for Brazil
CREATE OR REPLACE TABLE table_youtube_trending_br(
    video_id VARCHAR(100),
    title VARCHAR(100),
    publishedAt VARCHAR(100),
    channelId VARCHAR(100),
    channelTitle VARCHAR(100),
    categoryId VARCHAR(100),
    trending_date VARCHAR(100),
    view_count VARCHAR(100),
    likes VARCHAR(100),
    dislikes VARCHAR(100),
    comment_count VARCHAR(100),
    comments_disabled VARCHAR(100)
);

--inserting data from external table to internal table
INSERT INTO table_youtube_trending_br
select video_id, TITLE, PUBLISHEDAT, CHANNELID, CHANNELTITLE,CATEGORYID, TRENDING_DATE, VIEW_COUNT, LIKES, DISLIKES, COMMENT_COUNT, COMMENTS_DISABLED from EXT_TABLE_YOUTUBE_TRENDING_BR
;


-- adding a column for country to the final table
select * from table_youtube_trending_br;
ALTER TABLE table_youtube_trending_br
ADD column Country varchar default 'BR';

--for Germany
CREATE OR REPLACE EXTERNAL TABLE ext_table_youtube_trending_de-- creating an external table for Germany
(
video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt varchar as (value:c3::varchar),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId varchar as (value:c6::varchar),    
trending_date varchar as (value:c7::varchar),     
view_count varchar as (value:c8::varchar),
likes varchar as (value:c9::varchar),
dislikes varchar as (value:c10::varchar),
comment_count varchar as (value:c11::varchar),
comments_disabled varchar as (value:c12::varchar)
)
WITH LOCATION = @at13
FILE_FORMAT = file_format_csv
PATTERN = 'DE_youtube_trending_data.csv';

--to view the first 10 rows
SELECT * 
FROM EXT_TABLE_YOUTUBE_TRENDING_DE
LIMIT 10;

--creating an internal table for Germany
CREATE OR REPLACE TABLE table_youtube_trending_de(
    video_id VARCHAR(100),
    title VARCHAR(100),
    publishedAt VARCHAR(100),
    channelId VARCHAR(100),
    channelTitle VARCHAR(100),
    categoryId VARCHAR(100),
    trending_date VARCHAR(100),
    view_count VARCHAR(100),
    likes VARCHAR(100),
    dislikes VARCHAR(100),
    comment_count VARCHAR(100),
    comments_disabled VARCHAR(100)
);

--inserting data from external table to internal table
INSERT INTO table_youtube_trending_de
select video_id, TITLE, PUBLISHEDAT, CHANNELID, CHANNELTITLE,CATEGORYID, TRENDING_DATE, VIEW_COUNT, LIKES, DISLIKES, COMMENT_COUNT, COMMENTS_DISABLED from EXT_TABLE_YOUTUBE_TRENDING_DE
;
-- adding a column for country to the final table
select * from table_youtube_trending_de;
ALTER TABLE table_youtube_trending_de
ADD column Country varchar default 'DE';

--for France
CREATE OR REPLACE EXTERNAL TABLE ext_table_youtube_trending_fr-- creating an external table for France
(
video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt varchar as (value:c3::varchar),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId varchar as (value:c6::varchar),    
trending_date varchar as (value:c7::varchar),     
view_count varchar as (value:c8::varchar),
likes varchar as (value:c9::varchar),
dislikes varchar as (value:c10::varchar),
comment_count varchar as (value:c11::varchar),
comments_disabled varchar as (value:c12::varchar)
)
WITH LOCATION = @at13
FILE_FORMAT = file_format_csv
PATTERN = 'FR_youtube_trending_data.csv';

--to view the first 10 rows
SELECT *
FROM EXT_TABLE_YOUTUBE_TRENDING_FR
LIMIT 10;

--creating an internal table for France
CREATE OR REPLACE TABLE table_youtube_trending_fr(
    video_id VARCHAR(100),
    title VARCHAR(100),
    publishedAt VARCHAR(100),
    channelId VARCHAR(100),
    channelTitle VARCHAR(100),
    categoryId VARCHAR(100),
    trending_date VARCHAR(100),
    view_count VARCHAR(100),
    likes VARCHAR(100),
    dislikes VARCHAR(100),
    comment_count VARCHAR(100),
    comments_disabled VARCHAR(100)
);

 --inserting data from external table to internal table
INSERT INTO table_youtube_trending_fr
select video_id, TITLE, PUBLISHEDAT, CHANNELID, CHANNELTITLE,CATEGORYID, TRENDING_DATE, VIEW_COUNT, LIKES, DISLIKES, COMMENT_COUNT, COMMENTS_DISABLED from EXT_TABLE_YOUTUBE_TRENDING_FR
;
-- adding a column for country to the final table
select * from table_youtube_trending_fr;
ALTER TABLE table_youtube_trending_fr
ADD column Country varchar default 'FR';

--for Great Britain
CREATE OR REPLACE EXTERNAL TABLE ext_table_youtube_trending_gb
(
video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt varchar as (value:c3::varchar),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId varchar as (value:c6::varchar),    
trending_date varchar as (value:c7::varchar),     
view_count varchar as (value:c8::varchar),
likes varchar as (value:c9::varchar),
dislikes varchar as (value:c10::varchar),
comment_count varchar as (value:c11::varchar),
comments_disabled varchar as (value:c12::varchar)
)
WITH LOCATION = @at13
FILE_FORMAT = file_format_csv
PATTERN = 'GB_youtube_trending_data.csv';


SELECT * 
FROM EXT_TABLE_YOUTUBE_TRENDING_GB
LIMIT 10;


CREATE OR REPLACE TABLE table_youtube_trending_gb(
    video_id VARCHAR(1000),
    title VARCHAR(1000),
    publishedAt VARCHAR(1000),
    channelId VARCHAR(1000),
    channelTitle VARCHAR(1000),
    categoryId VARCHAR(1000),
    trending_date VARCHAR(1000),
    view_count VARCHAR(1000),
    likes VARCHAR(1000),
    dislikes VARCHAR(1000),
    comment_count VARCHAR(1000),
    comments_disabled VARCHAR(1000)
);

INSERT INTO table_youtube_trending_gb
select video_id, TITLE, PUBLISHEDAT, CHANNELID, CHANNELTITLE,CATEGORYID, TRENDING_DATE, VIEW_COUNT, LIKES, DISLIKES, COMMENT_COUNT, COMMENTS_DISABLED from EXT_TABLE_YOUTUBE_TRENDING_GB
;



select * from table_youtube_trending_gb;
ALTER TABLE table_youtube_trending_gb
ADD column Country varchar default 'GB';


--for India
CREATE OR REPLACE EXTERNAL TABLE ext_table_youtube_trending_in
(
video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt varchar as (value:c3::varchar),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId varchar as (value:c6::varchar),    
trending_date varchar as (value:c7::varchar),     
view_count varchar as (value:c8::varchar),
likes varchar as (value:c9::varchar),
dislikes varchar as (value:c10::varchar),
comment_count varchar as (value:c11::varchar),
comments_disabled varchar as (value:c12::varchar)
)
WITH LOCATION = @at13
FILE_FORMAT = file_format_csv
PATTERN = 'IN_youtube_trending_data.csv';

SELECT * 
FROM EXT_TABLE_YOUTUBE_TRENDING_IN
LIMIT 10;
CREATE OR REPLACE TABLE table_youtube_trending_in(
    video_id VARCHAR(100),
    title VARCHAR(100),
    publishedAt VARCHAR(100),
    channelId VARCHAR(100),
    channelTitle VARCHAR(100),
    categoryId VARCHAR(100),
    trending_date VARCHAR(100),
    view_count VARCHAR(100),
    likes VARCHAR(100),
    dislikes VARCHAR(100),
    comment_count VARCHAR(100),
    comments_disabled VARCHAR(100)
);

INSERT INTO table_youtube_trending_in
select video_id, TITLE, PUBLISHEDAT, CHANNELID, CHANNELTITLE,CATEGORYID, TRENDING_DATE, VIEW_COUNT, LIKES, DISLIKES, COMMENT_COUNT, COMMENTS_DISABLED from EXT_TABLE_YOUTUBE_TRENDING_IN
;



select * from table_youtube_trending_in;
ALTER TABLE table_youtube_trending_in
ADD column Country varchar default 'IN';

--for Japan
CREATE OR REPLACE EXTERNAL TABLE ext_table_youtube_trending_jp
(
video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt varchar as (value:c3::varchar),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId varchar as (value:c6::varchar),    
trending_date varchar as (value:c7::varchar),     
view_count varchar as (value:c8::varchar),
likes varchar as (value:c9::varchar),
dislikes varchar as (value:c10::varchar),
comment_count varchar as (value:c11::varchar),
comments_disabled varchar as (value:c12::varchar)
)
WITH LOCATION = @at13
FILE_FORMAT = file_format_csv
PATTERN = 'JP_youtube_trending_data.csv';

SELECT * 
FROM EXT_TABLE_YOUTUBE_TRENDING_JP
LIMIT 10;
CREATE OR REPLACE TABLE table_youtube_trending_jp(
    video_id VARCHAR(100),
    title VARCHAR(100),
    publishedAt VARCHAR(100),
    channelId VARCHAR(100),
    channelTitle VARCHAR(100),
    categoryId VARCHAR(100),
    trending_date VARCHAR(100),
    view_count VARCHAR(100),
    likes VARCHAR(100),
    dislikes VARCHAR(100),
    comment_count VARCHAR(100),
    comments_disabled VARCHAR(100)
);

INSERT INTO table_youtube_trending_jp
select video_id, TITLE, PUBLISHEDAT, CHANNELID, CHANNELTITLE,CATEGORYID, TRENDING_DATE, VIEW_COUNT, LIKES, DISLIKES, COMMENT_COUNT, COMMENTS_DISABLED from EXT_TABLE_YOUTUBE_TRENDING_JP
;



select * from table_youtube_trending_jp;
ALTER TABLE table_youtube_trending_jp
ADD column Country varchar default 'JP';

--for Korea
CREATE OR REPLACE EXTERNAL TABLE ext_table_youtube_trending_kr
(
video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt varchar as (value:c3::varchar),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId varchar as (value:c6::varchar),    
trending_date varchar as (value:c7::varchar),     
view_count varchar as (value:c8::varchar),
likes varchar as (value:c9::varchar),
dislikes varchar as (value:c10::varchar),
comment_count varchar as (value:c11::varchar),
comments_disabled varchar as (value:c12::varchar)
)
WITH LOCATION = @at13
FILE_FORMAT = file_format_csv
PATTERN = 'KR_youtube_trending_data.csv';

SELECT * 
FROM EXT_TABLE_YOUTUBE_TRENDING_KR
LIMIT 10;
CREATE OR REPLACE TABLE table_youtube_trending_kr(
    video_id VARCHAR(100),
    title VARCHAR(100),
    publishedAt VARCHAR(100),
    channelId VARCHAR(100),
    channelTitle VARCHAR(100),
    categoryId VARCHAR(100),
    trending_date VARCHAR(100),
    view_count VARCHAR(100),
    likes VARCHAR(100),
    dislikes VARCHAR(100),
    comment_count VARCHAR(100),
    comments_disabled VARCHAR(100)
);

INSERT INTO table_youtube_trending_kr
select video_id, TITLE, PUBLISHEDAT, CHANNELID, CHANNELTITLE,CATEGORYID, TRENDING_DATE, VIEW_COUNT, LIKES, DISLIKES, COMMENT_COUNT, COMMENTS_DISABLED from EXT_TABLE_YOUTUBE_TRENDING_KR
;



select * from table_youtube_trending_kr;
ALTER TABLE table_youtube_trending_kr
ADD column Country varchar default 'KR';

--for Mexico
CREATE OR REPLACE EXTERNAL TABLE ext_table_youtube_trending_mx
(
video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt varchar as (value:c3::varchar),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId varchar as (value:c6::varchar),    
trending_date varchar as (value:c7::varchar),     
view_count varchar as (value:c8::varchar),
likes varchar as (value:c9::varchar),
dislikes varchar as (value:c10::varchar),
comment_count varchar as (value:c11::varchar),
comments_disabled varchar as (value:c12::varchar)
)
WITH LOCATION = @at13
FILE_FORMAT = file_format_csv
PATTERN = 'MX_youtube_trending_data.csv';

SELECT * 
FROM EXT_TABLE_YOUTUBE_TRENDING_MX
LIMIT 10;
CREATE OR REPLACE TABLE table_youtube_trending_mx(
    video_id VARCHAR(100),
    title VARCHAR(100),
    publishedAt VARCHAR(100),
    channelId VARCHAR(100),
    channelTitle VARCHAR(100),
    categoryId VARCHAR(100),
    trending_date VARCHAR(100),
    view_count VARCHAR(100),
    likes VARCHAR(100),
    dislikes VARCHAR(100),
    comment_count VARCHAR(100),
    comments_disabled VARCHAR(100)
);

INSERT INTO table_youtube_trending_mx
select video_id, TITLE, PUBLISHEDAT, CHANNELID, CHANNELTITLE,CATEGORYID, TRENDING_DATE, VIEW_COUNT, LIKES, DISLIKES, COMMENT_COUNT, COMMENTS_DISABLED from EXT_TABLE_YOUTUBE_TRENDING_MX
;



select * from table_youtube_trending_mx;
ALTER TABLE table_youtube_trending_mx
ADD column Country varchar default 'MX';

--for Russia
CREATE OR REPLACE EXTERNAL TABLE ext_table_youtube_trending_ru
(
video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt varchar as (value:c3::varchar),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId varchar as (value:c6::varchar),    
trending_date varchar as (value:c7::varchar),     
view_count varchar as (value:c8::varchar),
likes varchar as (value:c9::varchar),
dislikes varchar as (value:c10::varchar),
comment_count varchar as (value:c11::varchar),
comments_disabled varchar as (value:c12::varchar)
)
WITH LOCATION = @at13
FILE_FORMAT = file_format_csv
PATTERN = 'RU_youtube_trending_data.csv';

SELECT * 
FROM EXT_TABLE_YOUTUBE_TRENDING_RU
LIMIT 10;
CREATE OR REPLACE TABLE table_youtube_trending_ru(
    video_id VARCHAR(100),
    title VARCHAR(100),
    publishedAt VARCHAR(100),
    channelId VARCHAR(100),
    channelTitle VARCHAR(100),
    categoryId VARCHAR(100),
    trending_date VARCHAR(100),
    view_count VARCHAR(100),
    likes VARCHAR(100),
    dislikes VARCHAR(100),
    comment_count VARCHAR(100),
    comments_disabled VARCHAR(100)
);

INSERT INTO table_youtube_trending_ru
select video_id, TITLE, PUBLISHEDAT, CHANNELID, CHANNELTITLE,CATEGORYID, TRENDING_DATE, VIEW_COUNT, LIKES, DISLIKES, COMMENT_COUNT, COMMENTS_DISABLED from EXT_TABLE_YOUTUBE_TRENDING_RU
;



select * from table_youtube_trending_ru;
ALTER TABLE table_youtube_trending_ru
ADD column Country varchar default 'RU';

--for US
CREATE OR REPLACE EXTERNAL TABLE ext_table_youtube_trending_us
(
video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt varchar as (value:c3::varchar),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId varchar as (value:c6::varchar),    
trending_date varchar as (value:c7::varchar),     
view_count varchar as (value:c8::varchar),
likes varchar as (value:c9::varchar),
dislikes varchar as (value:c10::varchar),
comment_count varchar as (value:c11::varchar),
comments_disabled varchar as (value:c12::varchar)
)
WITH LOCATION = @at13
FILE_FORMAT = file_format_csv
PATTERN = 'US_youtube_trending_data.csv';

SELECT * 
FROM EXT_TABLE_YOUTUBE_TRENDING_US
LIMIT 10;
CREATE OR REPLACE TABLE table_youtube_trending_us(
    video_id VARCHAR(100),
    title VARCHAR(100),
    publishedAt VARCHAR(100),
    channelId VARCHAR(100),
    channelTitle VARCHAR(100),
    categoryId VARCHAR(100),
    trending_date VARCHAR(100),
    view_count VARCHAR(100),
    likes VARCHAR(100),
    dislikes VARCHAR(100),
    comment_count VARCHAR(100),
    comments_disabled VARCHAR(100)
);

INSERT INTO table_youtube_trending_us
select video_id, TITLE, PUBLISHEDAT, CHANNELID, CHANNELTITLE,CATEGORYID, TRENDING_DATE, VIEW_COUNT, LIKES, DISLIKES, COMMENT_COUNT, COMMENTS_DISABLED from EXT_TABLE_YOUTUBE_TRENDING_US
;

select * from table_youtube_trending_us;
ALTER TABLE table_youtube_trending_us
ADD column Country varchar default 'US';
----------------------------------------------------
--creating an internal table to insert the internal table of each country
CREATE OR REPLACE TABLE table_youtube_trending(
    video_id VARCHAR(1000),
    title VARCHAR(1000),
    publishedAt VARCHAR(1000),
    channelId VARCHAR(1000),
    channelTitle VARCHAR(1000),
    categoryId VARCHAR(1000),
    trending_date date,
    view_count VARCHAR(1000),
    likes VARCHAR(1000),
    dislikes VARCHAR(1000),
    comment_count VARCHAR(1000),
    comments_disabled VARCHAR(1000),
    country VARCHAR(100)
);

--Inserting all tables into table_youtube_trending
INSERT INTO table_youtube_trending
select * from table_youtube_trending_br;

INSERT INTO table_youtube_trending
select * from table_youtube_trending_ca;

INSERT INTO table_youtube_trending
select * from table_youtube_trending_de;

INSERT INTO table_youtube_trending
select * from table_youtube_trending_fr;

INSERT INTO table_youtube_trending
select * from table_youtube_trending_gb;

INSERT INTO table_youtube_trending
select * from table_youtube_trending_in;

INSERT INTO table_youtube_trending
select * from table_youtube_trending_jp;

INSERT INTO table_youtube_trending
select * from table_youtube_trending_kr;

INSERT INTO table_youtube_trending
select * from table_youtube_trending_mx;

INSERT INTO table_youtube_trending
select * from table_youtube_trending_ru;

INSERT INTO table_youtube_trending
select * from table_youtube_trending_us;

----------------------------------------------------------------
--loading the category data into external tables for each country

--for Brazil
CREATE OR REPLACE EXTERNAL TABLE ex_table_youtube_category_br
WITH LOCATION = @at13
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'BR_category_id.json';

CREATE OR REPLACE TABLE table_youtube_category_br as 
SELECT
    'BR' as Country,
    t0.value:"id"::varchar as categoryid,
    t0.value:snippet.title::varchar as category_title
from ex_table_youtube_category_br,
    lateral flatten(input => value:items, outer => true) t0;


--for Canada
CREATE OR REPLACE EXTERNAL TABLE ex_table_youtube_category_ca
WITH LOCATION = @at13
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'CA_category_id.json';

CREATE OR REPLACE TABLE table_youtube_category_ca as 
SELECT
    'CA' as Country,
    t0.value:"id"::varchar as categoryid,
    t0.value:snippet.title::varchar as category_title
from ex_table_youtube_category_ca,
    lateral flatten(input => value:items, outer => true) t0;

--for Germany

CREATE OR REPLACE EXTERNAL TABLE ex_table_youtube_category_de
WITH LOCATION = @at13
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'DE_category_id.json';

CREATE OR REPLACE TABLE table_youtube_category_de as 
SELECT
    'DE' as Country,
    t0.value:"id"::varchar as categoryid,
    t0.value:snippet.title::varchar as category_title
from ex_table_youtube_category_de,
    lateral flatten(input => value:items, outer => true) t0;
    
--for France
CREATE OR REPLACE EXTERNAL TABLE ex_table_youtube_category_fr
WITH LOCATION = @at13
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'FR_category_id.json';

CREATE OR REPLACE TABLE table_youtube_category_fr as 
SELECT
    'FR' as Country,
    t0.value:"id"::varchar as categoryid,
    t0.value:snippet.title::varchar as category_title
from ex_table_youtube_category_fr,
    lateral flatten(input => value:items, outer => true) t0;
    
--for Great Britain 
    
CREATE OR REPLACE EXTERNAL TABLE ex_table_youtube_category_gb
WITH LOCATION = @at13
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'GB_category_id.json';

CREATE OR REPLACE TABLE table_youtube_category_gb as 
SELECT
    'GB' as Country,
    t0.value:"id"::varchar as categoryid,
    t0.value:snippet.title::varchar as category_title
from ex_table_youtube_category_gb,
    lateral flatten(input => value:items, outer => true) t0;

--for India

CREATE OR REPLACE EXTERNAL TABLE ex_table_youtube_category_in
WITH LOCATION = @at13
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'IN_category_id.json';

CREATE OR REPLACE TABLE table_youtube_category_in as 
SELECT
    'IN' as Country,
    t0.value:"id"::varchar as categoryid,
    t0.value:snippet.title::varchar as category_title
from ex_table_youtube_category_in,
    lateral flatten(input => value:items, outer => true) t0;

--for Japan

CREATE OR REPLACE EXTERNAL TABLE ex_table_youtube_category_jp
WITH LOCATION = @at13
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'JP_category_id.json';

CREATE OR REPLACE TABLE table_youtube_category_jp as 
SELECT
    'JP' as Country,
    t0.value:"id"::varchar as categoryid,
    t0.value:snippet.title::varchar as category_title
from ex_table_youtube_category_jp,
    lateral flatten(input => value:items, outer => true) t0;
  
--for Korea

CREATE OR REPLACE EXTERNAL TABLE ex_table_youtube_category_kr
WITH LOCATION = @at13
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'KR_category_id.json';

CREATE OR REPLACE TABLE table_youtube_category_kr as 
SELECT
    'KR' as Country,
    t0.value:"id"::varchar as categoryid,
    t0.value:snippet.title::varchar as category_title
from ex_table_youtube_category_kr,
    lateral flatten(input => value:items, outer => true) t0;

--for Mexico

CREATE OR REPLACE EXTERNAL TABLE ex_table_youtube_category_mx
WITH LOCATION = @at13
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'MX_category_id.json';

CREATE OR REPLACE TABLE table_youtube_category_mx as 
SELECT
    'MX' as Country,
    t0.value:"id"::varchar as categoryid,
    t0.value:snippet.title::varchar as category_title
from ex_table_youtube_category_mx,
    lateral flatten(input => value:items, outer => true) t0;

--for Russia

CREATE OR REPLACE EXTERNAL TABLE ex_table_youtube_category_ru
WITH LOCATION = @at13
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'RU_category_id.json';

CREATE OR REPLACE TABLE table_youtube_category_ru as 
SELECT
    'RU' as Country,
    t0.value:"id"::varchar as categoryid,
    t0.value:snippet.title::varchar as category_title
from ex_table_youtube_category_ru,
    lateral flatten(input => value:items, outer => true) t0;

--for US
CREATE OR REPLACE EXTERNAL TABLE ex_table_youtube_category_us
WITH LOCATION = @at13
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'US_category_id.json';

CREATE OR REPLACE TABLE table_youtube_category_us as 
SELECT
    'US' as Country,
    t0.value:"id"::varchar as categoryid,
    t0.value:snippet.title::varchar as category_title
from ex_table_youtube_category_us,
    lateral flatten(input => value:items, outer => true) t0;

--creating an internal table to merge all category data from tables created above
CREATE OR REPLACE TABLE table_youtube_category(
    COUNTRY VARCHAR(1000),
    CATEGORYID VARCHAR(1000),
    CATEGORY_TITLE VARCHAR(1000)
);

--inserting the category data into table_youtube_category
INSERT INTO table_youtube_category
SELECT * FROM table_youtube_category_br;

INSERT INTO table_youtube_category
SELECT * FROM table_youtube_category_ca;

INSERT INTO table_youtube_category
SELECT * FROM table_youtube_category_de;

INSERT INTO table_youtube_category
SELECT * FROM table_youtube_category_fr;

INSERT INTO table_youtube_category
SELECT * FROM table_youtube_category_gb;

INSERT INTO table_youtube_category
SELECT * FROM table_youtube_category_in;

INSERT INTO table_youtube_category
SELECT * FROM table_youtube_category_jp;

INSERT INTO table_youtube_category
SELECT * FROM table_youtube_category_kr;

INSERT INTO table_youtube_category
SELECT * FROM table_youtube_category_mx;

INSERT INTO table_youtube_category
SELECT * FROM table_youtube_category_ru;

INSERT INTO table_youtube_category
SELECT * FROM table_youtube_category_us;

--creating table_youtube_final to merge both category data table and trending data table into it
CREATE OR REPLACE TABLE table_youtube_final as 
select uuid_string() as Id,
    l1.video_id,
    l1.title,
    l1.PUBLISHEDAT,
    l1.CHANNELID,
    l1.CHANNELTITLE,
    l1.CATEGORYID,
    l2.CATEGORY_TITLE,
    l1.trending_date,
    l1.view_count,
    l1.likes,
    l1.dislikes,
    l1.comment_count,
    l1.comments_disabled,
    l1.country
FROM table_youtube_trending l1 left outer join table_youtube_category l2 on (l1.COUNTRY = l2.COUNTRY and l1.CATEGORYID = l2.CATEGORYID);--using left outer join to merge the tables

--viewing the final table
select * from table_youtube_final;
-------------------------------------------

