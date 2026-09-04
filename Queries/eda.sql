-- EDA
select * from spotify;
select count(*) from spotify;
select count(distinct artist) from spotify;
select count(distinct track) from spotify;
select count(distinct album) from spotify;
select distinct album_type from spotify;
select max(duration_min) from spotify;
select min(duration_min) from spotify;

select *
from spotify
where duration_min = 0;

delete from spotify
where duration_min = 0;

select *
from spotify
where duration_min = 0;

select count(distinct channel) from spotify;
select distinct most_played_on from spotify;

