# Homework

## Semana 3 - Parte A

1. Crear una vista con el resultado del ejercicio donde unimos la cantidad de gente que ingresa a tienda usando los dos sistemas.(tablas `market_count` y `super_store_count`)
    1. Nombrar a la lista `stg.vw_store_traffic`
    2. Las columnas son `store_id`, `date`, `traffic`
2. Recibimos otro archivo con ingresos a tiendas de meses anteriores. Subir el archivo a `stg.super_store_count_aug` y agregarlo a la vista del ejercicio anterior. Cual hubiese sido la diferencia si hubiesemos tenido una tabla? (contestar la ultima pregunta con un texto escrito en forma de comentario)
3. Crear una vista con el resultado del ejercicio del ejercicio de la Parte 1 donde calculamos el margen bruto en dolares. Agregarle la columna de ventas, promociones, creditos, impuestos y el costo en dolares para poder reutilizarla en un futuro. Responder con el codigo de creacion de la vista.
    1. El nombre de la vista es `stg.vw_order_line_sale_usd`
    2. Los nombres de las nuevas columnas son `sale_usd`, `promotion_usd`, `credit_usd`, `tax_usd`, y `line_cost_usd`
4. Generar una query que me sirva para verificar que el nivel de agregacion de la tabla de ventas (y de la vista) no se haya afectado. Recordas que es el nivel de agregacion/detalle? Lo vimos en la teoria de la parte 1! Nota: La orden `M202307319089` parece tener un problema verdad? Lo vamos a solucionar mas adelante.
5. Calcular el margen bruto a nivel Subcategoria de producto. Usar la vista creada `stg.vw_order_line_sale_usd`.
    1. La columna de margen se llama `margin_usd`
6. Calcular la contribucion de las ventas brutas de cada producto al total de la orden.
7. Calcular las ventas por proveedor, para eso cargar la tabla de proveedores por producto. Agregar el nombre el proveedor en la vista del punto `stg.vw_order_line_sale_usd`. El nombre de la nueva tabla es `stg.suppliers`
8. Verificar que el nivel de detalle de la vista `stg.vw_order_line_sale_usd` no se haya modificado, en caso contrario que se deberia ajustar? Que decision tomarias para que no se genereren duplicados?
    - Se pide correr la query de validacion.
    - Modificar la query de creacion de `stg.vw_order_line_sale_usd`  para que no genere duplicacion de las filas.
    - Explicar brevemente (con palabras escrito tipo comentario) que es lo que sucedia.


## Semana 3 - Parte B

1. Calcular el porcentaje de valores `null` de la tabla `stg.order_line_sale` para la columna creditos y descuentos. (porcentaje de nulls en cada columna)
2. La columna `is_walkout` se refiere a los clientes que llegaron a la tienda y se fueron con el producto en la mano (es decia habia stock disponible). Responder en una misma query:
    - Cuantas ordenes fueron `walkout` por tienda?
    - Cuantas ventas brutas en USD fueron `walkout` por tienda?
    - Cual es el porcentaje de las ventas brutas `walkout` sobre el total de ventas brutas por tienda?
3. Siguiendo el nivel de detalle de la tabla ventas, hay una orden que no parece cumplirlo. Como identificarias duplicados utilizando una windows function? 
    1. Tenes que generar una forma de excluir los casos duplicados, para este caso particular y a nivel general, si llegan mas ordenes con duplicaciones.
        1. Identificar los duplicados.
        2. Eliminar las filas duplicadas. Podes usar `BEGIN` transaction y luego `rollback` o `commit` para verificar que se haya hecho correctamente.
4. Obtener las ventas totales en USD de productos que NO sean de la categoria `TV` NI esten en tiendas de `Argentina`.
    1. Modificar la vista `stg.vw_order_line_sale_usd` con todas las columnas necesarias. 
5. El gerente de ventas quiere ver el total de unidades vendidas por dia junto con otra columna con la cantidad de unidades vendidas una semana atras y la diferencia entre ambos.
    1. Diferencia entre las ventas mas recientes y las mas antiguas para tratar de entender un crecimiento.
6. Crear una vista de inventario con la cantidad de inventario promedio por dia, tienda y producto, que ademas va a contar con los siguientes datos:
    - Nombre y categorias de producto: `product_name`, `category`, `subcategory`, `subsubcategory`
    - Pais y nombre de tienda: `country`, `store_name`
    - Costo del inventario por linea (recordar que si la linea dice 4 unidades debe reflejar el costo total de esas 4 unidades): `inventory_cost`
    - Inventario promedio: `avg_inventory`
    - Una columna llamada `is_last_snapshot` para el inventario de la fecha de la ultima fecha disponible. Esta columna es un campo booleano.
    - Ademas vamos a querer calcular una metrica llamada "Average days on hand (DOH)" `days_on_hand` que mide cuantos dias de venta nos alcanza el inventario. Para eso DOH = Unidades en Inventario Promedio / Promedio diario Unidades vendidas ultimos 7 dias.
    - El nombre de la vista es `stg.vw_inventory`
    - Notas:
        - Antes de crear la columna DOH, conviene crear una columna que refleje el Promedio diario Unidades vendidas ultimos 7 dias. `avg_sales_last_7_days`
        - El nivel de agregacion es dia/tienda/sku.
        - El Promedio diario Unidades vendidas ultimos 7 dias tiene que calcularse para cada dia.


