# The Analytics Network - Guia de estilo de SQL
### "Las lineas de código son baratas, el tiempo de las personas es caro."

  - [Conceptos generales](#conceptos-generales)
  - [Sintaxis](#sintaxis)
    - [Joins](#joins)
    - [CTEs](#ctes)
  - [Naming](#naming)
  - [Formateo](#formateo)
  - [Creditos](#creditos)

<br>

## Conceptos generales

#### Optimizar el código para mejorar la lectura, manutención y robustez en vez de la cantidad de lineas de código
Las lineas de código son baratas, el tiempo de las personas es caro.

<br>

#### Cada linea no debería ser idealmente mayor a 120 caracteres.
Lineas de código largas son difíciles de leer.

<br>

#### Identificadores como alias o nombres de CTE deben escribirse en minúscula `snake_case`.
Es mas fácil de leer y de ser consistente, evitar capitalizaciones, espacios o otros caracteres especiales
<br>

#### Nunca usar palabras reservadas como identificadores.

#### Es preferible que todas las palabras reservadas y nombres de objetos (columnas, tablas, funciones, etc) esten en ingles.
Todos los motores de base de datos fueron contruidos en ingles, las sentencias son nativas en ingles y la cantidad de informacion disponible en internet en ingles es mucho mayor que en español. Ademas evitamos errores con caracteres desconocidos. 

<br>


## Sintaxis

#### Palabras claves y funciones deben estar en minuscula.
Minuscula es más fail de leer que mayuscula y no tenes que estar constantemente apretando la tecla shift.

```sql
/* Recomendado */
select *
from customers

/* Recomendado */
select count(*) as customers_count
from customers

/* No recomendado */
SELECT *
FROM customers

/* No recomendado */
Select *
From customers

/* No recomendado */
select COUNT(*) as customers_count
from customers
```

<br>

#### Usar `!=` en vez de`<>`.
`!=` se lee mas facil “no igual" que es mas entendible que usar `<>`.

<br>

#### Usar `||` en vez de `concat`.
`||` es un operador standard de SQL, y en algunos operadores (ejemplo Redshift) `concat` solo acepta dos argumentos.

<br>

#### Usar `coalesce` en vez de `ifnull` or `nvl`.
  - `coalesce` es universalmente aceptado, por ejemplo Redshift no tiene `ifnull` y BigQuery no tiene`nvl`.
  - `coalesce` es mas flexible y acepta mayor cantidad de argumentos

<br>

#### Usar `is null` en vez de `isnull`, y `is not null` en vez de `notnull`.
`isnull` y `notnull` son específicos de Redshift.

<br>

#### Usar `case` en vez de`iff` or `if`.
`case` statements son aceptados universalmente, mientras que Redshift no tiene `iff`, y BigQuery se llama `if` en vez de`iff`.

<br>

#### Siempre usar `as` cuando le vamos a poner alias a columnas o tablas

```sql
/* Recomendado */
select count(*) as customers_count
from customers

/* No recomendado */
select count(*) customers_count
from customers
```

<br>

#### Siempre ponerle un alias a las agregaciones

```sql
/* Recomendado */
select max(id) as max_customer_id
from customers

/* No recomendado */
select max(id)
from customers
```

<br>

#### Usar `where` en vez de `having` cuando cualquiera de los dos es suficiente.
Las queries filtran primero por “where” en el orden de ejecución por eso son más eficientes.

<br>

#### Usar `union all` en vez de `union` a menos que las filas duplicadas deban ser eliminadas.
`union all` es más eficiente por qué no tiene que ordenar y de-duplicar las filas.

<br>

#### Usar `select distinct` en vez de agrupar todas las columnas.
Hace que sea más clara la intención de la query. 

```sql
/* Recomendado */
select distinct
    customer_id
    , date_trunc('day', created_at) as purchase_date
from orders

/* No recomendado */
select
    customer_id
    , date_trunc('day', created_at) as purchase_date
from orders
group by 1, 2
```

<br>

#### Evitar usar `order by` a menos que sea necesario para producir el resultado correcto.
No hay necesidad de afectar la performance de la query.  Si el usuario final necesita los datos ordenados generalmente lo pueden hacer por si solos.


<br>

#### Usar `/* */` para la sintaxis de los comentarios.
Es mas fail de expandir los comentarios de una sola linea en multiples lineas sin cambiar la sintaxis. 

Cuando expandas a varias lineas
  - Mantener la primera linea `/*` en la primera linea del comentario y el ultimo `*/` en la misma linea del ultimo comentario.
  - Identar las subsecuentes lineas con una tabulación.

```sql
/* Recomendado */

-- No recomendado

/*  Recomendado:  Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    Dolor sed viverra ipsum nunc aliquet bibendum enim. */

/* No recomendado:  Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Dolor sed viverra ipsum nunc aliquet bibendum enim. */

-- No recomendado:  Lorem ipsum dolor sit amet, consectetur adipiscing elit,
-- sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
-- Dolor sed viverra ipsum nunc aliquet bibendum enim.
```

<br>

#### Usar “single-quote” para strings.
Algunos dialectos puede procesar doble comillas o hasta triple pero en la mayoria:
  - Doble comillas representan identificadores.
  - Triple comillas es para aquellos valores que tienen comillas per se.

```sql
/* Recomendado */
select *
from customers
where email like '%@domain.com'

/* No recomendado */
select *
from customers
where email like "%@domain.com"
/* Will probably result in an error like `column "%@domain.com" does not exist`. */

/* No recomendado */
select *
from customers
where email like '''%@domain.com'''
/* Will probably be interpreted like '\'%domain.com\''. */
```

<br>

### Joins

#### No uses `using` en joins.
  - Usar siempre `on`en todos los casos.
  - Si hay que agregar mas condiciones, `on` es mas fácil de adaptar.
  - `using` puede producir resultados inconsistentes con outer joins en algunas base de datos.

<br>

#### Usar `inner join` en vez de solo `join`.
Es mejor que sea explicito que tipo de join estamos utilizando.

```sql
/* Recomendado */
select *
from customers
inner join orders on customers.id = orders.customer_id

/* No recomendado */
select *
from customers
join orders on customers.id = orders.customer_id
```

<br>

#### En las condiciones del join, poner la tabla que fue referenciada primero inmediatamente después del`on`.
Es mas fácil entender la relación de los campos entre tablas y si va a haber una explosión de datos.

```sql
/* Recomendado */
select *
from customers
left join orders on customers.id = orders.customer_id
/* primary key = foreign key --> uno-a-muchos --> explosión */

/* Recomendado */
select *
from orders
left join customers on orders.customer_id = customers.id
/* foreign key = primary key --> muchos-a-uno --> no hay explosion */

/* No recomendado */
select *
from customers
left join orders on orders.customer_id = customers.id
```

<br>

#### Al joinear tablas siempre usar prefijos con el alias para cada columna.
La idea es que seas capaz de ver a simple vista de dónde viene la columna y evitar problemas donde el nombre de la columna es el mismo para diferentes tablas.

```sql
/* Recomendable */
select
    customers.email
    , orders.invoice_number
    , orders.total_amount
from customers
inner join orders on customers.id = orders.customer_id

/* No recomendado  */
select
    email
    , invoice_number
    , total_amount
from customers
inner join orders on customers.id = orders.customer_id
```

<br>

#### En los inner join poner los filtros en la clausula “where” en vez del “join”.
Solo las condiciones del join deben ponerse en la clausal del join, todas las condiciones de filtrado deben ir en el where.

```sql
/* Recomendado */
select
    ...
from orders
inner join customers on orders.customer_id = customers.id
where
    orders.total_amount >= 100
    and customers.email like '%@domain.com'

/* No recomendado  */
select
    ...
from orders
inner join customers on
    orders.customer_id = customers.id
    and customers.email like '%@domain.com'
where orders.total_amount >= 100
```
<br>

#### Priorizar `left join` sobre `right join`.
Si estas usando `right join` probablemente debas cambiar el orden de la tabla.

<br>

### CTEs

  - Si no hay problemas de performances, cada CTE debe realizar una única unidad de trabajo.
  - Los nombres de los CTEs deben ser los sufientemente explícitos para entender de qué se trata.
  - Los nombres de los CTEs no deben incluir la palabra “cte”
  - CTEs que son complejos debe estar comentados

<br>

#### Usar CTEs en vez de subqueries.
CTEs van a hacer las queries más fáciles de leer, entender la razón del por que esta ahi, más fail de debugger y pueden ser referenciadas multiples veces. Ademas son más faciales de adaptar o refactorizar más adelante.

```sql
/* Recomendado */
with
    paying_customers as (
        select *
        from customers
        where plan_name != 'free'
    )

select ...
from paying_customers

/* No recomendado */
select ...
from (
    select *
    from customers
    where plan_name != 'free'
) as paying_customers
```

<br>

## Naming

#### Nombrar las primary-keys de una columna con la palabra`id` o con usarlo en un sufijo.
Esto permite de ver fácilmente si la columna es una primary key y entender la relation con otras tablas (uno a muchos, muchos a uno, etc). 

```sql
/* Recomendado */
select ...
from orders
left join customers on orders.customer_id = customers.id
/* Facil de ver que es una relacion muchos a uno y que no va haber explosion de datos. */

/* No recomendado */
select ...
from orders
left join customers on orders.customer_id = customers.customer_id

/* Recomendado */
select ...
from orders
left join some_exceedingly_long_name on orders.order_id = some_exceedingly_long_name.id

/* No recomendado  */
select ...
from orders
left join some_exceedingly_long_name on orders.some_exceedingly_long_name_id = some_exceedingly_long_name.some_exceedingly_long_name_id
```

<br>


#### Nombrar las foreign-keys haciendo referencia a la tabla donde es PK un sufijo de `id`.
La idea es ser consistente y tener FK tales como "order_id", "customer_id", etc.

<br>


#### Columnas de fecha/hora:
  - Las columnas de fechas deben ser basadas en UTC y nombradas de la siguiente manera `<event>_date` o `<event>_dt`.
  - Aquellas que tengan una zona horaria especifica: `<event>_date_<timezone indicator>` (e.g. `order_date_et`).
  - Columnas con fecha y hora deben estar basadas en UTC y nombradas de la siguiente manera: `<event>_at`.
  - Si tienen alguna zona horaria especifica `<event>_at_<timezone indicator>` (ejemplo: `created_at_pt`).
  - Ejemplo de zona horaria de EEUU:
    - `et` = Eastern Time.
    - `ct` = Central Time.
    - `mt` = Mountain Time.
    - `pt` = Pacific Time.

<br>

#### Columnas booleanas:
  - Las columnas booleanas deben tener un prefijo en presente o pasada indicando a que hace referencia los valores True/False de la siguiente manera:
    - `is_` or `was_`.
    - `has_` or `had_`.
    - `does_` or `did_`.

<br>

#### Columnas con valores numéricos con una unidad de medida que se conoce deben tener un sufijo que indique la unidad de medida.
Ejemplos:
  - `price_usd`
  - `weight_oz`
  - `weight_kg`
  - `weight_grams`

<br>

#### Evitar utilizar alias de tablas no necesarios o difíciles de entender.
Sugerencias.
  - Si el nombre de la tabla tiene 3 palabras o menos no le pongas alias.
  - Si tiene mas, usa un subconjunto de las palabras como alias. (ejemplo: `partner_shipments_order_line_items` puede ser reverenciada como `line_items`).

```sql
/* Recomendado  */
select
    customers.email
    , orders.invoice_number
from customers
inner join orders on customers.id = orders.customer_id

/* No recomendado  */
select
    c.email
    , o.invoice_number
from customers as c
inner join orders as o on c.id = o.customer_id
```

<br>

## Formateo

El patron general a seguir es:
  - Si hay solo una cosa, ponerlo en la misma linea que la primera keyword.
  - Si hay multiples cosas, poner cada una en su propia linea incluyendo la primera, indentado un nivel con respecto a la primer keyword.

<br>

#### Poner todo a la izquierda por default.
Por default poner todo del lado izquierdo salvo casos mencionados en las distintas partes de este documento.

```sql
/* Recomendado  */
select email
from customers
where email like '%@domain.com'

/* No recomendado  */
select email
  from customers
 where email like '%@domain.com'
```

<br>

#### La indentación debe ser generalmente de 4 lineas o una tabulación.
```sql
/* Recomendado */
select
    id
    , email
from customers
where
    email like '%@domain.com'
    and plan_name != 'free'

/* No recomendado */
select
  id
  , email
from customers
where email like '%@domain.com'
  and plan_name != 'free'
```

<br>

#### Nunca terminar la linea con un operador `and`, `or`, `+`, `||`, etc.
Si hay alguno de estos operadores cada uno debe tener su linea y debemos ponerlo al inicio.
  - La idea es leer por arriba el lado izquierdo de la query y darse cuenta rápidamente la logica de la query, sin necesidad de leer toda lea linea.
  - Poner la condición en la misma linea que el operador lo hace mas claro de entender por que esta siendo usado.

```sql
/* No recomendado */
select *
from customers
where
    email like '%@domain.com' and
    plan_name != 'free'

/* Recomendado */
select *
from customers
where
    email like '%@domain.com'
    and plan_name != 'free'
```

<br>

#### Usar “leading commas”.
Si el coding tiene comas poner cada una en un nivel distinto, poner las comas al inicio seguidas de un espacio.
  - Es la forma mas fácil de ver si falta alguna coma.
  - La coma solo esta ahi por lo que sigue, si nada sigue la coma no tiene sentido por eso es mas claro y menos facil que haya errores si ponemos las comas adelante.

```sql
/* Recomendado */
with customers as (
        ...
    )
, paying_customers as (
        ...
    )
select
    id
    , email
    , date_trunc('month', created_at) as signup_month
from paying_customers
where email in (
        'user-1@example.com'
        , 'user-2@example.com'
        , 'user-3@example.com'
    )

/* No recomendado */
with
    customers as (
        ...
    ),
    paying_customers as (
        ...
    )
select
    id,
    email,
    date_trunc('month', created_at) as signup_month
from paying_customers
where email in (
        'user-1@example.com',
        'user-2@example.com',
        'user-3@example.com'
    )
```

<br>

#### `select`:
  - Sí hay solo una columna ponerla al mismo nivel que el `select`.
  - Sí hay multiples columnas, poner cada una en una linea, incluida la primera e indentar un nivel más que el `select`.
  - Si hay un `distinct` qualifier, ponerlo en el mismo nivel que el`select`.

```sql
/* Recomendado */
select id

/* Recomendado */
select
    id
    , email

/* No recomendado */
select id, email

/* No recomendado */
select id
    , email

/* Recomendado */
select distinct country

/* Recomendado */
select distinct
    state
    , country

/* No recomendado */
select distinct state, country
```

<br>

#### `from`:
  - Poner la tabla inicial en la misma linea que el`from`.
  - Si hay otras tablas en el join:
    - Poner cada `join` en su propia linea, en el mismo nivel de indentation que el `from`.
    - Sí hay una sola condición de join, ponerlo en la misma linea que el`join`.
    - Si hay multiples condiciones, terminar el `join` con `on` y poner cada condition una linea mas, incluido la primera condición, inventada un nivel más.

```sql
/* Recomendado */
from customers

/* Recomendado */
from customers
left join orders on customers.id = orders.customer_id

/* No recomendado */
from customers
    left join orders on customers.id = orders.customer_id

/* No recomendado */
from customers
left join orders
    on customers.id = orders.customer_id

/* Recomendado */
from customers
left join orders on
    customers.id = orders.customer_id
    and customers.region_id = orders.region_id

/* No recomendado */
from customers
left join orders on customers.id = orders.customer_id
    and customers.region_id = orders.region_id

/* No recomendado */
from customers
left join orders
    on customers.id = orders.customer_id
    and customers.region_id = orders.region_id
```

<br>

#### `where`:
  - Sí hay una sola condición ponerla en la misma linea que el`where`.
  - Sí hay más de una columna ponerlo cada uno en su respectiva linea e indentedo con respecto al  `where`.

```sql
/* Recomendado */
where email like '%@domain.com'

/* Recomendado */
where
    email like '%@domain.com'
    and plan_name != 'free'

/* No recomendado */
where email like '%@domain.com' and plan_name != 'free'

/* No recomendado */
where email like '%@domain.com'
    and plan_name != 'free'
```

<br>

#### `group by` y `order by`:
  - Evitar agrupa/ordena con numeros.
    - Puede haber problemas si cambiamos las columnas pero no editamos las columnas referenciadas en el `group by`/`order by` haciendo que ordenemos/agrupemos por columnas indeseadas.
  - Si se agrupa/ordena por el nombre de la columna:
    - Si hay una sola columna hacerlo al mismo nivel que el `group by`/`order by`.
    - Si hay mas de una columna ponerlo cada uno en su respectiva linea e indentedo con respecto al `group by`/`order by`.

```sql
/* No recomendado */
group by 1, 2, 3

/* No recomendado */
group by
    1
    , 2
    , 3

/* Recomendado */
order by plan_name

/* Recomendado */
order by
    plan_name
    , signup_month

/* No recomendado */
order by plan_name, signup_month

/* Bad */
No recomendado by plan_name
    , signup_month
```

<br>

#### CTEs:en su propia linea, con el nombre del CTE al mismo nivel que el `with`.
  - Agregar un blanco en cada alinea del CTE para marcar la diferencia.
  - Poner comentarios sobre el CTE dentro del paréntesis del CTE al mismo nivel que el `select`.

```sql
/* Recomendado */
with paying_customers as (
        select ...
        from customers
    )

select ...
from paying_customers

/* No recomendado */
with 
  paying_customers as (

    select ...
    from customers

)
select ...
from paying_customers

/* Recomendado */
with paying_customers as (
  select ...
  from customers
    )

, paying_customers_per_month as (
  /* CTE comments... */
  select ...
  from paying_customers
    )

select ...
from paying_customers_per_month

/* No recomendado */
with paying_customers as (

        select ...
        from customers

    )

    /* CTE comments... */
    , paying_customers_per_month as (

        select ...
        from paying_customers

      )

select ...
from paying_customers_per_month
```

<br>

#### `case`:
  - Se puede poner un `case` statement todo en una tunica linea si tiene un unico`when` y la linea no es muy larga.
  - Para `case` statements con multiples lineas:
    - `when`:
      - Cada `when` debe empezar en su propia linea e indentarlo un nivel mas que el `case` statement.
      - Si un `when` tiene multiples condiciones, mantener la primera condicion en la primer linea y poner el resto en sus propias lineas e intentarlas todas al mismo nivel.
    - `then`:
      - Los `then` pueden ir en la misma linea del `when` mientras que la linea sea muy larga.
      - Sino, utilizar el `then` en su propia linea, indentada un nivel mas que el `when` que le corresponde.
      - Si un `then` tiene multiples lineas, cada uno debe tener su propia linea y estar intentada un nivel mas que el `then`.
    - `else`:
      - Un `else` debe ir en su propia linea, al mismo nivel que el `when`.
      - Si un `else` tiene multiples lineas cada linea tienen que estar inventadas un nivel mas que la condición `else`.
    - `end`:
      - El `end` debe tener su propia linea al mismo nivel que la sentencia `case`.
    - Si el `case` esta dentro de una función de agregación se deben cumplir los mismo requisaos mencionados indentado un nivel mas que la función de agregación. 

```sql
/* Recomendado */
select
    case when customers.status_code = 1 then 'Active' else 'Inactive' end as customer_status

/* No recomendado */
select
    case when customers.status_code = 1 and customers.deleted_at is null then 'Active' else 'Inactive' end as customer_status


/* Recomendado */
select
    case
        when customers.status_code = 1 then 'Active'
        else 'Inactive'
    end as customer_status
    , ...

/* No recomendado */
select
    case when customers.status_code = 1 then 'Active'
         else 'Inactive' end as customer_status
    , ...


/* Recomendado */
select
    ...
    , case
        when customers.status_code = 1
            and customers.deleted_at is null
            then 'Active'
        else 'Inactive'
      end as customer_status

/* No recomendado */
select
    ...
    , case
        when customers.status_code = 1 and customers.deleted_at is null
        then 'Active'
        else 'Inactive'
    end as customer_status


/* Recomendado */
select
    ...
    , sum(
        case
            when customers.status_code = 1
                and customers.deleted_at is null
                then customers.lifetime_value
            else 0
        end
      ) as active_customers_lifetime_value

/* No recomendado */
select
    ...
    , sum(case
          when customers.status_code = 1 and customers.deleted_at is null then customers.lifetime_value
          else 0
      end) as active_customers_lifetime_value
```

<br>

####  Window functions:
  - Podes poner toda la Window function en una linea sino es muy larga.
  - Si la tenes que dividir en multiples lineas:
    - Poner cada clausula dentro del `over ()` en su propia linea, indentarla un nivel mas de la window function. Ejemplo:
      - `partition by`
      - `order by`
      - `rows between` / `range between`
    - Poner el parentesis final del `over ()` en su propia linea con una indentacion similar a la primera linea de la window function.

```sql

/* Recomendado */
select
    customer_id
    , invoice_number
    , row_number() over (partition by customer_id order by created_at) as order_rank
from orders

/* Recomendado */
select
    customer_id
    , invoice_number
    , row_number() over (
        partition by customer_id
        order by created_at
      ) as order_rank
from orders

/* No recomendado */
select
    customer_id
    , invoice_number
    , row_number() over (partition by customer_id
                         order by created_at) as order_rank
from orders
```

<br>

#### `in` lists:
  - Mostrar los valores de una lista en multiples lineas cuando es muy larga.

```sql
/* Recomendado */
where email in (
        'user-1@example.com'
        , 'user-2@example.com'
        , 'user-3@example.com'
    )

/* No recomendado */
where email in ('user-1@example.com', 'user-2@example.com', 'user-3@example.com')
```

<br>

#### No poner espacios extras dentro del paréntesis.
```sql
/* No recomendado */
select *
from customers
where plan_name in ( 'monthly', 'yearly' )

/* Recomendado */
select *
from customers
where plan_name in ('monthly', 'yearly')
```

<br>

## Creditos

Esta guía estuvo inspirada por las siguientes guías:
  - [Brooklyn Analytics](https://github.com/brooklyn-data/co/blob/main/sql_style_guide.md)
  - [Fishtown Analytics' dbt coding conventions](https://github.com/fishtown-analytics/corp/blob/b5c6f55b9e7594e1a1e562edf2378b6dd78a1119/dbt_coding_conventions.md)
  - [Matt Mazur's SQL style guide](https://github.com/mattm/sql-style-guide/blob/3eaef3519ca5cc7f21feac6581b257638f9b1564/README.md)
  - [GitLab's SQL style guide](https://about.gitlab.com/handbook/business-ops/data-team/sql-style-guide/)
