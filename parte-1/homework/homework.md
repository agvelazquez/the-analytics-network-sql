# Homework

Bienvenidos a la seccion de tarea para el hogar de la parte 1. Es recomendable realizar estas preguntas durante el transcurso 
de la semana para poder seguir el ritmo a las clases.


Cada pregunta sera respondida con una query que devuelva los datos necesarios para reponder la misma. Muchas de las preguntas pueden tener 
mas de una manera de ser respondidas y en otras es posible que debas aplicar tu criteria para decidir cual es la mejor opcion. 

Ejemplo: 

Pregunta: Cuantas tiendas estan ubicadas en Argentina? 

Respuesta: ``` select count(distinct codigo_tienda) from tiendas where pais = 'Argentina'``` 

Como la tabla tiendas tiene valores unicos por tienda otra respuesta puede ser:

Respuesta 2: ``` select count(codigo_tienda) from tiendas where pais = 'Argentina'``` 

Ambas respuestas van a ser consideradas validas.


## Clase 1

1. Mostrar todos los productos dentro de la categoria electro junto con todos los detalles. 
2. Cuales son los producto producidos en China? 
3. Mostrar todos los productos de Electro ordenados por nombre. 
4. Cuales son las TV que se encuentran activas para la venta?
5. Mostrar todas las tiendas de Argentina ordenadas por fecha de apertura de las mas antigua a la mas nueva. 
6. Cuales fueron las ultimas 5 ordenes de ventas? 
7. Mostrar los primeros 10 registros de el conteo de trafico por Super store ordenados por fecha. 
8. Cuales son los producto de electro que no son Soporte de TV ni control remoto. 
9. Mostrar todas las lineas de venta donde el monto sea mayor a $100.000 solo para transacciones en pesos.
10. Mostrar todas las lineas de ventas de Octubre 2022.
11. Mostrar todos los productos que tengan EAN.
12. Mostrar todas las lineas de venta que que hayan sido vendidas entre 1 de Octubre de 2022 y 10 de Noviembre de 2022.


## Clase 2

1. Cuales son los paises donde la empresa tiene tiendas? 
2. Cuantos productos por subcategoria tiene disponible para la venta? 
3. Cuales son las ordenes de venta de Argentina de mayor a $100.000? 
4. Obtener los decuentos otorgados durante Noviembre de 2022 en cada una de las monedas?
5. Obtener los impuestos pagados en Europa durante el 2022. 
6. En cuantas ordenes se utilizaron creditos? 
7. Cual es el % de descuentos otorgados por tienda?
8. Obtener las ventas netas, % de descuento por producto. 
9. Obtener las entradas a tienda en un solo resultado.
10. Cuales son los productos disponibles de la marca Phillips? 
11. Obtener el monto vendido por tienda y ordenarlo de mayor a menor. 
12. Obtener el monto vendido por tienda, para las tiendas que vendieron mas $9000, ordenado de mayor a menor. 
13. Obter el maximo valor para una orden de venta.


## Clase 3

1. Mostrar nombre y codigo de producto, categoria y color para todos los productos, mostrando la leyenda "Unknown" cuando no hay un color disponible.
2. Calcular el ratio credito/promotion para cada linea de venta. 
4. Mostrar los primero 100 resultados de la tabla ventas con una nueva columna llamada "line_key" resultado de la concatenacion entre orden y producto separado por guion medio. 
5. Mostrar una vista donde sea vea el nombre de tienda y la cantidad de entradas de personas que hubo desde la fecha de apertura. 
6. Mostrar la cantidad de unidades vendidas y el inventario promedio por cada dia y codigo de producto.
7. Mostrar la tabla ventas_items agregando una columna que represente el valor de venta en cada linea convertido a dolares usando la tabla de tipo de cambio.
8. Mostrar el margen de venta por cada orden de producto. Siendo margen = venta - costo. 
9. Mostrar el inventario promedio por dia.
10. Calcular cantidad de ventas totales por pais en dolares.


## Clase 4 
1. Hacer un update a la tabla de maestro de productos agregando la leyendo "N/A" para los valores null de material y color. 
2. Agregar una nueva columna a la tabla de ventas llamada "line_key" calculada en la Clase 3.  
3. Hacer un update al maestro de productos, columa "is_active", desactivando todos los productos en la subsubcategoria "Control Remoto". 
4. Hacer un update a la tabla costos, poniendo en null todos los productos en la subcategoria TV.
5. Eliminar todos los valores de la tabla ventas para el POS 9999.
6. Crear un backup de la tabla de tiendas. 
7. Crear una tabla llamada "empleados", por el momento vacia, que tenga un id (creado de forma incremental), nombre, apellido, fecha de entrada, fecha salida, telefono, documento identificacion, direccion, pais, provincia.
8. Insertar un valor a la tabla "empleados" con datos inventados pero posibles y que cumplan las definiciones de tipo de dato pactadas en el esquema.
