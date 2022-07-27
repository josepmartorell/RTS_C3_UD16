SET SQL_SAFE_UPDATES = 0;
USE `actividades`;

-- 4.1. Mostrar el nombre de todas las películas
select NOMBRE from peliculas;

-- 4.2. Mostrar las distintas calificaciones de edad que existen.
select distinct CALIFICACIONEDAD from peliculas;

-- 4.3. Mostrar todas las películas que no han sido calificadas.
select p.NOMBRE as PELÍCULA from peliculas as p where CALIFICACIONEDAD is null;

-- 4.4. Mostrar todas las salas que no proyectan ninguna película
select NOMBRE from salas where PELICULA is null;

-- 4.5. Mostrar la información de todas las salas y, si se proyecta alguna película en la sala, mostrar también la información de la película.
select * from salas join peliculas on peliculas.CODIGO = salas.PELICULA;

-- 4.6. Mostrar la información de todas las películas y, si se proyecta en alguna sala, mostrar también la información de la sala.
select * from peliculas left join salas on actividades.salas.PELICULA = actividades.peliculas.CODIGO;

-- 4.7. Mostrar los nombres de las películas que no se proyectan en ninguna sala
-- (funciona pero no muestra nada)
select peliculas.nombre from peliculas left join salas on salas.pelicula = peliculas.codigo where salas.pelicula is null;

-- 4.8. Añadir una nueva película 'Uno, Dos, Tres, para mayores de 7 años.
insert into `peliculas` values (10,'Uno, Dos, Tres','PG');

-- 4.9. Hacer constar que todas las películas no calificadas han sido calificadas 'no reco- mendables para menores de 13 años"
update peliculas set calificacionedad = 'PG-13' where calificacionedad is null;

-- 4.10. Eliminar todas las salas que proyectan películas recomendadas para todos los públicos.
delete s from salas as s inner join peliculas as p on s.pelicula = p.codigo where p.calificacionedad = 'G';