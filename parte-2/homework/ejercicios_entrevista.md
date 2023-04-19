# Homework

Bienvenidos a la seccion de ejercicios de entrevistas! 
Te recomiendo realizar estas preguntas luego de la Clase 8 y antes del TP integrador para poder seguir el ritmo a las clases.

Cada pregunta sera respondida con una query que devuelva los datos necesarios para reponder la misma. Muchas de las preguntas pueden tener 
mas de una manera de ser respondidas y es posible que debas aplicar tu criterio para decidir cual es la mejor opcion. 

Si ya forkeaste el repositorio, lo que podes hacer es copiar este archivo clickeando en "Raw" y luego Ctrl + A. Luego podes crear un archivo llamado "homework.md en tu repositorio con el texto copiado.


## Ejercicio 1

- Ejecutar el siguiente script para crear la tabla turistas dentro del esquema test. 
- Cuales son las ciudades donde la afluencia de turistas es continuamente creciente. 

```
create schema test;
drop table if exists test.turistas;
create table test.turistas(city varchar(50),days date,personas int);
insert into test.turistas values('CABA','2022-01-01',100);
insert into test.turistas values('CABA','2022-01-02',200);
insert into test.turistas values('CABA','2022-01-03',300);
insert into test.turistas values('Cordoba','2022-01-01',100);
insert into test.turistas values('Cordoba','2022-01-02',100);
insert into test.turistas values('Cordoba','2022-01-03',300);
insert into test.turistas values('Madrid','2022-01-01',100);
insert into test.turistas values('Madrid','2022-01-02',200);
insert into test.turistas values('Madrid','2022-01-03',150);
insert into test.turistas values('Punta del Este','2022-01-01',100);
insert into test.turistas values('Punta del Este','2022-01-02',300);
insert into test.turistas values('Punta del Este','2022-01-03',200);
insert into test.turistas values('Punta del Este','2022-01-04',400);
```

## Ejercicio 2

- Ejecutar el siguiente script para crear la tabla empleados dentro del esquema test. 
- Encontrar a los empleados cuyo salario es mayor que el de su manager. 
```
drop table if exists test.empleados;
create table test.empleados (emp_id int, empleado varchar(50), salario bigint, manager_id int);
insert into test.empleados values (1,'Clara',10000,4);
insert into test.empleados values (2,'Pedro',15000,5);
insert into test.empleados values (3,'Daniel',10000,4);
insert into test.empleados values (4,'Hernan',5000,2);
insert into test.empleados values (5,'Debora',12000,6);
insert into test.empleados values (6,'Ricardo',12000,2);
insert into test.empleados values (7,'Luciano',9000,2);
insert into test.empleados values (8,'Romina',5000,2);
```

## Ejercicio 3 

- Ejecutar el siguiente script para crear la tabla players y matches dentro del esquema test. 
- Encontrar el player_id ganador de cada grupo. El ganador es aquel que anota mas puntos (score) en caso de empate, el que tenga menor player_id gana.

```
drop table if exists test.players;
create table test.players (player_id int, group varchar(1));
insert into test.players values (15,A);
insert into test.players values (25,A);
insert into test.players values (30,A);
insert into test.players values (45,A);
insert into test.players values (10,B);
insert into test.players values (35,B);
insert into test.players values (50,B);
insert into test.players values (20,C);
insert into test.players values (40,C);
create table test.matches (match_id int, first_player int, second_player int, first_score int, second_score int);
insert into test.matches values (1,15,45,3,0);
insert into test.matches values (2,30,25,1,2);
insert into test.matches values (3,30,15,2,0);
insert into test.matches values (4,40,20,5,2);
insert into test.matches values (5,35,50,1,1);
```
