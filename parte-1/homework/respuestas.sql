--1
select * from stg.product_master
where categoria = 'Electro'

--2
select * from stg.product_master
where origen = 'China'

--3
select * 
from stg.product_master

where categoria = 'Electro'
order by nombre

--4
select * 
from stg.product_master

where subcategoria = 'TV' and is_active = true

--5
