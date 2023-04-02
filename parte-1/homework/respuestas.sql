--CLASE 1:
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


CLASE 2:
--1 Cuales son los paises donde la empresa tiene tiendas?
select distinct pais
from stg.store_master

--2 Cuantos productos por subcategoria tiene disponible para la venta?


--3 Cuales son las ordenes de venta de Argentina de mayor a $100.000?


--4 Obtener los decuentos otorgados durante Noviembre de 2022 en cada una de las monedas?


--5 Obtener los impuestos pagados en Europa durante el 2022.


--6 En cuantas ordenes se utilizaron creditos?


--7 Cual es el % de descuentos otorgados (sobre las ventas) por tienda?


--8 Cual es el inventario promedio por dia que tiene cada tienda?


--9 Obtener las ventas netas y el porcentaje de descuento otorgado por producto en Argentina.


--10 Las tablas "market_count" y "super_store_count" representan dos sistemas distintos que usa la empresa para contar la cantidad de gente que ingresa a tienda, uno para las tiendas de Latinoamerica y otro para Europa. Obtener en una unica tabla, las entradas a tienda de ambos sistemas.


--11 Cuales son los productos disponibles para la venta (activos) de la marca Phillips?


--12 Obtener el monto vendido por tienda y moneda y ordenarlo de mayor a menor por valor nominal.


--13 Cual es el precio promedio de venta de cada producto en las distintas monedas? Recorda que los valores de venta, impuesto, descuentos y creditos es por el total de la linea.


--14 Cual es la tasa de impuestos que se pago por cada orden de venta?



CLASE 3:
