## Objetivos Parte 3


La empresa en la cual venimos trabajando le gusto lo que hicimos hasta ahora y quiere que podamos escalar los resultados para que se implemente una herramienta de BI - Business Intelligent y pueda recibir los datos que la empresa genera día a día. Para eso le comentamos que nuestra solución es generar un Data Warehouse junto con un proceso de ETL para tener una infraestructura que permite ampliar mas casos de uso y ademas ingerir datos de forma sistemica. Luego en el ultimo paso así poder implementar una herramienta de BI.

Debajo vamos a encontrar los pasos que le comunicamos a la empresa y que vamos a tener que realizar para poder hacer realidad el pedido.
<br>

### Parte 1 - Organización de nuestro repo

El repositorio de git, que actualmente tenemos en Github, es el núcleo de nuestro código. Git nos permite trabajar colaborativamente y de tener versionados nuestros archivos, es decir tener guardado versiones anteriores, los cambios y la capacidad de recuperarlos.

Todas las empresas, de una u otra manera, usan git. Por eso nosotros también vamos a armar nuestro repositorio.

#### Estructura de carpetas 
Para organizar la estructura del Data Warehouse (DW) en el repositorio, vamos a crear una carpeta llamada **retail-data-warehouse** dentro de la carpeta actual **project**. A su vez la carpeta va a tener la siguiente estructura de carpetas:

- retail-data-warehouse
    - stg
    - etl
    - fct
    - dim
    - analytics
    - bkp
    - log

Dentro de cada carpeta vamos a poner un script por cada "modelo" y cada carpeta representa un esquema del DW. Este paso lo podes hacer una vez que tenes al menos un archivo por carpeta o podes realizarlo al principio y colocando un archivo vacío llamado "placeholder.md" que luego podes borrar.

1. Crear las carpetas mencionadas previamente en git y los schemas con el mismo nombre en PostgreSQL. Deberias tener un schema por cada punto mencionado arriba. `stg` y `bkp` no hace falta crearlo ya que lo tenemos de las proyectos anteriores.
2. Vamos a reciclar el script de `ddl.sql` que utilizamos al principio y sumarle los scripts de "**returns**", "**supplier**", "**employee**" y calendario para armar la estructura de nuestra carpeta stg. Crear POR CADA TABLA en stg un archivo en la carpeta stg con el ddl de cada tabla cuyo nombre sera el nombre de la tabla. Ejemplo: "cost.sql". No es necesario correrlos nuevamente, así reutilizamos lo que ya tenemos.
    1. Nosotros ya creamos los scripts para cada tabla del ddl! Lo unico que tenes que hacer es sumarle los de `return_movements`, `supplier` y `employee` con el mismo formato de nombre: Ejemplo `stg_supplier`
3. Limpiar cualquier otra tabla (si existiese) que nos haya quedado de las partes anteriores que no corresponda al Data Warehouse.
    1. Las tablas (y scripts) que deberíamos tener en staging son las siguientes:
        1. `stg.cost`
        2. `stg.inventory`
        3. `stg.market_count`
        4. `stg.monthly_average_fx_rate`
        5. `stg.order_line_sale`
        6. `stg.product_master`
        7. `stg.return_movements`
        8. `stg.store_master`
        9. `stg.super_store_count`
        10. `stg.supplier`
        11. `stg.employee`

Nota: Git se utiliza en todos los trabajos de desarrollo de software y data, es importante que conozcas todas las funcionalidades, como manejarlo por consola y con algún proveedor como puede ser Github o Gitlab.

<br>

### Parte 2 - Creación de un ambiente de desarrollo

---

Todos los proyectos de una u otra manera tienen un lugar de desarrollo, es decir un ambiente separado donde se puedan hacer cambios sin influir a los datos que ve el usuario final. Hay muchas formas de aplicar esto dependiendo en dónde estemos trabajando. Nosotros vamos a montar el ambiente de desarrollo en una nueva base de datos.

1. Crear una base de datos que se llame `dev`. Correr todos los scripts de ddl para tener la estructura en un ambiente que vamos a usar para el desarrollo y testeo de nuevas queries.

No es es necesario subir ningún dato, solo crear la base de datos y correr el ddl.sql. Vamos a mantener la estructura vacía y manejarnos en la base de datos inicial. 
Este ejercicio es solamente ilustrativo para mostrar la existencia de un ambiente de desarrollo, que es obligatoria en todo proyecto grande junto con Git para versionar archivos.

### Parte 3 - Creación de un modelo dimensional

---

1. Crear un script de `ddl` para cada tabla dentro de `fct` y `dim`, con sus respectivas PK and FK en la creacion de tabla.
    - Decidir en cada caso si es necesario crear una clave surrogada o no.
    - Podes usar el script ****dim_cost.sql**** como ejemplo.
    - Asegurarse que las PK y FK tengan el mismo tipo de dato en cada tabla y sea el correspondiente para cada caso.
