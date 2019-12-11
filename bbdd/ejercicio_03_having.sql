/* 1.- Escalas salariales con más de 2 trabajadores
+------------------+---------+
| num trabajadores | salario |
+------------------+---------+
|                7 |    1000 |
|                3 |    1500 |
+------------------+---------+
*/
select count(NEmple) as num_trabajadores, salario
from empleados
group by salario
having count(Departamento) > 2;

/* 2.- Departamentos con un salario medio mayor que 1.200€:
- El numero de empleados que tiene
- La cantidad que debe desembolsar al mes en concepto de salarios
- El salario medio del departamento

+--------------+--------------+---------------+--------------+
| Departamento | NumEmpleados | TotalSalarios | SalarioMedio |
+--------------+--------------+---------------+--------------+
|           10 |            3 |         11000 |    3666.6667 |
|           30 |            2 |          2500 |    1250.0000 |
+--------------+--------------+---------------+--------------+
*/
select departamento, count(NEmple) as num_trabajadores, sum(salario) as totalsalario, round(avg(salario), 4) as salariomedio
from empleados
group by Departamento
having avg(salario) > 1200;
/* 3.-  Departamentos con un total salarial mayor o igual a 2.500€:
- El numero de empleados que tiene
- La cantidad que debe desembolsar al mes en concepto de salarios
- El salario medio del departamento

+--------------+--------------+---------------+--------------+
| Departamento | NumEmpleados | TotalSalarios | SalarioMedio |
+--------------+--------------+---------------+--------------+
|           10 |            3 |         11000 |    3666.6667 |
|           20 |            6 |          7000 |    1166.6667 |
|           30 |            2 |          2500 |    1250.0000 |
+--------------+--------------+---------------+--------------+
*/
select departamento, count(NEmple) as num_trabajadores, sum(salario) as totalsalario, round(avg(salario), 4) as salariomedio
from empleados
group by Departamento
having sum(salario) >= 2500;

/* 4.- Jefes con mas de un subordinado 
+--------+-----------+---------+--------------+
| NEmple | Apellido  | Salario | Departamento |
+--------+-----------+---------+--------------+
...............................................
*/
select count(*), jefe
from empleados
group by jefe
having count(*) > 1;