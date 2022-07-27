USE `actividades`;

-- 41. Mostrar el nombre de todas las películas
select NOMBRE from peliculas;

-- 42. Mostrar las distintas calificaciones de edad que existen.
select distinct CALIFICACIONEDAD from peliculas;

-- 43. Mostrar todas las películas que no han sido calificadas.
select p.NOMBRE as PELÍCULA from peliculas as p where CALIFICACIONEDAD is null;

-- 44. Mostrar todas las salas que no proyectan ninguna película
select NOMBRE from salas where PELICULA is null;

-- 45. Mostrar la información de todas las salas y, si se proyecta alguna película en la sala, mostrar también la información de la película.

-- 4.6. Mostrar la información de todas las películas y, si se proyecta en alguna sala, mostrar también la información de la sala.

-- 4.7. Mostrar los nombres de las películas que no se proyectan en ninguna sala.

-- 4.8. Añadir una nueva película 'Uno, Dos, Tres, para mayores de 7 años.

-- 4.9. Hacer constar que todas las películas no calificadas han sido calificadas 'no reco- mendables para menores de 13 años"

-- 4.10. Eliminar todas las salas que proyectan películas recomendadas para todos los públicos.
