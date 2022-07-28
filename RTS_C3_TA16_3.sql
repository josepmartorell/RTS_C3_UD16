USE `actividades`;

-- 3.1 Obtener todos los almacenes
select * from actividades.almacenes;

-- 3.2 Obtener todas las cajas cuyo contenido tenga un valor superior a 150€
select * from actividades.cajas where actividades.cajas.VALOR > 150;

-- 3.3 Obtener los tipos de contenidos de las cajas
select distinct actividades.cajas.CONTENIDO from actividades.cajas;

-- 3.4 Obtener el valor medio de todas las cajas
select avg(VALOR) from cajas;

-- 3.5 Obtener el valor medio de las cajas de cada almacén
select avg(VALOR) from cajas group by cajas.ALMACEN;

-- 3.6 Obtener los códigos de los almacenes en los cuales el valor medio de las cajas sea superior 150€
select distinct ALMACEN from cajas where (select avg(VALOR) from cajas);

-- 3.7 Obtener el número de referencia de cada caja junto al nombre de la ciudad en la que se encuentra
select cajas.NUMREFERENCIA, almacenes.LUGAR from cajas inner join almacenes ON actividades.cajas.ALMACEN = actividades.almacenes.CODIGO;

-- 3.8 Obtener el número de cajas que hay en cada almacén
select count(almacen) from cajas group by almacen;

-- 3.9 Obtener los códigos de los almacenes que están saturados
select actividades.almacenes.CODIGO from almacenes where actividades.almacenes.CAPACIDAD < ANY (select count(almacen) from cajas group by almacen);

-- 3.10 Obtener los números de referencia de las cajas que estan el Bilbao
select cajas.NUMREFERENCIA from cajas inner join almacenes ON actividades.cajas.ALMACEN = actividades.almacenes.CODIGO where actividades.almacenes.LUGAR = 'Bilbao';

-- 3.11 Insertar un nuevo almacén en Barcelona con capacidad de 3 cajas
insert into `almacenes` values (6,'Barcelona',3);

-- 3.12 Insertar una nueva caja con número de referencia 'H5RT', contenido 'Papel', valor 200 y almacén 2
insert into `cajas` values ('H5RT','Papel',200,2);

-- 3.13 Rebajar el valor de todas las cajas un 15%
update actividades.cajas set valor=valor*0.85;

-- 3.14 Rebajar un 20% el valor de las cajas el cual sea superior al medio de todas las cajas
update cajas set valor=valor*0.8 where cajas.VALOR > (select * from (select avg(VALOR) from cajas) as C);

-- 3.15 Eliminar todas las cajas cuyo valor sea inferior a 100€
delete from cajas where VALOR<100;

-- 3.16 Vaciar el contenido de los almacenes que estan saturados
delete from cajas where almacen in (select codigo from almacenes where capacidad < (select COUNT(ca.numreferencia) from (select * from cajas where almacen = codigo)as ca));