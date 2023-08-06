## Objetivos Parte 2


Uno de los proyectos que viene trabajando nuestra empresa es de mejorar la visibilidad que le damos a nuestros principales KPIs que calculamos durante la Parte 1. 

Para eso, uno de los requisitos futuros va a ser crear una serie de dashboards en el cual podramos investigar cada metrica, su progresion en el tiempo y para diferentes cortes de los datos (Ejemplo: categoria, tienda, mes, producto, etc.). Para lograr esto, el primer objetivo es crear una vista donde se pueda obtener todo esto en un mismo lugar.

La vista la vamos a crear en el esquema `viz` y se va a llamar `order_sale_line` y va a contar con lo siguiente:

- Nivel de detalle de la tabla:
    - Fecha
    - SKU
    - Tienda
- Con los siguientes atributos:
    - Tienda: Pais, provincia, Nombre de tienda
    - SKU: Categoria, Subcategoria, Subsubcategoria, proveedor
    - Fecha: dia, mes, año, año fiscal, quarter fiscal

- La vista tiene que tener tal estructura que se pueda calcular las siguiente metricas y la posibilidad de ver el crecimiento en el tiempo de cada metrica:
    - Ventas brutas
    - Descuentos
    - Impuestos
    - Creditos
    - Ventas netas (inluye ventas y descuentos)
    - Valor final pagado (incluye ventas, descuentos, impuestos y creditos)
    - ROI
    - Costos
    - Margen bruto (gross margin)
    - AGM (adjusted gross margin)
    - AOV
    - Numero de devoluciones
    - Ratio de conversion.

Notas:

- ❗❗❗ No es necesario que este todo precalculado, la idea es generar una tabla lo suficientemente flexible para poder calcular todas las metricas listadas al nivel de de agregacion que querramos al hacer luego un `select`.
    - Ejemplo: AOV se compone como una division entre `ventas` y `ordenes`. Con tener ambas columnas es suficiente para lugar calcular el AOV a cualquier nivel de detalle. Entonces en este caso no es necesario tener una columna que se llame AOV. Esto aplica a cualquier metrica que sea resultado de una division.
- La idea que este todo en un solo lugar facilita la creacion de una sola fuente de la verdad. S**ingle source of truth**.
- **AGM** es el margen bruto ajustado (Adjusted Gross Margin), es decir no solo tomar los costos de los productos sino tomar otros gastos o descuentos que hacen los proveedores al momento de vender el producto. Al ser fijos, estos tienen que distribuirse en los productos vendidos de manera proporcional.
    - Entonces el AGM seria algo asi -> AGM: Ventas netas - Costos - Otros Gastos + Otros Ingresos
    - En este caso se nos pide que distribuyamos el ingreso extra de una TV dentro de los productos que se vendieron de Phillips. Es decir los unicos productos donde el Margen bruto va a ser distintos al AGM es en los productos Phillips.
- El periodo fiscal de la empresa empieza el primero de febrero.
- Las metricas tienen que estar calculadas en dolares.
