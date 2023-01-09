use rd_shows;
--Considerando únicamente la plataforma de Netflix, ¿qué actor aparece
--más veces?
select actors.actor,count(actors.actor) appearances,shows.platform
from actors
inner join shows on shows.show_id = actors.show_id 
where shows.platform = "netflix"
GROUP by actors.actor 
order by appearances desc
limit 1;
-- Top 10 de actores participantes considerando ambas plataformas en el
--año actual. Se aprecia flexibilidad.
select actors.actor,count(actors.actor) appearances,release_year
from actors
left join shows on shows.show_id = actors.show_id 
where release_year = "2021" 
GROUP by actors.actor 
order by appearances desc
limit 10;
--Crear un Stored Proceadure que tome como parámetro un año y
--devuelva una tabla con las 5 películas con mayor duración en minutos.
DELIMITER //

CREATE PROCEDURE peliculas_mas_larga(in year_in INT)
BEGIN
	select title, duration, duration_units, release_year
    from shows
    where type = "Movie" and release_year = year_in and duration_units = 'minutes'
    order by duration desc
    limit 5;
END //
DELIMITER ;
--Example of use.
call peliculas_mas_larga(2002) 