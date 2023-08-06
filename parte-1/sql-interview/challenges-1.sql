/*
Desafio Entrevista Tecnica Parte 1 
*/


create schema test;

drop table if exists test.test_table_1;
create table test.test_table_1 (id int);
insert into test.test_table_1 values (1);
insert into test.test_table_1 values (1);
insert into test.test_table_1 values (1);
insert into test.test_table_1 values (2);
insert into test.test_table_1 values (null);
insert into test.test_table_1 values (3);
insert into test.test_table_1 values (3);


drop table if exists test.test_table_2;
create table test.test_table_2 (id int);
insert into test.test_table_2 values (1);
insert into test.test_table_2 values (1);
insert into test.test_table_2 values (null);
insert into test.test_table_2 values (4);
insert into test.test_table_2 values (4);


select * from test.test_table_1;
select * from test.test_table_2;

--1. Como encuentro duplicados en una tabla. Dar un ejemplo mostrando duplicados de la columna orden en la tabla de ventas. (responder teoricamente)

--2. Como elimino duplicados? (responder teoricamente)

--3. Cual es la diferencia entre UNION y UNION ALL. (responder teoricamente)

--4. Como encuentro registros en una tabla que no estan en otra tabla. (responder teoricamente y usando la table_1 y table_2 como ejemplo)

--5. Cual es la diferencia entre INNER JOIN y LEFT JOIN.  (responder teoricamente y usando la table_1 y table_2 como ejemplo)
