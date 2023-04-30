# Homework

Bienvenidos a la seccion de ejercicios de entrevistas! 
Para completar estos ejercicios no hace falta nuevo conocimiento! Por lo tanto podes arrancarlos cuando quieras.  Estos representan ejercicios que podes encontrar en una entrevista para cualquier puesto de datos, ya que SQL esta presente en todos! 

Cada pregunta sera respondida con una query que devuelva los datos necesarios para reponder la misma. Muchas de las preguntas pueden tener 
mas de una manera de ser respondidas y es posible que debas aplicar tu criterio para decidir cual es la mejor opcion. 

Si ya forkeaste el repositorio, lo que podes hacer es copiar este archivo clickeando en "Raw" y luego Ctrl + A. Luego podes crear un archivo llamado "homework.md en tu repositorio con el texto copiado.


## Ejercicio 1

- Ejecutar el siguiente script para crear la tabla turistas dentro del esquema test. 
- Armar una tabla con el id del empleado y una columna que represente si el empleado "Ascendio" , "Renuncio", o se "Incorporo". En caso de no haber cambios, no mostrarlo. Un empleado renuncia cuando esta el primer año y no el segundo, y viceversa para cuando un empleado se incorpora.

```
create table test.emp_2022
( 	emp_id int,
	designation varchar(20));

create table test.emp_2023
( 	emp_id int,
	designation varchar(20));

insert into test.emp_2022 values (1,'Trainee'), (2,'Developer'),(3,'Senior Developer'),(4,'Manager');
insert into test.emp_2023 values (1,'Developer'), (2,'Developer'),(3,'Manager'),(5,'Trainee');
```

## Ejercicio 2

- Ejecutar el siguiente script para crear la tabla turistas dentro del esquema test. 
- Encontrar para cada dia, cuantas ordenes fueron hechas por clientes nuevos ("first_purchase") y cuantas fueron hechas por clientes que ya habian comprado ("repeat_customer"). Este es un concepto que se utiliza mucho en cualquier empresa para entender la capacidad de generar clientes nuevos o de retener los existentes.

```
create table test.orders (
	order_id integer,
	customer_id integer,
	order_date date,
	order_amount integer
	);

insert into test.orders values
 (1,100,cast('2022-01-01' as date),2000)
,(2,200,cast('2022-01-01' as date),2500)
,(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000)
,(5,400,cast('2022-01-02' as date),2200)
,(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000)
,(8,400,cast('2022-01-03' as date),1000)
,(9,600,cast('2022-01-03' as date),3000)
;
```

## Ejercicio 3

- Ejecutar el siguiente script para crear la tabla turistas dentro del esquema test. 
- Armar una tabla que sirva como una version simplificada de un sistema de recomendacion y muestre, cuantas ordenes se llevan por cada PAR de productos.

```
create table test.orders2(
	order_id int,
	customer_id int,
	product_id int);

insert into test.orders2 VALUES 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(2, 2, 1),
(2, 2, 2),
(2, 2, 4),
(3, 1, 5);

create table test.products (
	id int,
	name varchar(10));
	
insert into test.products VALUES 
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');
```
