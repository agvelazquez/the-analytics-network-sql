## Ejercicio Integrador

- Luego de un tiempo de haber respondido todas las preguntas puntuales por los gerentes, la empresa decide ampliar el contrato para mejorar las bases de reporte de datos. Para esto quiere definir una serie de KPIs (Key Performance Indicator) que midan la salud de la empresa en diversas areas y ademas mostrar el valor actual y la evolucion en el tiempo. 

Por cada KPI listado vamos a tener que generar al menos una query (pueden ser mas de una) que nos devuelva el valor del KPI en cada mes, mostrando el resultado para todos los meses disponibles.

Todos los valores monetarios deben ser calculados en dolares usando el tipo de cambio promedio mensual. 

El objetivo no es solo encontrar la query que responda la metrica sino entender que datos necesitamos, que es lo que significa y como armar el KPI
General 
- Ventas brutas, netas y margen
- Margen por categoria de producto 
- ROI por categoria de producto. ROI = ventas netas / Valor promedio de inventario 
- AOV (Average order value), valor promedio de la orden. 

Contabilidad
- Impuestos pagados
- Tasa de impuesto. Impuestos / Ventas netas 
- Cantidad de creditos otorgados
- Valor pagado final por order de linea. Valor pagado: Venta - descuento + impuesto - credito

Supply Chain
- Costo de inventario promedio por tienda
- Costo del stock de productos que no se vendieron por tienda
- Cantidad y costo de devoluciones

Tiendas
- Ratio de conversion. Cantidad de ordenes generadas / Cantidad de gente que entra

Por otro lado tambien necesitamos crear y subir a nuestra DB la tabla "return_movements" para poder utilizarla en la segunda parte.

## Preguntas de entrevistas

1. Como encuentro duplicados en una tabla. Dar un ejemplo mostrando duplicados de la columna orden en la tabla de ventas.
2. Como elimino duplicados?
3. Cual es la diferencia entre UNION y UNION ALL.
4. Como encuentro registros en una tabla que no estan en otra tabla.
    - Para probar podes crear dos tablas con una unica columna id que tengan valores: Tabla 1: 1,2,3,4 Tabla 2: 3,4,5,6
6. Cual es la diferencia entre INNER JOIN y LEFT JOIN. (podes usar la tabla anterior)