## Semana 4 - Parte A

1. Calcular la contribucion de las ventas brutas de cada producto al total de la orden utilizando una window function. 
    1. Mismo objetivo que el ejercicio de la parte A pero con diferente metodologia.
2. La regla de pareto nos dice que aproximadamente un 20% de los productos generan un 80% de las ventas. Armar una vista a nivel sku donde se pueda identificar por orden de contribucion, ese 20% aproximado de SKU mas importantes. 
    1. Nota: En este ejercicios estamos construyendo una tabla que muestra la regla de Pareto
    2. El nombre de la vista es `stg.vw_pareto`
        1. Las columnas son, `product_code`, `product_name`, `quantity_sold`, `cumulative_contribution_percentage`
3. Calcular el crecimiento de ventas por tienda mes a mes, con el valor nominal y el valor % de crecimiento.
4. Crear una vista a partir de la tabla `return_movements` que este a nivel Orden de venta, item y que contenga las siguientes columnas:
    - Orden `order_number`
    - Sku `item`
    - Cantidad unidated retornadas `quantity`
    - Fecha: `date` Se considera la fecha de retorno aquella el cual el cliente la ingresa a nuestro deposito/tienda.
    - Valor USD retornado (resulta de la cantidad retornada * valor USD del precio unitario bruto con que se hizo la venta) `sale_returned_usd`
    - Features de producto `product_name`, `category`, `subcategory`
    - `first_location` (primer lugar registrado, de la columna `from_location`, para la orden/producto)
    - `last_location` (el ultimo lugar donde se registro, de la columna `to_location` el producto/orden)
    - El nombre de la vista es `stg.vw_returns`
5. Crear una tabla calendario llamada `stg.date` con las fechas del 2022 incluyendo el año fiscal y trimestre fiscal (en ingles Quarter). El año fiscal de la empresa comienza el primero Febrero de cada año y dura 12 meses. Realizar la tabla para 2022 y 2023. La tabla debe contener:
    - Fecha (date) `date`
    - Mes (date) `month`
    - Año (date) `year`
    - Dia de la semana (text, ejemplo: "Monday") `weekday`
    - `is_weekend` (boolean, indicando si es Sabado o Domingo)
    - Mes (text, ejemplo: June) `month_label`
    - Año fiscal (date) `fiscal_year`
    - Año fiscal (text, ejemplo: "FY2022") `fiscal_year_label`
    - Trimestre fiscal (text, ejemplo: Q1) `fiscal_quarter_label`
    - Fecha del año anterior (date, ejemplo: 2021-01-01 para la fecha 2022-01-01) `date_ly`
    - Nota: En general una tabla date es creada para muchos años mas (minimo 10), en este caso vamos a realizarla para el 2022 y 2023 nada mas..

## Semana 5 - Parte B

1. Calcular el crecimiento de ventas por tienda mes a mes, con el valor nominal y el valor % de crecimiento. Utilizar self join.
2. Hacer un update a la tabla de `stg.product_master` agregando una columna llamada `brand`, con la marca de cada producto con la primer letra en mayuscula. Sabemos que las marcas que tenemos son: Levi's, Tommy Hilfiger, Samsung, Phillips, Acer, JBL y Motorola. En caso de no encontrarse en la lista usar `Unknown`.
3. Un jefe de area tiene una tabla que contiene datos sobre las principales empresas de distintas industrias en rubros que pueden ser competencia y nos manda por mail la siguiente informacion:

| empresa | rubro | facturacion |
|:------:|------------|:---------:|
El Corte Ingles | Departamental | $110.99B
Mercado Libre	| ECOMMERCE 	| $115.86B
Fallabela 	| departamental | $20.46M
Tienda Inglesa 	| Departamental | $10,78M
Zara 		| INDUMENTARIA 	| $999.98M


Armar una query que refleje lo siguiente:

- Rubro
- FacturacionTotal (total de facturación por rubro).
- Ordenadas por la columna rubro en orden ascendente.
- Nota: a partir del mail que recibimos podemos ponerlo en un csv y subirlo a la base de datos o crear una tabla generando inserts luego.
- La columna FacturacionTotal debe estar expresada en millones/billones según corresponda y con 2 decimales después de la coma. Los elementos de la columna rubro debe estar expresados en letra minúscula.
- Si tenes que crear una tabla llamarla `test.facturacion`

Output esperado:

| rubro | facturacion_total |
|:------:|------------|
departamental 	| 111.01B
ecommerce 	| 115.86B
indumentaria 	| 999.98M
