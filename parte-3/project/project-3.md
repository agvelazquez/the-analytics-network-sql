## Ejercicio Integrador Parte 3


La empresa en la cual venimos trabajando le gusto lo que hicimos hasta ahora y quiere que podamos escalar los resultados para que se implemente una herramienta de BI - Business Intelligent y pueda recibir los datos que la empresa genera día a día. Para eso le comentamos que nuestra solución es generar un Data Warehouse junto con un proceso de ETL para tener una infraestructura que permite ampliar mas casos de uso y ademas ingerir datos de forma sistemica.
Luego en el ultimo paso así poder implementar una herramienta de BI. 

Debajo vamos a encontrar los pasos que le comunicamos a la empresa y que vamos a tener que realizar para poder hacer realidad el pedido. 

<br>

### Parte 1 - Organización de nuestro repo

El repositorio de git, que actualmente tenemos en Github, es el núcleo de nuestro código. Git nos permite trabajar colaborativamente y de tener versionados nuestros archivos, es decir tener guardado versiones anteriores, los cambios y la capacidad de recuperarlos. 

Todas las empresas, de una u otra manera, usan git. Por eso nosotros también vamos a armar nuestro repositorio. 

#### Estructura de carpetas 
Para organizar la estructura del Data Warehouse (DW) en el repositorio, vamos a crear una carpeta llamada **retail-data-warehouse** dentro de la carpeta actual **project**.  A su vez la carpeta va a tener la siguiente estructura de carpetas: 

- retail-data-warehouse 
    - stg
    - etl
    - fct
    - dim
    - analytics
    - viz
    - bkp
    - log

Dentro de cada carpeta vamos a poner un script por cada "modelo" y cada carpeta representa un esquema del DW. Este paso lo podes hacer una vez que tenes al menos un archivo por carpeta o podes realizarlo al principio y colocando un archivo vacío llamado "placeholder.md" que luego podes borrar. 

1. Crear las carpetas mencionadas previamente.
2. Vamos a reciclar el script de ddl.sql que utilizamos al principio y sumarle los scripts de "returns", "supplier", "employee" y calendario para armar la estructura de nuestra carpeta stg. Crear POR CADA TABLA en stg un archivo en la carpeta stg con el ddl de cada tabla cuyo nombre sera el nombre de la tabla. Ejemplo: "cost.sql". No es necesario correrlos nuevamente, así reutilizamos lo que ya tenemos. 
3. Limpiar cualquier otra tabla (si existiese) que nos haya quedado de las partes anteriores que no corresponda al Data Warehouse. 
    1. Las tablas que deberíamos tener en staging son las siguientes: 
        1. Cost
        2. Inventory 
        3. Market_count 
        4. Monthly_average_fx_rate
        5. Order_line_sale
        6. Product_master
        7. Return_movements
        8. Store_master
        9. Super_store_count
        10. Supplier
        11. Employee
4. Crear una base de datos que se llame "dev". Correr todos los scripts de ddl.sql para tener la estructura en un ambiente que vamos a usar para el desarrollo y testeo de nuevas queries. No es es necesario llenarlo de datos ni de crear nuevos scripts para la base de desarrollo. Los scripts son unicos y deben permanecer en el repositorio. 

Nota: Git se utiliza en todos los trabajos de desarrollo de software y data, es importante que conozcas todas las funcionalidades, como manejarlo por consola y con algún proveedor como puede ser Github o Gitlab.

<br>

### Parte 2 - Creación de un ambiente de desarrollo 

Todos los proyectos de una u otra manera tienen un lugar de desarrollo, es decir un ambiente separado donde se puedan hacer cambios sin influir a los datos que ve el usuario final. Hay muchas formas de aplicar esto dependiendo en dónde estemos trabajando.
Nosotros vamos a montar el ambiente de desarrollo en una nueva base de datos. 

1. Crear una base de datos que se llame "dev". Correr todos los scripts de ddl para tener la estructura en un ambiente que vamos a usar para el desarrollo y testeo de nuevas queries. 

No es es necesario subir ningún dato, vamos a mantener la estructura vacía y manejarnos en la base de datos inicial. Este ejercicio es solamente para mostrar la existencia de un ambiente de desarrollo, que es obligatoria en todo proyecto grande. 

<br>

### Parte 3 - Creación de un modelo dimensional

1. Crear un script de ddl para cada tabla dentro de fct y dim, con sus respectivas PK and FK en la creacion de tabla. 
      - Decidir en cada caso si es necesario crear una clave surrogada o no. 
2. Editar el script de la tabla "employee" para que soporte un esquema de SDC (Slow changing dimension) cuyo objetivo debe ser capturar cuales son los empleados activos y el periodo de duracion de cada empleado. 
3. Generar un ERD para el modelo dimensional creado con las tablas de hechos y de dimensiones, descargarlo en PDF y sumarlo al repositorio del proyecto.

<br>

### Parte 4 - Creación de los proceso de transformación

Para nuestro poryecto vamos a realizar las transformaciones de datos dentro de stored procedures del esquema etl. Esta parte es la encargada de limpiar las datos crudos y realizar las transformaciones de negocio hasta la capa de analytics.

