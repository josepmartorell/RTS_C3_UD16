USE `actividades`;

-- 1.1. Obtener los nombres de los productos de la tienda.
select NOMBRE from articulos;

-- 1.2. Obtener los nombres y los precios de los productos de la tienda.
 select a.NOMBRE, a.PRECIO from articulos as a;
 
-- 1.3. Obtener el nombre de los productos cuyo precio sea menor o igual a 200 €
select n.NOMBRE from articulos as n where n.PRECIO<=200;
 
-- 1.4. Obtener todos los datos de los artículos cuyo precio esté entre los 60 € y los 120 € (ambas cantidades incluidas).
select * from articulos where PRECIO between 60 and 120;

-- 1.5. Obtener el nombre y el precio en pesetas (es decir, el precio en euros multiplicado por 166386)
select NOMBRE, PRECIO*166.386 as 'PRECIO PTS' from articulos;

-- 1.6. Seleccionar el precio medio de todos los productos.
select avg(PRECIO) FROM articulos;

-- 1.7. Obtener el precio medio de los artículos cuyo código de fabricante sea 2.
select avg(PRECIO) from articulos where FABRICANTE='2';

-- 1.8. Obtener el numero de artículos cuyo precio sea mayor o igual a 180 €.
select count(NOMBRE) from articulos where PRECIO >= 180;

-- 1.9. Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 180 € y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.
select a.NOMBRE, a.PRECIO from articulos as a where PRECIO >= 180 order by PRECIO desc, NOMBRE asc;

-- 1.10. Obtener un listado completo de artículos, incluyendo por cada articulo los datos del articulo y de su fabricante.
select * from articulos inner join fabricantes on articulos.FABRICANTE=fabricantes.CODIGO;

-- 1.11. Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el nombre de su fabricante.
select a.NOMBRE, a.PRECIO, f.NOMBRE from articulos as a, fabricantes as f where a.FABRICANTE=f.CODIGO; 

-- 1.12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante.
select FABRICANTE, avg(PRECIO) from articulos group by FABRICANTE;

-- 1.13. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.
select avg(PRECIO), fabricantes.NOMBRE from articulos join fabricantes on articulos.FABRICANTE=fabricantes.CODIGO group by FABRICANTE;

-- 1.14. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150 €,
select NOMBRE from fabricantes where (select avg(PRECIO) from articulos) >= 150;

-- 1.15. Obtener el nombre y precio del artículo más barato.
select NOMBRE as NAME, PRECIO as 'CHEAPEST PRICE' from articulos where PRECIO = (select min(PRECIO) from articulos); 

-- 1.16, Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor (incluyendo el nombre del proveedor).
select articulos.NOMBRE, fabricantes.NOMBRE, articulos.PRECIO from articulos, fabricantes where articulos.FABRICANTE=fabricantes.CODIGO
and articulos.PRECIO = (select max(PRECIO) from articulos where fabricantes.CODIGO = articulos.FABRICANTE) ;

-- 1.17. Añadir un nuevo producto: Altavoces de 70 € (del fabricante 2)
insert into articulos(CODIGO, NOMBRE, PRECIO, FABRICANTE) values(12,'Altavoces',70,2);

-- 1.18. Cambiar el nombre del producto 8 a "Impresora Laser”
update articulos set NOMBRE = 'Impresora laser' where articulos.CODIGO=8;

-- 1.19. Aplicar un descuento del 10% (multiplicar el precio por 0'9) a todos los productos.
update articulos set PRECIO = PRECIO*0.9;

-- 1,20. Aplicar un descuento de 10 € a todos los productos cuyo precio sea mayor o igual a 120 €.
update articulos set PRECIO = PRECIO-10 where PRECIO >= 120;



