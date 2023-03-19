                
drop table if exists stg.test_table_1;
create table stg.test_table_1 (id int);
insert into stg.test_table_1 values (1);
insert into stg.test_table_1 values (1);
insert into stg.test_table_1 values (1);
insert into stg.test_table_1 values (2);
insert into stg.test_table_1 values (null);
insert into stg.test_table_1 values (3);
insert into stg.test_table_1 values (3);


drop table if exists stg.test_table_2;
create table stg.test_table_2 (id int);
insert into stg.test_table_2 values (1);
insert into stg.test_table_2 values (1);
insert into stg.test_table_2 values (null);
insert into stg.test_table_2 values (4);
insert into stg.test_table_2 values (4);


select * from stg.test_table_1;
select * from stg.test_table_2;
