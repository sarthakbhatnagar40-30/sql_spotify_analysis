-- SQL project 

create table spotify (
	Artist text,
	Track text,
	Album text,
	Album_type varchar(20),
	Danceability numeric,
	Energy numeric,
	Loudness numeric,
	Speechiness numeric,
	Acousticness numeric,
	Instrumentalness numeric,
	Liveness numeric,
	Valence numeric,
	Tempo numeric,
	Duration_min numeric,
	Title text,
	Channel text,
	Views bigint, 
	Likes bigint, 
	Comments bigint, 
	Licensed varchar(20),
	official_video varchar(20),
	Stream bigint, 
	Energy_Liveness numeric, 
	most_played_on varchar(20)
);

select * from spotify;