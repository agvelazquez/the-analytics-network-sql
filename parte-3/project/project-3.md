## Ejercicio Integrador Parte 3


La empresa en la cual venimos trabajando le gusto lo que hicimos hasta ahora y quiere que podamos escalar los resultados para que se implemente una herramienta de BI - Business Intelligent y pueda recibir los datos que la empresa genera dia a dia. Para eso le comentamos que nuestra solucion es generar un Data Warehouse junto con un proceso de ETL para tener una infrastructura que permite ampliar mas casos de uso y ademas ingerir datos de forma sistemica.
Luego en el ultimo paso asi poder implementar una herramienta de BI. 

Debajo vamos a encontrar los pasos que le comunicamos a la empresa y que vamos a tener que realizar para poder hacer realidad el pedido. 

Para organizar la estructura del Data Warehouse (DW) en el repositorio, vamos a crear una carpeta llamada **"retail-data-warehouse"** dentro de la carpeta actual "project".  A su vez la carpeta va a tener la siguiente estructura de carpetas: 

\\retail-data-warehouse 
    \\bkp
    \\stg
    \\fct
    \\dim
    \\forge
    \\analytics
    \\viz

Dentro de cada carpeta vamos a poner un script por cada "modelo" y cada carpeta representa un esquema del DW. Este paso lo podes hacer una vez que tenes al menos un archivo por carpeta o podes realizarlo al princpio y colocando un archivo vacio llamado "placeholder.md" que luego podes borrar. 

├── src
│   ├── controller
│   │   ├── **/*.css
│   ├── views
│   ├── model
│   ├── index.js
├── public
│   ├── css
│   │   ├── **/*.css
│   ├── images
│   ├── js
│   ├── index.html
├── dist (or build
├── node_modules
├── package.json
├── package-lock.json 
└── .gitignore