stg -> Modelo dimensional (fct/dim)
1. Por default todas las tablas van a seguir el paradigma de truncate and insert, a menos que se indique lo contrario. 
2. El objetivo de este paso es que las tablas fact/dim queden "limpias" y validadas y listas para ser usadas para analisis. Por lo tanto, van a requerir que hagas los cambios necesarios que ya vimos en la parte 1 y 2 para que queden lo mas completa posibles. Te menciono algunos como ejemplo pero la lista puede no esta completa: 
    - Agregar columnas: ejemplo marca/"brand" en la tabla de producto. 
    - Las tablas store_count de ambos sistemas deben centrarlizarse en una tabla. 
    - Limpiar la tabla de supplier dejando uno por producto. 
    - Nombre de columnas:  cambiar si considerar que no esta claro. Las PK suelen llamarse "id" y las FK "tabla_id" ejemplo: "customer_id"
    - Tipo de dato: Cambiar el tipo de dato en caso que no sea correcto. 
3. Las tablas de "employee" y "cost" van a usar un modelo de actulizacion tipo "upsert". 
    - En caso de no se cumpla la condicion de FK no incluir esos SKUs. Como encadenarias el proceso?
5. La tabla de ventas (order_line_sale) y la tabla de inventario va a seguir un modelo incremental basado en la fecha. 


Opcional
1. Crear store procedures que generen backup de todas las tablas en esquema stg.
2. Descargar y configurar pgAgent para programar la corrida de los stored procedures. Nota: https://www.pgadmin.org/docs/pgadmin4/development/pgagent.html

Nota: En esta parte no vamos a castear a los tipos de datos correspondientes por que ya los teniamos desde stg con el formato correcto, pero es una practica comun comenzar con todas las columnas tipo *varchar* y luego transformarlos para la siguiente capa. 

<br>

### Parte 5 - Creación de la “Analytics layer”

La capa de analytics es aquella que se va a conectar con nuestras herramientas de BI. 
1. Crear tres tablas de analytics: 
    - order_sale_line 
        - Nota: Va a ser la misma tabla que hicimos para el TP Integrador de la Parte 2
    - return
        - El objetivo es ver las ordenes de devoluciones con las dimensiones/atributos del producto retornado y ademas la tienda y sus atributas en la cual fue originalmente comprado el producto (de la orden de venta) junto con el valor de venta del producto retornado (es nuestra manera de cuantificar el valor de la devolucion)
        - Nota: Obviamente valores de devolucion deben estar en moneda original y moneda comun. 
        - Nota2: La tabla de retornors indica movimientos del item una vez que viene del cliente a nuestra tienda, cuidado con repetir valores, nosotros queremos entender unciamente las ordenes-productos retornados no los movimientos que tuvo cada retorno.
    - inventory
       - El objetivo es ver el historico del inventario promedio por dia, con todas las dimensiones/atributos de producto (categoria, descripcion, etc.), dimensiones de la tienda (pais, nombre, etc) y el costo de los productos.
2. Crear los stored procedures para generar las tablas de analytics a partir del modelo dimensional. Los SP van a recrear la tabla cada cada vez que se corra y va a contener toda la logica de cada tabla. 
    - El proceso de creacion de las tablas de analytics va a ser del tipo "truncate and create" ya que estas tablas son las que mayores modificaciones van a tener al codigo dado que las logicas del negocio van mutando constantement o requieren nuevos features.

<br>

### Parte 6 - Logging

Logging es la practica que nos permite guardar registro de los cambios que se van produciendo en el DW y es una forma de auditar en caso de haya errores en los datos. 
1. Crear una tabla de logging que indique cada vez que se realicen modificaciones a una tabla con la siguiente información: 
    - Tabla modificada (fct, dim o analytics)
    - Fecha de modificación.
    - Stored procedure responsable de la modificación. 
    - Lineas insertadas/modificadas.
    - Usuario que corrio el stored procedures
2. Crear un stored procedure que llene la tabla de log. 
3. Poner el "call" del SP de logging en cada stored procedure creado en la parte de transformacion de las tablas stg a dim y fact y de las tablas de analytics.

<br>

### Parte 7 - Funciones

1. Encapsular la lógica de conversion de moneda en una función y reutilizarla en los scripts donde sea necesario. 
2. (Opcional) Que otra logica podemos encapsular en una funcion? La idea es encontrar transformaciones que se repitan en varios lados. Si encontraste y crees que tiene sentido crear una funcion, hacelo!

<br>

### Parte 8 - Optimizacion de queries

1. Que acciones podrias tomar para mejorar la performance de las queries que tenemos segun lo que vimos en clase? 
Algunas cosas a tener en cuenta son: 
- Tipos de joins
- Columnas seleccionada
- Columnas usadas en la clausula on del join. 
- Posibilidad de crear indices. 
- Posibilidad de crear covering index.
- Mira el plan de ejecucion de las queries complejas e identifica si algun paso se puede evitar. 
- Mira ordenamientos innecesarios.

<br>

### Parte 9 - Testing

Cada proyecto tiene que tener como minimo testeos de nivel de agregacion del nivel de detalle. En este caso estamos cubiertos por que las PK y las FK son retricciones de unicidad y nulidad. En este punto no hay que hacer nada a menos que consideres agregar algun testeo extra de las PK y FK! 

<br>

### Parte 10 - Otros

1. Crear una Guia de estilo que va a a marcar los estándares de sintaxis para cualquier desarrollo del DW. (podes usar la misma que mostramos en clase o editarla!) 

<br>

### Parte 11 - Opcional

1. Opcional - Conectar la tabla de order_sale_line a PowerBI y realizar una visualización que resuma el estado de ventas y ganancias de la empresa.

