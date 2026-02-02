SELECT * FROM retail.concert_tours;

select
      count(*) as total_rows,
      sum(actual_gross is null) as null_actual_gross
from retail.concert_tours;

select artist , tour_title ,count(*)
from retail.concert_tours
group by artist,tour_title
having count(*) > 1;

select min(actual_gross),
       max(actual_gross)
from retail.concert_tours;

SELECT artist, SUM(ifNULL(actual_gross, 0)) AS total_gross
FROM retail.concert_tours
GROUP BY artist
ORDER BY total_gross DESC
LIMIT 1;

select artist,
	   tour_title,
       ROUND(actual_gross / shows) as avg_gr_per_shor
from retail.concert_tours;

select artist,start_year, end_year
from retail.concert_tours
where end_year > start_year;

select start_year, count(*) as total_tours
from retail.concert_tours
group by start_year
order by total_tours
limit 1;

SELECT 
    artist,
    tour_title,
    start_year,
    actual_gross,
    RANK() OVER (PARTITION BY start_year ORDER BY actual_gross DESC) AS year_rank
FROM retail.concert_tours
order by year_rank desc;

SELECT artist, SUM(shows) AS total_shows
FROM retail.concert_tours
GROUP BY artist
ORDER BY total_shows DESC
LIMIT 1;

