-- Solutions

-- 1. Retrieve the names of all tracks that have more than 1 billion streams.
select track 
from spotify
where stream > 1000000000;

-- 2. List all albums along with their respective artists.
select distinct album, artist
from spotify;

-- 3. Get the total number of comments for tracks where licensed = TRUE.
select sum(comments) as total_comments
from spotify
where licensed = 'TRUE';

-- 4. Find all tracks that belong to the album type single.
select track
from spotify
where album_type = 'single';

-- 5. Count the total number of tracks by each artist.
select 
	artist,
	count(*) as total_no_of_tracks
from spotify
group by artist
order by count(*);

-- 6. Calculate the average danceability of tracks in each album.
select 
	album,
	round(avg(danceability), 4)
from spotify
group by album
order by avg(danceability) desc;

-- 7. Find the top 5 tracks with the highest energy values.
select 
	track,
	max(energy)
from spotify
group by track
order by max(energy) desc
limit 5;

-- 8. List all tracks along with their views and likes where official_video = TRUE.
select 
	track, 
	sum(views) as total_views,
	sum(likes) as total_likes
from spotify 
where official_video = 'TRUE'
group by track
order by sum(likes) desc;

-- 9. For each album, calculate the total views of all associated tracks.
select 
	album,
	track,
	sum(views) as total_views
from spotify
group by album, track
order by sum(views) desc;

-- 10. Retrieve the track names that have been streamed on Spotify more than YouTube.
select * from 
(select 
	track,
	sum(case when most_played_on = 'Youtube' then stream end) as stream_on_youtube,
	sum(case when most_played_on = 'Spotify' then stream end) as stream_on_spotify
from spotify
group by track) as t1
where 
	stream_on_spotify > stream_on_youtube
	and 
	stream_on_youtube is not null
	and 
	stream_on_youtube != 0;

-- 11. Find the top 3 most-viewed tracks for each artist using window functions.
with t1 as (select 
	artist,
	track,
	sum(views) as total_views, 
	dense_rank() over(partition by artist order by sum(views) desc) as "rank"
from spotify
group by artist, track)

select *
from t1 
where "rank" <= 3;

-- 12. Write a query to find tracks where the liveness score is above the average.
select 
	artist,
	track, 
	liveness
from 
(select * , 
avg(liveness) over() as avg_liveness
from spotify)
where avg_liveness < liveness;

-- 13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
with t1 as (select 
	album,	
	max(energy) as highest_energy ,
	min(energy) as lowest_energy
from spotify
group by album)

select 
	album,
	highest_energy - lowest_energy as energy_difference
from t1	
order by energy_difference desc;

-- 14. Find tracks where the energy-to-liveness ratio is greater than 1.2.
select 
	track,
	energy/nullif(liveness, 0) as energy_to_liveness_ratio
from spotify
where energy/nullif(liveness,0) >= 1.2;

-- 15. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions
select 
	track,
	likes,
	views,
	sum(likes) over (partition by track order by views desc) as cummulative_sum_of_likes_for_each_track
from spotify
order by views desc;

-- Query Optimization 

-- Before Indexing: 
-- Planning Time: 0.093 and Execution Time: 5.613 ms 

-- Creating Index:
create index artist_index on spotify (artist);

-- After Indexing:
-- Planning Time: 0.130 ms and Execution Time: 0.079 ms
explain analyze 
select 
	artist,	
	track, 
	views
from spotify
where
	artist = 'Gorillaz'
	and 
	most_played_on = 'Youtube'
order by stream desc
limit 25;

