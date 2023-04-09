## Ejercicio Integrador Parte 2


Uno de los proyectos que viene trabajando nuestra empresa es de mejorar la visibilidad que le damos a nuestros principales KPIs que calculamos durante la Parte 1. Para eso, uno de los requisitos futuros va a ser crear una serie de dashboards en el cual podramos investigar cada metrica, su progresion en el tiempo y para diferentes cortes de los datos (Ejemplo: categoria, tienda, mes, producto, etc.). Para lograr esto, el primer objetivo es crear una tabla donde se pueda obtener todo esto en un mismo lugar. 

Nivel de detalle de la tabla: 
- Fecha 
- SKU 
- Tienda

Con los siguientes atributos 
- Tienda: Pais, provincia
- SKU: todas las categorias 
- Fecha: dia, mes, anio, anio fiscal, quarter fiscal

y que se pueda calcular las siguiente metricas: 
- Ventas brutas
- Promociones
- Ventas netas
- Valor final pagado
- ROI
- Days on hand
- Costos
- Margen bruto (gross margin)
- AGM (adjusted gross margin)

y la posibilidad de obtener para cada una de las metricas anteriores el crecimiento mes a mes. 

Notas: 
- No es necesario que este todo precalculado, sino que tenemos que generar una tabla lo suficientemente flexible para poder calcular todas las metricas listadas al nivel de de agregacion que querramos.
- Tiene que ser una tabla en lugar de una vista para que pueda ser consumido rapidamente por el usuario final. 
- La idea que este todo en un solo lugar facilita la creacion de una sola fuenta de la verdad ("single source of truth"). 
- AGM es el gross margen ajustado, es decir no solo tomar los costos de los productos sino tomar otros gastos o descuentos que hacen los proveedores al momento de vender el producto. Al ser fijos, estos tienen que distribuirse en los productos vendidos de manera proporcional. 
