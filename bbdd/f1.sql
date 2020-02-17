-- 1.- Nombres de naciones con circuito
select nacion, clave_nacion, pais, clave_circuito, nombre 
from circuitos, naciones
 where nacion = clave_nacion

-- 2.- Listado con Nombre piloto, Nombre Equipo, Nacion del piloto ordenado por Nombre piloto Asc
select p.nombre, e.nombre, pais from equipos e, naciones n, pilotos p
where e.nacion = n.clave_nacion and e.clave_equipo = p.equipo
order by p.nombre asc

-- 3.- Todos los podios (1º, 2º y 3º) con Nombre piloto, nombre circuito, posicion (ordenado por circuito)
select  circuito,nombre, piloto, posicion
from resultados, circuitos
where clave_circuito = circuito and posicion <= 3
order by circuito


-- 4.- Nombre de los pilotos que no han puntuado en Montecarlo.

select nombre
from pilotos pl
where not exists(select * from puntos p,resultados r,circuitos c
 where c.clave_circuito = r.circuito and r.posicion = p.posicion 
 and r.piloto = pl.clave_piloto and c.nombre="Montecarlo")


-- 5.- Clasificación del mundial (Nombre piloto, puntos)
select piloto, nombre, sum(puntos) 
from pilotos pl, puntos p, resultados r
where r.posicion = p.posicion and pl.clave_piloto = r.piloto
group by piloto
order by sum(puntos) desc


-- 6.- Clasificación del mundial (Nombre piloto, puntos) solo los 5 primeros
select piloto, nombre, sum(puntos) 
from pilotos pl, puntos p, resultados r
where r.posicion = p.posicion and pl.clave_piloto = r.piloto 
group by piloto
order by sum(puntos) desc
limit 5

-- 7.- Clasificación del mundial (Nombre piloto, puntos) solo pilotos con mas de 20 puntos.
select piloto, nombre, sum(puntos) 
from pilotos pl, puntos p, resultados r
where r.posicion = p.posicion and pl.clave_piloto = r.piloto 
group by piloto
having sum(puntos) > 20
order by sum(puntos) desc

-- 8.-Circuitos en cuya nación existe un equipo de F1 (subconsulta con EXISTS)
select pais 
from naciones 
where exists(select * from equipos where nacion = clave_nacion)

-- 9.-Calsificacion por equipos.
select  e.nombre, sum(puntos)
from equipos e, pilotos p, puntos pt, resultados r
where e.clave_equipo = p.equipo and r.piloto = p.clave_piloto and pt.posicion = r.posicion 
group by equipo
order by sum(puntos) desc

-- 10.-Pilotos que han ganado alguna carrera (subconsulta con exists)
select nombre 
from pilotos
where exists(select * from resultados where clave_piloto = piloto and posicion = 1) 

-- 11.-Pilotos que han hecho podio en Montecarlo (subconsulta con IN)
select nombre,posicion 
from pilotos, resultados 
where clave_piloto = piloto and circuito = 6 
limit 3  
-- 12.-Equipos que no han ganado ninguna carrera (subconsulta con NOT EXISTS)
select e.nombre
from equipos e
where not exists(select * from pilotos p, puntos pt, resultados r where 
e.clave_equipo = p.equipo and p.clave_piloto = r.piloto and pt.posicion = r.posicion and 
r.posicion = 1) 

-- 13.-Pilotos que han ganado más de una carrera
select p.nombre, count(r.posicion)
from pilotos p, resultados r,puntos pt
where p.clave_piloto = r.piloto and pt.posicion = r.posicion and r.posicion = 1
group by p.nombre
having count(r.posicion) >= 2

-- 14.-Las naciones con el nombre del circuito o especificando que no tiene circuito

/*Para seleccionar los que son null tambien LEFT JOIN*/
select pais, ifnull(nombre, "No tiene circuito") from naciones LEFT JOIN  circuitos on clave_nacion = nacion
/*
+----------------+------------------------------------+
| pais           | ifnull(nombre,'No tiene circuito') |
+----------------+------------------------------------+
| Abu Dhabi      | Yas Marina                         |
| Alemania       | Nurburgring                        |
| Australia      | Albert Park                        |
| Bahrein        | Sakhir                             |
| Belgica        | Spa-Francochamps                   |
| Brasil         | Interlagos                         |
| Canada         | Gilles Villeneuve                  |
| China          | Shanghai                           |
| España         | Montmelo                           |
| Finlandia      | No tiene circuito                  |
| Francia        | No tiene circuito                  |
| Gran Bretaña   | Silverstone                        |
| Holanda        | No tiene circuito                  |
| Hungria        | Hungaroring                        |
| India          | Buddh                              |
| Italia         | Monza                              |
| Japon          | Suzuka                             |
| Corea del Sur  | Yeongam                            |
| Malasia        | Sepang                             |
| Mexico         | No tiene circuito                  |
| Monaco         | Montecarlo                         |
| Polonia        | No tiene circuito                  |
| Rusia          | No tiene circuito                  |
| Singapur       | Marina Bay                         |
| Suiza          | No tiene circuito                  |
| Turquia        | No tiene circuito                  |
| Estados Unidos | Austin                             |
| Venezuela      | No tiene circuito                  |
+----------------+------------------------------------+

o lo que es lo mismo 

+----------------+-----------------------------+
| pais           | ifnull(circuitos.nombre,'') |
+----------------+-----------------------------+
| Abu Dhabi      | Yas Marina                  |
| Alemania       | Nurburgring                 |
| Australia      | Albert Park                 |
| Bahrein        | Sakhir                      |
| Belgica        | Spa-Francochamps            |
| Brasil         | Interlagos                  |
| Canada         | Gilles Villeneuve           |
| China          | Shanghai                    |
| España         | Montmelo                    |
| Finlandia      |                             |
| Francia        |                             |
| Gran Bretaña   | Silverstone                 |
| Holanda        |                             |
| Hungria        | Hungaroring                 |
| India          | Buddh                       |
| Italia         | Monza                       |
| Japon          | Suzuka                      |
| Corea del Sur  | Yeongam                     |
| Malasia        | Sepang                      |
| Mexico         |                             |
| Monaco         | Montecarlo                  |
| Polonia        |                             |
| Rusia          |                             |
| Singapur       | Marina Bay                  |
| Suiza          |                             |
| Turquia        |                             |
| Estados Unidos | Austin                      |
| Venezuela      |                             |
+----------------+-----------------------------+
*/
------+-------------------+
*/