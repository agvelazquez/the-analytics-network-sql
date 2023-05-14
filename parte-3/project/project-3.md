## Ejercicio Integrador Parte 3 (WORK IN PROGRESS)


La empresa en la cual venimos trabajando le gusto lo que hicimos hasta ahora y quiere que podamos escalar los resultados para que se implemente una herramienta de BI - Business Intelligent y pueda recibir los datos que la empresa genera día a día. Para eso le comentamos que nuestra solución es generar un Data Warehouse junto con un proceso de ETL para tener una infraestructura que permite ampliar mas casos de uso y ademas ingerir datos de forma sistemica.
Luego en el ultimo paso así poder implementar una herramienta de BI. 

Debajo vamos a encontrar los pasos que le comunicamos a la empresa y que vamos a tener que realizar para poder hacer realidad el pedido. 


### Parte 1 - Organización de nuestro repo

El repositorio de git, que actualmente tenemos en Github, es el núcleo de nuestro código. Git nos permite trabajar colaborativamente y de tener versionados nuestros archivos, es decir tener guardado versiones anteriores, los cambios y la capacidad de recuperarlos. 

Todas las empresas, de una u otra manera, usan git. Por eso nosotros también vamos a armar nuestro repositorio. 

#### Estructura de carpetas 
Para organizar la estructura del Data Warehouse (DW) en el repositorio, vamos a crear una carpeta llamada **"retail-data-warehouse"** dentro de la carpeta actual "project".  A su vez la carpeta va a tener la siguiente estructura de carpetas: 

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
2. Vamos a reciclar el script de ddl.sql que utilizamos al principio y sumarle los scripts de "returns", "supplier" y "employee" para armar la estructura de nuestra carpeta stg. Crear POR CADA TABLA en stg un archivo en la carpeta stg con el ddl de cada tabla cuyo nombre sera el nombre de la tabla. Ejemplo: "cost.sql". No es necesario correrlos nuevamente, así reutilizamos lo que ya tenemos. 
3. Limpiar cualquier otra tabla (si existiese) que nos haya quedado de las partes anteriores que no corresponda al Data Warehouse. 
    1. Las tablas que deberíamos tener en staging son las siguientes: 
        1. Cost
        2. Inventory 
        3. Market_count 
        4. Monthly_average_fx_rate
        5. Order_line_sale
        6. Product_master
        7. Return_movements
        8. store_master
        9. super_store_count
        10. Supplier
        11. Employee
4. Crear una base de datos que se llame "dev". Correr todos los scripts de ddl para tener la estructura en un ambiente que vamos a usar para el desarrollo y testeo de nuevas queries. No es es 

Nota: Git se utiliza en todos los trabajos de desarrollo de software y data, es importante que conozcas todas las funcionalidades, como manejarlo por consola y con algún proveedor como puede ser Github o Gitlab.

### Parte 2 - Creación de un ambiente de desarrollo 

Todos los proyectos de una u otra manera tienen un lugar de desarrollo, es decir un ambiente separado donde se puedan hacer cambios sin influir a los datos que ve el usuario final. Hay muchas formas de aplicar esto dependiendo en dónde estemos trabajando.
Nosotros vamos a montar el ambiente de desarrollo en una nueva base de datos. 

1. Crear una base de datos que se llame "dev". Correr todos los scripts de ddl para tener la estructura en un ambiente que vamos a usar para el desarrollo y testeo de nuevas queries. 

No es es necesario subir ningún dato, vamos a mantener la estructura vacía y manejarnos en la base de datos inicial. Este ejercicio es solamente para mostrar la existencia de un ambiente de desarrollo, que es obligatoria en todo proyecto grande. 


### Parte 3 - Creación de un modelo dimensional

1. Crear un script de ddl para cada tabla dentro de fct y dim, con sus respectivas PK and FK en la creacion de tabla. 
      - Decidir en cada caso si es necesario crear una clave surrogada o no. 
2. Editar el script de la tabla "employee" para que soporte un esquema de SDC (Slow changing dimension). para capturar cuales son los empleados activos y el periodo de duracion de cada empleado. 
3. Generar un ERD para el modelo dimensional creado con las tablas de hechos y de dimensiones, descargarlo en PDF y sumarlo al repositorio del proyecto.


### Parte 4 - Creación de los proceso de transformación

1. (WIP) Crear store procedures que generen backup de todas las tablas en esquema stg.


### Parte 5 - Creación de la “Analytics layer”

La capa de analytics es aquella que se va a conectar con nuestras herramientas de BI. 
1. Crear tres tablas de analytics: 
    - order_sale_line: (Va a ser la misma tabla que hicimos para el TP Integrador de la Parte 2)
    - return
    - inventory
2. Crear los stored procedures para generar las tablas de analytics a partir del modelo dimensional. Los SP van a recrear la tabla cada cada vez que se corra. 

### Parte 6 - Logging

1. Crear una tabla de logging que indique cada vez que se realicen modificaciones a una tabla con la siguiente información: 
    - Tabla modificada (fct, dim o analytics)
    - Fecha de modificación.
    - Stored procedure responsable de la modificación. 
2. Crear un stored procedure que llene la tabla de log. 
3. Poner el SP de logging en cada stored procedure creado.

### Parte 7 - Funciones

1. Encapsular la lógica de conversion de moneda en una función y reutilizarla en los scripts donde sea necesario. 
2. Que otra logica podemos transformar una funcion? La idea es encontrar transformaciones que se utilicen en varios lados. Si encontraste otros lados donde tiene sentido crear una funcion hacelo!

### Parte 8 - Optimizacion de queries


### Parte 9 - Testing

Cada proyecto tiene que tener como minimo testeos de nivel de agregacion del nivel de detalle. En este caso estamos cubiertos por que las PK y las FK son retricciones de unicidad y nulidad. En este punto no hay que hacer nada a menos que consideres agregar algun testeo extra de las PK y FK! 

### Parte 10 - Otros

1. Crear una Guia de estilo que va a a marcar los estándares de sintaxis para cualquier desarrollo del DW. (podes usar la misma que mostramos en clase o editarla!) 

### Parte 11 - Opcional

1. Opcional - Conectar la tabla de order_sale_line a PowerBI y realizar una visualización que resuma el estado de ventas y ganancias de la empresa.