2. Editar el script de la tabla `employee` para que soporte un esquema de SDC (Slow changing dimension) cuyo objetivo debe ser capturar cuales son los empleados activos y el periodo de duracion de cada empleado.
3. Generar un ERD para el modelo dimensional creado con las tablas `fct` y `dim`, descargarlo en PDF o JPEG/JPG y sumarlo al repositorio del proyecto. Podes usar el ERD que genera `pgadmin` haciendo click derecho en el nombre de la DB.

Las tablas que deberíamos tener en en este paso son las siguientes:

1. `dim.cost`
2. `dim.product_master`
3. `dim.store_master`
4. `dim.supplier_product`
5. `dim.employee`
6. `dim.date`
7. `fct.inventory`
8. `fct.store_traffic`
9. `fct.fx_rate`
10. `fct.return_movements`
11. `fct.order_line_sale`

### Parte 4 - Logging

---

Logging es la practica que nos permite guardar registro de los cambios que se van produciendo en el DW y es una forma de auditar en caso de haya errores en los datos.

1. Crear una tabla de logging que indique cada vez que se realicen modificaciones a una tabla con la siguiente información:
    - La tabla se va a llamar `log.table_updates`. Generar un script con la creacion de la tabla y guardarlo en la carpeta correspondiente.
    - Tabla modificada (fct, dim o analytics): `table_name`
    - Fecha de modificación. `date`
    - Stored procedure responsable de la modificación. `stored_procedure`
    - Usuario que corrio el stored procedures `username`
2. Crear un stored procedure (SP) que llene la tabla de `log`.
    1. Generar el script y guardarlo en la carpeta de `etl`.
    2. El SP se va a ejectura cada vez que corra cualquier SP de creacion/update de tabla dim/fct, es decir lo vas a poner dentro de los SP que vamos a ver en la proxima seccion.
    3. El SP va a tomar como parametros todo lo que se encuentra en el SP de creacion/update de la tabla. Si queres podes dejar este paso para despues de el paso siguiente!

Nota: a las tablas anteriores en `dim` y `fct` se le va a sumar `log.table_updates`.

### Parte 5 - Creación de los proceso de transformación

---

Para nuestro poryecto vamos a realizar las transformaciones de datos dentro de `stored procedures` del esquema `etl`. Esta parte es la encargada de limpiar las datos crudos y realizar las transformaciones de negocio hasta la capa de analytics.

`stg` -> Modelo dimensional (`fct`/`dim`)

1. Ahora vas a generar un stored procedure por cada tabla en `dim` y `fct` con el proceso de transformacion correspondiente desde la tabla stg hasta el modelado dimensional.  ❗Es posible que tengas que volver a editar los scripts de creacion de tablas.
    1. El objetivo de este paso es que las tablas `fct`/`dim` queden "limpias" y validadas y listas para ser usadas para analisis. Por lo tanto, van a requerir que hagas los cambios necesarios que ya vimos en la parte 1 y 2 para que queden lo mas completa posibles: 
        1. Tabla `dim.product_master`
            - Agregar columna `brand` y realizar la homogenizacion de la columnas `material` y `color`, donde los valores esten en Init Cap y en caso de nullo poner `‘Unknown’`.
            - Vamos a insertar nuevos valores y actualizar en caso que existan.
        2. Tabla `dim.cost`
            - No insertar registros en caso de que no existan en la `dim.product_master`
            - Vamos a insertar nuevos valores y actualizar en caso que existan.
        3. Tabla `dim.date`
            - Nombres de meses y fechas tienen que tener la inicial mayuscula.
            - La tabla tiene que tener por lo menos 5 años hacia adelante.
        4. Tabla `dim.supplier_product`
            - Limpiar la tabla de supplier dejando uno por producto.
            - No insertar registros en caso de que no existan en la `dim.product_master`
        5. Tabla `dim.employee`
            - La tabla debe ser una SCD tipo 2.
            - Agregar columnas de `is_active` y `duration` en dias.
        6. Tabla `fct.store_traffic` 
            - Las tablas de trafico a tienda de ambos sistemas deben centrarlizarse en una sola tabla.
            - La fecha debe estar en formato `date`
            - Insertar unicamente nuevos registros
        7. Tabla `fct.fx_rate` 
            - Insertar unicamente nuevos registros
        8. Tabla `fct.order_line_sale`
            - Insertar unicamente nuevos registros
            - Agregar la columan `line_key`
        9. Tabla `fct.inventory`
            - Insertar unicamente nuevos registros
        10. Tabla `fct.return_movements`
            - Insertar unicamente nuevos registros
        11. General: 
            - Tipo de dato: Cambiar el tipo de dato en caso que no sea correcto.
2. Crear un stored procedures que haga un backup de todas las tablas `dim` y `fct` en el nuevo schema `bkp`. La idea es que los datos puedan ser recuperados rapidamente en caso de errores/fallas en los scripts de transformacion.
    1. Podes usar el comando `select into` y es recomendable que cada backup tenga el mismo nombre de la tabla. Tambien podes usar un sufijo con la fecha para identificar diferentes backups.
