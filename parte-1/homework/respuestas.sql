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
select * 
from stg.store_master

where pais = 'Argentina'
order by fecha_apertura

--6
select * 
from stg.order_line_sale

order by fecha desc
limit 5

--7
select * 
from stg.super_store_count

order by fecha 
limit 10

--8
select * 
from stg.product_master

where categoria = 'Electro' and not subsubcategoria in ('Soporte','Control remoto')

--9
select * 
from stg.order_line_sale

where moneda in ('ARS','URU') -- tomando Pesos como Pesos Argentinos y Pesos Uruguayos
and venta > 100000

--10
select * 
from stg.order_line_sale

where fecha between '2022-10-01' and '2022-10-31'

--11
select * 
from stg.product_master

where ean is not null

--12
select * 
from stg.order_line_sale

where fecha between '2022-10-01' and '2022-11-10'