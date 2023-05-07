## Ejercicio Integrador Parte 3 (WORK IN PROGRESS)


La empresa en la cual venimos trabajando le gusto lo que hicimos hasta ahora y quiere que podamos escalar los resultados para que se implemente una herramienta de BI - Business Intelligent y pueda recibir los datos que la empresa genera dia a dia. Para eso le comentamos que nuestra solucion es generar un Data Warehouse junto con un proceso de ETL para tener una infrastructura que permite ampliar mas casos de uso y ademas ingerir datos de forma sistemica.
Luego en el ultimo paso asi poder implementar una herramienta de BI. 

Debajo vamos a encontrar los pasos que le comunicamos a la empresa y que vamos a tener que realizar para poder hacer realidad el pedido. 

Para organizar la estructura del Data Warehouse (DW) en el repositorio, vamos a crear una carpeta llamada **"retail-data-warehouse"** dentro de la carpeta actual "project".  A su vez la carpeta va a tener la siguiente estructura de carpetas: 

- retail-data-warehouse 
    - bkp
    - stg
    - fct
    - dim
    - forge
    - analytics
    - viz

Dentro de cada carpeta vamos a poner un script por cada "modelo" y cada carpeta representa un esquema del DW. Este paso lo podes hacer una vez que tenes al menos un archivo por carpeta o podes realizarlo al princpio y colocando un archivo vacio llamado "placeholder.md" que luego podes borrar. 


1. Vamos a reciclar el script de ddl.sql que utilizamos al principio de todo junto con los scripts de "returns", "supplier" y "employee" para armar la estructura de nuestra carpeta stg. Crear POR CADA TABLA en stg un archivo en la carpeta stg con el ddl de cada tabla cuyo nombre sera el nombre de la tabla. Ejemplo: "cost.sql". No es necesario correrlos nuevamente, asi reutilizamos lo que ya tenemos. 
2. Limpiar cualquier otra tabla (si existiese) que nos haya quedado de las partes anteriores que no corresponda al Data Warehouse. 
3. Crear un script para cada tabla dentro de fct y dim, con sus respectivas PK and FK. Tener en consideracion que tablas son de "fact" o 'hechos" y que tablas son "dimensional" o "dimensionales".
4. Editar el script de la tabla "employee" para que soporte un esquema de SDC (Slow changing dimension). 
5. Utilizar el esquema "forge" para crear vistas que nos sirvan para generar agregaciones que despues sean utiles en nuestras tablas de analytics. Ejemplo: agregar la tabla de "suppliers" para que no genere duplicados. 
6. Crear 4 tablas de analytics: 
    - order_sale_line: Va a ser la misma tabla que hicimos para el TP Integrador de la Parte 2
    - order: 
    - return:
    - inventory: 
7. Crear una Guia de estilo que va a a marcar los estadares de sintaxis para cualquier desarrollo del DW. (podes usar la misma que mostramos en clase o editarla!) 
8. Crear una base de datos que se llame "dev". Correr todos los scripts de ddl para tener la estructura en un ambiente que vamos a usar para el desarrollo y testeo de nuevas queries.
9. Encapsular la logica de conversion de moneda en una funcion y reutilizarla en los scripts donde sea necesario. 
10. (WIP) Crear store procedures que generen backus de todas las tablas en esquema stg.
11. Crear una tabla de logging que indique cada vez que se realicen modificaciones a una tabla con la siguiente informacion: 
    - Tabla modificada
    - Fecha de modificacion.
    - Stored procedure responsable de la modificacion. 
13. (Opcional): Conectar la tabla de order_sale_line a PowerBI y realizar una visualizacion que resuma el estado de ventas y ganancias de la empresa.
