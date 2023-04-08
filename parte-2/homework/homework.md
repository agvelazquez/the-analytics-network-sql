# Homework

Bienvenidos a la seccion de tarea para el hogar de la parte 2! 
Te recomiendo realizar estas preguntas durante el transcurso de la semana para poder seguir el ritmo a las clases.

Cada pregunta sera respondida con una query que devuelva los datos necesarios para reponder la misma. Muchas de las preguntas pueden tener 
mas de una manera de ser respondidas y es posible que debas aplicar tu criterio para decidir cual es la mejor opcion. 

Si ya forkeaste el repositorio, lo que podes hacer es copiar este archivo clickeando en "Raw" y luego Ctrl + A. Luego podes crear un archivo llamado "homework.md en tu repositorio con el texto copiado.

## Clase 6

1. Crear una vista con el resultado del ejercicio de la Parte 1 - Clase 2 - Ejercicio 10, donde unimos la cantidad de gente que ingresa a tienda usando los dos sistemas. 
2. Recibimos otro archivo con ingresos a tiendas de meses anteriores. Ingestar el archivo y agregarlo a la vista del ejercicio anterior (Ejercicio 1 Clase 6). Cual hubiese sido la diferencia si hubiesemos tenido una tabla? (contestar la ultima pregunta con un texto escrito en forma de comentario)
3. Crear una vista con el resultado del ejercicio de la Parte 1 - Clase 3 - Ejercicio 10, donde calculamos el margen bruto.
5. Generar una query que me sirva para verificar que el nivel de agregacion de la tabla de ventas (y de la vista) no se haya afectado. Recordas que es el nivel de agregacion/detalle? Lo vimos en la teoria de la parte 1! Nota: La orden M999000061 parece tener un problema verdad? Lo vamos a solucionar mas adelante.
6. Calcular el margen bruto a nivel Subcategoria de producto. Usar la vista creada. 
7. Calcular la contribucion de las ventas brutas de cada producto al total de la orden. Por esta vez, si necesitas usar una subquery, podes utilizarla.
8. Calcular las ventas por proveedor, para eso cargar la tabla de proveedores por producto. Agregar el nombre el proveedor en la vista del punto 3. 
9. Verificar que el nivel de detalle de la vista anterior no se haya modificado, en caso contrario que se deberia ajustar? (contestar la ultima pregunta con un texto escrito en forma de comentario)


## Clase 7

1. Calcular el porcentaje de valores null de la tabla stg.order_line_sale para la columna creditos y descuentos. (porcentaje de nulls
en cada columna)
2. La columna "is_walkout" se refiere a los clientes que llegaron a la tienda y se fueron con el producto en la mano (es decia habia stock disponible). Responder en una misma query:
	- Cuantas ordenes fueron "walkout" por tienda?
	- Cuantas ventas brutas en USD fueron "walkout" por tienda?
	- Cual es el porcentaje de las ventas brutas "walkout" sobre el total de ventas brutas por tienda?
3. Siguiendo el nivel de detalle de la tabla ventas, hay una orden que no parece cumplirlo. Como identificarias duplicados utilizando una windows function? Nota: Esto hace referencia a la orden M999000061. Tenes que generar una forma de excluir los casos duplicados, para este caso particular y a nivel general, si llegan mas ordenes con duplicaciones. 
4. Obtener las ventas totales en USD de productos que NO sean de la categoria "TV" NI esten en tiendas de Argentina.
5. El gerente de ventas quiere ver el total de unidades vendidas por dia junto con otra columna con la cantidad de unidades vendidas una semana atras y la diferencia entre ambos. Nota: resolver en dos querys usando en una CTEs y en la otra windows functions.
6. Crear una vista de inventario con la cantidad de inventario por dia, tienda y producto, que ademas va a contar con los siguientes datos: 
  - Nombre y categorias de producto
  - Pais y nombre de tienda
  - Costo del inventario por linea (recordar que si la linea dice 4 unidades debe reflejar el costo total de esas 4 unidades)
  - Una columna llamada "is_last_snapshot" para el ultimo dia disponible de inventario. 
  - Ademas vamos a querer calcular una metrica llamada "Average days on hand (DOH)" que mide cuantos dias de venta nos alcanza el inventario. Para eso DOH = Unidades en Inventario Promedio / Promedio diario Unidades vendidas ultimos 7 dias. 


Nota: Antes de crear la columna DOH, conviene crear una columna que refleje el Promedio diario Unidades vendidas ultimos 7 dias. 
Nota2: El nivel de agregacion es dia/tienda/sku.
Nota3: El Promedio diario Unidades vendidas ultimos 7 dias tiene que calcularse para cada dia.