3. Una vez creado el script de transformacion, muevan los actuales en las tablas `stg` con los que vinimos trabajando a el modelo dimensional `dim`/`fct`. 
4. **Opcional.** Descargar y configurar pgAgent para programar la corrida de los stored procedures.  https://www.pgadmin.org/docs/pgadmin4/development/pgagent.html

**Nota:** 

- Evitar el uso de `select *`, en cambio mencionar las columnas.
- Recomendable `stagear` los datos en un cte previo a insertar dentro del script de SP.
- En esta parte no vamos a `castear` muchas columna a los tipos de datos correspondientes por que ya los teniamos desde `stg` con el formato correcto, pero es una practica comun comenzar con todas las columnas tipo *varchar* y luego transformarlos para la siguiente capa.
- No te olvides de poner el llamado del SP de logging en cada stored procedure creado en la parte de transformacion de las tablas `stg` a `dim` y `fact` y de las tablas de `analytics`.

### Parte 6 - Creación de la “Analytics layer”

---

La capa de analytics es aquella que se va a conectar con nuestras herramientas de BI. Para esto vamos a crear un nuevo stored procedure donde vamos a escribir la logica de cada script con un modelo del tipo truncate and select into. En la Parte Testing, mas adelante, vamos a agregarle algunas comprobaciones.

1. Crear tres tablas de analytics:
    - `analytics.order_sale_line`
        - Va a ser la misma tabla que hicimos para el TP Integrador de la Parte 2.
        - Cambiar las fuentes de stg a el nuevo modelo dimensional.
    - `analytics.return`
        - El objetivo es ver las ordenes de devoluciones con las dimensiones/atributos del producto retornado y de la tienda en la cual fue originalmente comprado el producto (de la orden de venta) junto con el valor de venta del producto retornado (es nuestra manera de cuantificar el valor de la devolucion)
        - Nota:
            - Obviamente valores de devolucion deben estar en moneda original y USD.
            - La tabla de retornos indica movimientos del item una vez que viene del cliente a nuestra tienda, cuidado con repetir valores, nosotros queremos entender unicamente las ordenes-productos retornados no los movimientos que tuvo cada retorno.
    - `analytics.inventory`
        - El objetivo es ver un historico del inventario promedio por dia, con todas las dimensiones/atributos de producto (categoria, descripcion, etc.), dimensiones de la tienda (pais, nombre, etc) y el costo de los productos para poder cuantificar los inventario.
2. Crear los stored procedures para generar las tablas de analytics a partir del modelo dimensional. Los SP van a recrear la tabla cada cada vez que se corra (`truncate and insert`) y va a contener toda la logica de cada tabla.
    - El proceso de creacion de las tablas de analytics va a ser del tipo `truncate and create` ya que estas tablas son las que mayores modificaciones van a tener al codigo dado que las logicas del negocio van mutando constantement o requieren nuevos features.

### Parte 7 - Funciones

---

1. Encapsular la lógica de conversion de moneda en una función y reutilizarla en los scripts donde sea necesario.
    1. Va a ser necesario que edites los scripts donde uses la conversion. 
2. **Opcional**. Que otra logica podemos encapsular en una funcion? La idea es encontrar transformaciones que se repitan en varios lados. Si encontraste y crees que tiene sentido crear una funcion, hacelo!

### Parte 8 - Optimizacion de queries

---

1. Que acciones podrias tomar para mejorar la performance de las queries que tenemos segun lo que vimos en clase? Algunas cosas a tener en cuenta son:
    - Tipos de joins.
    - Columnas seleccionadas.
    - Columnas usadas en la clausula `on` del `join`.
    - Posibilidad de crear indices.
    - Posibilidad de crear covering index.
    - Mira el plan de ejecucion de las queries complejas e identifica si algun paso se puede evitar.
    - Mira ordenamientos innecesarios.
    - Orden de las `composite key` y los `joins` realizados.
    

### Parte 9 - Testing

---

Cada proyecto tiene que tener como minimo testeos de nivel de agregacion del nivel de detalle. En este caso estamos cubiertos por que las `PK` y las `FK` son retricciones de unicidad y nulidad. 

Como las tablas de `analytics` se crean todo el tiempo, en este caso en vez de agregar `PK` vamos a agregar testeos de nivel de agregacion y nulidad en los stored procedures que lo crean. 

1. Agregar validacion de unicidad del nivel de agregacion para cada tabla de `analytics` dentro del SP de creacion. Puede ser a traves de la creacion de un SP o como una query en el mismo SP.

### Parte 10 - Guia de estilo

---

1. Crear una Guia de estilo que va a a marcar los estándares de sintaxis para cualquier desarrollo del DW.
    1. Podes usar la misma que mostramos en clase o editarla, pero debes agregarla a tu repositorio en caso de que aun no este. **Nota:** Si forkeaste el repo completo ya vas a tener incluido la guia de estilo recomendada por nosotros.

### Parte 11 - Opcional

---

1. Opcional - Conectar la tabla de `analytics.order_sale_line` a PowerBI y realizar una visualización que resuma el estado de ventas y ganancias de la empresa.





















