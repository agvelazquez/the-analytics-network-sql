-- ## Semana 3 - Parte A

-- 1. Crear una vista con el resultado del ejercicio de la Parte 1 - Clase 2 - Ejercicio 10, donde unimos la cantidad de gente que ingresa a tienda usando los dos sistemas.

-- 2. Recibimos otro archivo con ingresos a tiendas de meses anteriores. Ingestar el archivo y agregarlo a la vista del ejercicio anterior (Ejercicio 1 Clase 6). Cual hubiese sido la diferencia si hubiesemos tenido una tabla? (contestar la ultima pregunta con un texto escrito en forma de comentario)

-- 3. Crear una vista con el resultado del ejercicio de la Parte 1 - Clase 3 - Ejercicio 10, donde calculamos el margen bruto en dolares. Agregarle la columna de ventas, descuentos, y creditos en dolares para poder reutilizarla en un futuro.

-- 4. Generar una query que me sirva para verificar que el nivel de agregacion de la tabla de ventas (y de la vista) no se haya afectado. Recordas que es el nivel de agregacion/detalle? Lo vimos en la teoria de la parte 1! Nota: La orden M999000061 parece tener un problema verdad? Lo vamos a solucionar mas adelante.

-- 5. Calcular el margen bruto a nivel Subcategoria de producto. Usar la vista creada.

-- 6. Calcular la contribucion de las ventas brutas de cada producto al total de la orden. Por esta vez, si necesitas usar una subquery, podes utilizarla.

-- 7. Calcular las ventas por proveedor, para eso cargar la tabla de proveedores por producto. Agregar el nombre el proveedor en la vista del punto 3.

-- 8. Verificar que el nivel de detalle de la vista anterior no se haya modificado, en caso contrario que se deberia ajustar? Que decision tomarias para que no se genereren duplicados?
    -- - Se pide correr la query de validacion.
    -- - Crear una nueva query que no genere duplicacion.
    -- - Explicar brevemente (con palabras escrito tipo comentario) que es lo que sucedia.



-- ## Semana 3 - Parte B

-- 1. Calcular el porcentaje de valores null de la tabla stg.order_line_sale para la columna creditos y descuentos. (porcentaje de nulls en cada columna)

-- 2. La columna "is_walkout" se refiere a los clientes que llegaron a la tienda y se fueron con el producto en la mano (es decia habia stock disponible). Responder en una misma query:
   --  - Cuantas ordenes fueron "walkout" por tienda?
   --  - Cuantas ventas brutas en USD fueron "walkout" por tienda?
   --  - Cual es el porcentaje de las ventas brutas "walkout" sobre el total de ventas brutas por tienda?

-- 3. Siguiendo el nivel de detalle de la tabla ventas, hay una orden que no parece cumplirlo. Como identificarias duplicados utilizando una windows function? Nota: Esto hace referencia a la orden M999000061. Tenes que generar una forma de excluir los casos duplicados, para este caso particular y a nivel general, si llegan mas ordenes con duplicaciones.

-- 4. Obtener las ventas totales en USD de productos que NO sean de la categoria "TV" NI esten en tiendas de Argentina.

-- 5. El gerente de ventas quiere ver el total de unidades vendidas por dia junto con otra columna con la cantidad de unidades vendidas una semana atras y la diferencia entre ambos.

-- 6. Crear una vista de inventario con la cantidad de inventario por dia, tienda y producto.
        

-- ## Semana 4 - Parte A

-- 1. Realizar el Ejercicio 6 de la clase 6 donde calculabamos la contribucion de las ventas brutas de cada producto utilizando una window function.

-- 2. La regla de pareto nos dice que aproximadamente un 20% de los productos generan un 80% de las ventas. Armar una vista a nivel sku donde se pueda identificar por orden de contribucion, ese 20% aproximado de SKU mas importantes. (Nota: En este ejercicios estamos construyendo una tabla que muestra la regla de Pareto)

-- 3. Calcular el crecimiento de ventas por tienda mes a mes, con el valor nominal y el valor % de crecimiento.

-- 4. Crear una vista a partir de la tabla "return_movements" que este a nivel Orden de venta, item.

-- 5. Crear una tabla calendario llamada "date" con las fechas del 2022 incluyendo el año fiscal y trimestre fiscal (en ingles Quarter). 

-- ## Semana 4 - Parte B

-- 1. Calcular el crecimiento de ventas por tienda mes a mes, con el valor nominal y el valor % de crecimiento. Utilizar self join.
-- 2. Hacer un update a la tabla de product_master agregando una columna llamada "marca", con la marca de cada producto con la primer letra en mayuscula. Sabemos que las marcas que tenemos son: Levi's, Tommy Hilfiger, Samsung, Phillips, Acer, JBL y Motorola. En caso de no encontrarse en la lista usar 'Unknown'.
-- 3. Armar una query que refleje lo siguiente: Rubro, FacturacionTotal (total de facturación por rubro), Ordenadas por la columna rubro en orden ascendente.
