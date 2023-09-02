## Objetivos

Luego de un tiempo de haber respondido todas las preguntas puntuales por los gerentes en [Homework Parte 1](https://www.notion.so/Homework-Parte-1-ef75e804281e4d6b8863327dc1b87be1?pvs=21) , la empresa decide ampliar el contrato para mejorar las bases de reporte de datos. Para esto quiere definir una serie de KPIs (Key Performance Indicator) que midan la salud de la empresa en diversas areas y ademas mostrar el valor actual y la evolucion en el tiempo.

Por cada KPI listado vamos a tener que generar al menos una query (pueden ser mas de una) que nos devuelva el valor del KPI en cada mes, mostrando el resultado para todos los meses disponibles.

Todos los valores monetarios deben ser calculados en dolares usando el tipo de cambio promedio mensual.

El objetivo no es solo encontrar la query que responda la metrica sino entender que datos necesitamos, que es lo que significa y como armar el KPI

### General

- Ventas brutas, netas y margen (USD)
    - Los nombres de columnas a utilizar son: `sales_usd`, `net_sales_usd`, `margin_usd`
- Margen por categoria de producto (USD)
    - Los nombres de columnas a utilizar son: `margin_usd`
- ROI por categoria de producto. ROI = ventas netas / Valor promedio de inventario (USD)
    - Los nombres de columnas a utilizar son: `roi`
- AOV (Average order value), valor promedio de la orden. (USD)
    - Los nombres de columnas a utilizar son: `aov`

Calcular cada metrica a nivel mes-año.

### Contabilidad

- Impuestos pagados (USD)
    - Los nombres de columnas a utilizar son: `tax_usd`
- Tasa de impuesto. Impuestos / Ventas netas (USD)
    - Los nombres de columnas a utilizar son: `tax_rate`
- Cantidad de creditos otorgados (USD)
    - Los nombres de columnas a utilizar son: `credit_usd`
- Valor pagado final por order de linea. Valor pagado: Venta - descuento + impuesto - credito (USD)
    - Los nombres de columnas a utilizar son: `amount_paid_usd`

Calcular cada metrica a nivel mes-año.

### Supply Chain

- Costo de inventario promedio por tienda (USD)
    - Los nombres de columnas a utilizar son: `inventory_cost_usd`
- Costo del stock de productos que no se vendieron por tienda (USD)
    - Los nombres de columnas a utilizar son: `inventory_cost_usd`
- Cantidad y costo de devoluciones (USD)
    - Los nombres de columnas a utilizar son: `quantity`, `returned_sales_usd`
    - ❗Vas a tener que subir el archivo de `returns` para resolver esto!

Calcular cada metrica a nivel mes-año.

### Tiendas

- Ratio de conversion. Cantidad de ordenes generadas / Cantidad de gente que entra
    - Los nombres de columnas a utilizar son: `cvr`

Calcular cada metrica a nivel mes-año.
