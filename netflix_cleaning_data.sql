CREATE TABLE netflix
(
	show_id	VARCHAR(5),
	type    VARCHAR(10),
	title	VARCHAR(250),
	director VARCHAR(550),
	casts	VARCHAR(1050),
	country	VARCHAR(550),
	date_added	VARCHAR(55),
	release_year	INT,
	rating	VARCHAR(15),
	duration	VARCHAR(15),
	listed_in	VARCHAR(250),
	description VARCHAR(550)
);
Select * from netflix;
Select count(*) from netflix;
select distinct type from netflix;

--1. Count the number of Movies vs TV Shows
select type, count(*) as total_content from netflix
group by type

--2. Find the most common rating for movies and TV shows
select type, rating, count(*) from netflix
group by 1,2
order by 1,2 desc

--3. List all movies released in a specific year (e.g., 2020)
select * from netflix
where type = 'Movie' and release_year = 2020

--4. Find the top 10 countries with the most content on Netflix

select unnest (string_to_array(country, ',')) as new_count, count(show_id) as total_content from netflix
group by 1
order by 2 desc
limit 10

--5. Identify the longest movie
select  * from netflix
where type = 'Movie' and duration =(select max(duration) from netflix)


--6. Find all the movies/TV shows by director 'Rajiv Chilaka'!
select  * from netflix
where director ILIKE '%Rajiv Chilaka%'

