/*
Desafio Entrevista Tecnica Parte 3
*/

--Ejercicio 1
drop table if exists test.emp_2022;
drop table if exists test.emp_2023;
create table test.emp_2022
( 	emp_id int,
	designation varchar(20));

create table test.emp_2023
( 	emp_id int,
	designation varchar(20));

insert into test.emp_2022 values (1, 'Trainee'), (2, 'Developer'),(3, 'Senior Developer'),(4,'Manager');
insert into test.emp_2023 values (1, 'Developer'), (2, 'Developer'),(3, 'Manager'),(5,'Trainee');

/*
- Armar una tabla con el id del empleado y una columna que represente si el empleado "Ascendio" , "Renuncio", o se "Incorporo". En caso de no haber cambios, no mostrarlo.
    - Un empleado renuncia cuando esta el primer año y no el segundo, y viceversa para cuando un empleado se incorpora.
*/

--Ejercicio 2
drop table if exists test.orders;
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

/*
Encontrar para cada dia, cuantas ordenes fueron hechas por clientes nuevos ("first_purchase") y cuantas fueron hechas por clientes que ya habian comprado ("repeat_customer"). Este es un concepto que se utiliza mucho en cualquier empresa para entender la capacidad de generar clientes nuevos o de retener los existentes.
*/

--Ejercicio 3
drop table if exists test.orders2;
drop table if exists test.products;
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
/*
Armar una tabla que sirva como una version simplificada de un sistema de recomendacion y muestre, cuantas ordenes se llevan por cada PAR de productos.
*/

